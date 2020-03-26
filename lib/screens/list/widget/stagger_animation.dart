import 'package:bem_aventurancas/screens/list/widget/card_list.dart';
import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {

  final AnimationController controller;

  StaggerAnimation({@required this.controller}) :
        listSlidePosition = Tween<double>(
            begin: 0,
            end: 5
        ).animate(controller);

  final Animation<double> listSlidePosition;

  List<String> titulos = ["Teste1","Teste2","Teste3","Teste4","Teste5","Teste6","Teste7","Teste8"];


  Widget _buildAnimation(BuildContext context, Widget child){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListView.builder(
                itemCount: titulos.length,
                itemBuilder: (context, index) {
                  return CardList(listSlidePosition: listSlidePosition,titulo: titulos[index],);
                })
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
      body: Container(
          padding: EdgeInsets.all(5),
          child: AnimatedBuilder(
              animation: controller,
              builder: _buildAnimation
          ),
        ),
    );
  }
}