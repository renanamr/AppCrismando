import 'package:bem_aventurancas/model/DailyLiturgy.dart';
import 'package:bem_aventurancas/model/News.dart';
import 'package:bem_aventurancas/screens/dailyLiturgy/widget/stagger_animation.dart';
import 'package:flutter/material.dart';

class DailyLiturgyScreen extends StatefulWidget {
  final News liturgy;
  final DailyLiturgy dailyLiturgy;
  final bool edit;

  DailyLiturgyScreen({@required this.edit,this.liturgy,this.dailyLiturgy});

  @override
  _DailyLiturgyScreenState createState() => _DailyLiturgyScreenState();
}

class _DailyLiturgyScreenState extends State<DailyLiturgyScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1200)
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggerAnimation(
      controller: _controller.view,
      edit: widget.edit,
      liturgy: widget.liturgy,
      dailyLiturgy: widget.dailyLiturgy,
    );
  }
}