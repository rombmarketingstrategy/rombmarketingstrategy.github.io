import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> hasInternet() async {
  if (kIsWeb) return true;
  return await InternetConnectionChecker().hasConnection;
}
