import 'package:bem_aventurancas/model/News.dart';
import 'package:bem_aventurancas/screens/list/widget/card_list.dart';
import 'package:flutter/material.dart';

import 'card_list_news.dart';

class StaggerAnimation extends StatelessWidget {

  final AnimationController controller;
  final bool news;

  StaggerAnimation({@required this.controller,@required this.news}) :
        listSlidePosition = Tween<double>(
            begin: 0,
            end: 5
        ).animate(controller);

  final Animation<double> listSlidePosition;

  List<String> titulos =
  ["Teste1","Teste2","Teste3","Teste4","Teste5","Teste6","Teste7","Teste8"]; //Teste títulos do Diario espiritual

  List<News> listNews =
  [News("Teste 1",description: "Notícia para teste, apes."),News("Teste 2",description: "Notícia para teste, apes2.")]; // Teste de noticias;


  Widget _buildAnimation(BuildContext context, Widget child){
    if(news)
      return _listAnimationNews();
    else
      return _listAnimationDaily();
  }

  Widget _listAnimationDaily(){
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

  Widget _listAnimationNews(){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListView.builder(
            itemCount: listNews.length,
            itemBuilder: (context, index) {
              return CardListNews(listSlidePosition: listSlidePosition,news: listNews[index],);
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