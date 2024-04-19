import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:selpar/screen/preloading_screen/preloading_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Selpar',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('tr', 'TR'),
          Locale('en', 'US'),
          Locale('de', 'DE'),
          Locale('ru', 'Ru'),
          Locale('nl', 'BE')
        ],
        locale: const Locale('tr', 'TR'),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.transparent, background: Colors.white),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: PreloadingScreen());
  }
}
