import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sweetsstore/core/routes/app_routes.dart';

class SweetsApp extends StatelessWidget {
  const SweetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mitch Designs Assignment',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: routes,
    );
  }
}
