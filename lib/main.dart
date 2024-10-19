import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kojina_project/generated/l10n.dart';
import 'package:kojina_project/screen/faviriote-screen/fav_screen.dart';
import 'package:kojina_project/screen/faviriote-screen/fill_fav_screen.dart';
import 'package:kojina_project/screen/main-screen/kitcen_screen.dart';
import 'package:kojina_project/screen/main-screen/main_screen.dart';

import 'package:kojina_project/screen/notification_screen/notification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isdark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale("ar"),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: KitchenScreen(),
    );
  }
}
