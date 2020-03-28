import 'package:bem_aventurancas/model/DailyLiturgy.dart';
import 'package:bem_aventurancas/model/News.dart';
import 'package:bem_aventurancas/screens/dailyLiturgy/widget/container_ask.dart';
import 'package:flutter/material.dart';

import 'floating_button_liturgy.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final bool edit;
  final News liturgy;
  final DailyLiturgy dailyLiturgy;

  StaggerAnimation({@required this.controller,@required this.edit, this.liturgy, this.dailyLiturgy})
      : liturgyGrow =
            Tween<double>(begin: 0, end: 1000).animate(controller);

  final Animation<double> liturgyGrow;

  Widget _buildForm(BuildContext context){
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height *0.2,
          color: Color.fromRGBO(169, 26, 54, 1),
        ),
        Padding(padding: EdgeInsets.fromLTRB(15, MediaQuery.of(context).size.height *0.1, 15, 5),
          child: ContainerAsk(dailyLiturgy: DailyLiturgy(liturgy.title, "")),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child:SingleChildScrollView( child: _buildForm(context),
        ),
      ),
      floatingActionButton: FloatingButtonLiturgy(edit: edit,liturgy: liturgy,),
    );
  }
}
