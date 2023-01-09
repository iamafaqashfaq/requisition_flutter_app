import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:requisition_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Requisition App',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.blue),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.bigStone,
      ),
      themeMode: ThemeMode.system,
      home: const SplashScreenView(),
    );
  }
}
