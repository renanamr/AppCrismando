import 'dart:async';

import 'package:bem_aventurancas/screens/home/home_screens.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color.fromRGBO(169, 26, 54, 1),
          padding: EdgeInsets.all(60),
          child: Center(
            child: Image.asset("assets/imagens/icon.png"),
      ),
    ));
  }
}
