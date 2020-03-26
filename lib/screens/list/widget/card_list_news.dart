import 'package:bem_aventurancas/model/News.dart';
import 'package:flutter/material.dart';

class CardListNews extends StatefulWidget {
  final Animation<double> listSlidePosition;
  final News news;

  CardListNews({@required this.listSlidePosition,@required this.news});

  @override
  _CardListNewsState createState() => _CardListNewsState();
}

class _CardListNewsState extends State<CardListNews> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: widget.listSlidePosition.value),
      child: ListTile(
        onTap: () {
        },
        title: Text(
          "${widget.news.title}",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}