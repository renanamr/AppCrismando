import 'package:bem_aventurancas/model/News.dart';
import 'package:bem_aventurancas/screens/home/widget/stagger_animation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final News liturgy;

  Home({@required this.liturgy});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1750)
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
      liturgy: widget.liturgy,
    );
  }
}
