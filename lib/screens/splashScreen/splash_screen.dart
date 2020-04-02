import 'dart:async';

import 'package:bem_aventurancas/model/News.dart';
import 'package:bem_aventurancas/screens/home/home_screens.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  Firestore _db = Firestore.instance;


  void didChangeDependencies() {
    super.didChangeDependencies();
    _recoverLiturgy();
  }


  _recoverLiturgy() async{

    DocumentSnapshot snapshort = await _db.collection("liturgy").document(DateTime.now().day.toString()).get();

    News liturgy = News.fromMap(snapshort.data);

    if(liturgy == null){
      liturgy = News("Na espera do anjo.",description: "O evangelho ainda não foi postado");
    }

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Home(liturgy: liturgy,)));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color.fromRGBO(139, 14, 18, 1),
          padding: EdgeInsets.all(60),
          child: Center(
            child: Image.asset("assets/imagens/icon_square.png"),
      ),
    ));
  }
}
