import 'dart:convert';

import 'package:rombmarketingstrategy/src/models/form_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const _kDataKey = 'unsent-form-data';
  static late SharedPreferences _sharedPrefs;
  static final List<FormData> _dataToSend = [];

  LocalStorageService._();

  static Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
    final encodedData = _sharedPrefs.getString(_kDataKey) ?? '[]';
    final currentList =
        (jsonDecode(encodedData) as List<dynamic>).map((e) => FormData.fromMap(e as Map<String, dynamic>)).toList();
    _dataToSend.addAll(currentList);
  }

  static Future<void> clear() async {
    _dataToSend.clear();
    _sharedPrefs.setString(_kDataKey, '[]');
  }

  static Future<void> addNewData(FormData newData) async {
    _dataToSend.add(newData);
    _sharedPrefs.setString(_kDataKey, jsonEncode(_dataToSend.map((e) => e.toMap()).toList()));
  }

  static List<FormData> get dataToSend => [..._dataToSend];
  static int get dataLength => _dataToSend.length;
  static bool get dataIsEmpty => _dataToSend.isEmpty;
}
