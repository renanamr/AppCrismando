import 'package:bem_aventurancas/model/DailyLiturgy.dart';
import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  final Animation<double> listSlidePosition;
  final DailyLiturgy dailyLiturgy;

  CardList({@required this.listSlidePosition,@required this.dailyLiturgy});

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: widget.listSlidePosition.value),
      child: ListTile(
        onTap: () {
        },
        title: Text(
          "${widget.dailyLiturgy.title}",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
