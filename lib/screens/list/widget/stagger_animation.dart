import 'package:bem_aventurancas/model/DailyLiturgy.dart';
import 'package:bem_aventurancas/model/News.dart';
import 'package:bem_aventurancas/screens/list/widget/card_list.dart';
import 'package:bem_aventurancas/screens/list/widget/icon_bar_button.dart';
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

  List<DailyLiturgy> listDailyLiturgy =
  [DailyLiturgy("Teste1","12/10/2020"),DailyLiturgy("Teste2","11/10/2020"),DailyLiturgy("Teste3","13/10/2020")]; //Teste dias do Diario espiritual

  List<News> listNews =
  [News("Teste 1, com palavras grandes para ver alinhamento",description: "Notícia para teste, apes.Notícia para teste, apes.vvvNotícia para teste, apes.Notícia para teste, apes.Notícia para teste, apes.Notícia para teste, apes.Notícia para teste, apes.Notícia para teste, apes.Notícia para teste, apes.Notícia para teste, apes.Notícia para teste, apes.Notícia para teste, apes.Notícia para teste, apes."),News("Teste 2",description: "Notícia para teste, apes2.")]; // Teste de noticias;


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
            itemCount: listDailyLiturgy.length,
            itemBuilder: (context, index) {
              return CardList(listSlidePosition: listSlidePosition,dailyLiturgy: listDailyLiturgy[index],);
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
        actions: <Widget>[
          IconBarButton(news: news,)
        ],
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