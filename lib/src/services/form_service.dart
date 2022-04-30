import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rombmarketingstrategy/src/models/form_data.dart';
import 'package:rombmarketingstrategy/src/services/local_storage_service.dart';

class FormService {
  FormService._();
  static CollectionReference? collection;
  static List<FormData> formDatas = [];

  static Future<void> init() async {
    if (await InternetConnectionChecker().hasConnection) {
      collection = FirebaseFirestore.instance.collection('form');
    }
  }

  static Future<void> uploadFile(Uint8List file, String id) async {
    final Reference ref = FirebaseStorage.instance.ref().child('signatures').child('/$id.jpg');
    await ref.putData(file, SettableMetadata(contentType: 'image/jpeg'));
  }

  static Future<bool> addFormData(FormData formData) async {
    try {
      if (!(await InternetConnectionChecker().hasConnection)) {
        LocalStorageService.addNewData(formData);
        return true;
      }

      if (collection == null) init();

      final document = await collection?.add(formData.toMapForFirebase());
      if (document == null) return false;
      await uploadFile(formData.png, document.id);

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> addSavedFormData() async {
    if (collection == null) init();
    if (!(await InternetConnectionChecker().hasConnection)) return;

    final allData = LocalStorageService.dataToSend;
    final List<Future> futures = [];
    for (final formData in allData) {
      futures.add(() async {
        addFormData(formData);
      }());
    }
    await Future.wait(futures);
    LocalStorageService.clear();
  }
}
