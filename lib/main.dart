import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_world/login.dart';
import 'package:my_world/registro.dart';
import 'package:my_world/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My World',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("es", "CO"),
        Locale("en","US"),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const splash(),
    );
  }
}