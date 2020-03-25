import 'package:bem_aventurancas/screens/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bem-Aventuranças',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}