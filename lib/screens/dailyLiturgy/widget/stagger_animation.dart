import 'package:bem_aventurancas/model/DailyLiturgy.dart';
import 'package:bem_aventurancas/model/News.dart';
import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final News liturgy;
  final DailyLiturgy dailyLiturgy;

  StaggerAnimation({@required this.controller, this.liturgy, this.dailyLiturgy})
      : liturgyGrow =
            Tween<double>(begin: 0, end: 1000).animate(controller);

  final Animation<double> liturgyGrow;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset("assets/imagens/cmslogo.jpg"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
        ),
      ),
    );
  }
}
