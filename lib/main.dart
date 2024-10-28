import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kojina_project/generated/l10n.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/provider/auth_provider.dart';
import 'package:kojina_project/provider/base_provider.dart';
import 'package:kojina_project/provider/favorite_provider.dart';
import 'package:kojina_project/provider/meals_provider.dart';
import 'package:kojina_project/screen/auth-screen/login_screen.dart';
import 'package:kojina_project/screen/auth-screen/splash_screen.dart';

import 'package:kojina_project/screen/main-screen/main_screen.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BaseProvider>(
          create: (context) => BaseProvider(),
        ),
        ChangeNotifierProvider<FavoriteProvider>(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (context) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider<MealsProvider>(
          create: (context) => MealsProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.cairo().fontFamily,
        ),
        locale: const Locale("ar"),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        // !splash screen ? splash screen : countine your shit
      ),
    );
  }
}

// when enable auth  uncomment this code

class ScreenRouter extends StatefulWidget {
  const ScreenRouter({super.key});

  @override
  State<ScreenRouter> createState() => _ScreenRouterState();
}

class _ScreenRouterState extends State<ScreenRouter> {
  @override
  void initState() {
    Provider.of<AuthenticationProvider>(context, listen: false)
        .initializeAuthProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
        builder: (context, authenticationConsumer, child) {
      return AnimatedSwitcher(
        duration: animationDuration,
        child:
            authenticationConsumer.authenticated ? MainScreen() : LoginScreen(),
      );
    });
  }
}
