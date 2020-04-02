import 'package:bem_aventurancas/model/DailyLiturgy.dart';
import 'package:bem_aventurancas/model/News.dart';
import 'package:bem_aventurancas/screens/list/widget/card_list.dart';
import 'package:bem_aventurancas/screens/list/widget/icon_bar_button.dart';
import 'package:flutter/material.dart';

import 'card_list_news.dart';

class StaggerAnimation extends StatelessWidget {

  final AnimationController controller;
  final News liturgy;
  final bool news;
  final List<DailyLiturgy> listDailyLiturgy;
  final List<News> listNews;

  StaggerAnimation({@required this.controller, @required this.listDailyLiturgy,
    @required this.listNews,@required this.news, this.liturgy}) :
        listSlidePosition = Tween<double>(
            begin: 0,
            end: 5
        ).animate(controller);


  final Animation<double> listSlidePosition;

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
              return CardList(listSlidePosition: listSlidePosition,dailyLiturgy: listDailyLiturgy[index]);
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
        title: Image.asset("assets/imagens/cmslogo.jpg", fit: BoxFit.cover, height: 50,),
        actions: <Widget>[
          IconBarButton(news: news,liturgy: liturgy,)
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