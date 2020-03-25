import 'package:bem_aventurancas/screens/home/widget/button_options.dart';
import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {

  final AnimationController controller;

  StaggerAnimation({@required this.controller}) :
        listSlidePosition = Tween<double>(
            begin: 0,
            end: 145
        ).animate(controller);

  final Animation<double> listSlidePosition;

  Widget _buildAnimation(BuildContext context, Widget child){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ButtonOptions(icon: Icons.notifications, text: "Avisos e Notícias", function: (){}, marginBottom: listSlidePosition.value * 0,),
        ButtonOptions(icon: Icons.chrome_reader_mode, text: "Leitura Diaria", function: (){}, marginBottom: listSlidePosition.value * 1,),
        ButtonOptions(icon: Icons.book, text: "Diario Espiritual", function: (){}, marginBottom: listSlidePosition.value * 2,),
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
        title: Image.asset("assets/imagens/cmslogo.jpg"),
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
