import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sweetsstore/core/di/dependency_injection.dart';
import 'package:sweetsstore/sweets_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  setupDependencyInjection();

  // Init Translations
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      startLocale: const Locale('ar'),
      fallbackLocale: const Locale('ar', 'EG'),
      child: const SweetsApp()));
}