import 'package:bem_aventurancas/helpers/InformationHelper.dart';
import 'package:bem_aventurancas/model/DailyLiturgy.dart';
import 'package:bem_aventurancas/model/News.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'widget/stagger_animation.dart';
import 'package:flutter/material.dart';


class ListScreen extends StatefulWidget {

  final bool news;
  final News liturgy;

  ListScreen({@required this.news,this.liturgy});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen>  with SingleTickerProviderStateMixin {

  AnimationController _controller;

  var _database = InformationHelper();

  List<DailyLiturgy> listDailyLiturgy = List<DailyLiturgy>();
  List<News> listNews = List<News>();

  @override
  void initState() {
    super.initState();

    if(widget.news)
      _initializeListNews();
    else
      _initializeListDailyLiturgy();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 900)
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _initializeListNews() async{
    Firestore _db = Firestore.instance;

    QuerySnapshot querySnapshot = await _db.collection("news").limit(10).getDocuments();
    List<News> listTemporary = List<News>();

    for(var item in querySnapshot.documents){
      News news = News.fromMap(item.data);
      listTemporary.add(news);
    }

    setState(() {
      listNews = listTemporary;
    });

    listTemporary=null;
  }

  _initializeListDailyLiturgy() async {
    List dailyLiturgyRec = await _database.listDailyLiturgy();
    List<DailyLiturgy> listTemporary = List<DailyLiturgy>();

    for (var item in dailyLiturgyRec) {
      DailyLiturgy dailyLiturgy = DailyLiturgy.fromMap(item);
      listTemporary.add(dailyLiturgy);
    }
    setState(() {
      listDailyLiturgy = listTemporary;
    });

    listTemporary = null;
  }

  @override
  Widget build(BuildContext context) {
    return StaggerAnimation(
      controller: _controller.view,
      news: widget.news,
      liturgy: widget.liturgy,
      listDailyLiturgy: listDailyLiturgy,
      listNews: listNews,
    );
  }
}