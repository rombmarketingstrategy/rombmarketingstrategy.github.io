import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:rombmarketingstrategy/src/models/form_data.dart';
import 'package:rombmarketingstrategy/src/services/local_storage_service.dart';

class FormService {
  FormService._();
  static CollectionReference? collection;
  static List<FormData> formDatas = [];

  static Future<void> init() async {
    if (await hasInternet()) {
      collection = FirebaseFirestore.instance.collection('form');
    }
  }

  static Future<void> addFormData(FormData formData) async {
    if (!(await hasInternet())) return LocalStorageService.addNewData(formData);

    if (collection == null) init();
    await collection?.add(formData.toMapForFirebase());
  }

  static Future<void> addSavedFormData() async {
    if (collection == null) init();
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

  static Future<bool> hasInternet() async {
    if (kIsWeb) return true;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
