import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rombmarketingstrategy/src/models/form_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormService {
  FormService._();
  static late CollectionReference collection;
  static late SharedPreferences _sharedPrefs;
  static List<FormData> formDatas = [];

  static Future<void> init() async {
    collection = FirebaseFirestore.instance.collection('form');
  }

  static Future<void> addFormData(FormData formData) async {
    await collection.add({...formData.toMap()});
  }
}
