import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rombmarketingstrategy/app.dart';
import 'package:rombmarketingstrategy/firebase_options.dart';
import 'package:rombmarketingstrategy/generated/codegen_loader.g.dart';
import 'package:rombmarketingstrategy/src/services/form_service.dart';
import 'package:rombmarketingstrategy/src/services/local_storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('hr')],
      path: 'assets/translations/',
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
  FormService.init();
  LocalStorageService.init();
}
