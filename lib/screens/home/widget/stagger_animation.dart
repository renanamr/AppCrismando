import 'package:bem_aventurancas/model/News.dart';
import 'package:bem_aventurancas/screens/home/widget/button_options.dart';
import 'package:bem_aventurancas/screens/list/list_screen.dart';
import 'package:flutter/material.dart';

import '../../bottom_sheet.dart';

class StaggerAnimation extends StatelessWidget {

  final AnimationController controller;
  final News liturgy;

  StaggerAnimation({@required this.controller,@required this.liturgy}) :
        listSlidePosition = Tween<double>(
            begin: 0,
            end: 145
        ).animate(controller);

  final Animation<double> listSlidePosition;

  Widget _buildAnimation(BuildContext context, Widget child){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ButtonOptions(icon: Icons.notifications, text: "Avisos e Notícias", function: (){Navigator.of(context).push(MaterialPageRoute(builder: (_) => ListScreen(news: true,)));}, marginBottom: listSlidePosition.value * 0,),
        ButtonOptions(icon: Icons.chrome_reader_mode, text: "Leitura Diaria", function: (){bottomSheet b = bottomSheet(); b.newsExpanded(context,liturgy);}, marginBottom: listSlidePosition.value * 1,),
        ButtonOptions(icon: Icons.book, text: "Diario Espiritual", function: (){ Navigator.of(context).push(MaterialPageRoute(builder: (_) => ListScreen(news: false,liturgy:liturgy)));}, marginBottom: listSlidePosition.value * 2,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset("assets/imagens/cmslogo.jpg", fit: BoxFit.cover, height: 50,),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          child: AnimatedBuilder(
              animation: controller,
              builder: _buildAnimation
          ),
        ),
      ),
    );
  }
}
