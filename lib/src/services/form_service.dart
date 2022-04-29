import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rombmarketingstrategy/src/models/form_data.dart';
import 'package:rombmarketingstrategy/src/services/local_storage_service.dart';

class FormService {
  FormService._();
  static late CollectionReference collection;
  static List<FormData> formDatas = [];

  static Future<void> init() async {
    collection = FirebaseFirestore.instance.collection('form');
  }

  static Future<void> addFormData(FormData formData) async {
    await collection.add(formData.toMap());
  }

  static Future<void> addSavedFormData() async {
    final allData = LocalStorageService.dataToSend;
    for (final formData in allData) {
      await collection.add(formData.toMap());
    }
    LocalStorageService.clear();
  }
}
