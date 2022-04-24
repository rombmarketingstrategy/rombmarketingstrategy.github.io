import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rombmarketingstrategy/app.dart';
import 'package:rombmarketingstrategy/generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('hr')],
      path: 'assets/translations/',
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}
