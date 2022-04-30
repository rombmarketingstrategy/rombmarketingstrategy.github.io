import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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

      if (!(await InternetConnectionChecker().hasConnection)) {

    if (collection == null) init();
    await collection?.add(formData.toMapForFirebase());
  }

  static Future<void> addSavedFormData() async {
    if (collection == null) init();
    if (!(await InternetConnectionChecker().hasConnection)) return;

    final allData = LocalStorageService.dataToSend;
    final List<Future> futures = [];
    for (final formData in allData) {
      futures.add(() async {
        await collection?.add(formData.toMapForFirebase());
      }());
    }
    await Future.wait(futures);
    LocalStorageService.clear();
  }
}
