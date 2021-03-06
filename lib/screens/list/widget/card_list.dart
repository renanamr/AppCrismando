import 'package:bem_aventurancas/model/DailyLiturgy.dart';
import 'package:bem_aventurancas/screens/dailyLiturgy/daily_liturgy_screens.dart';
import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  final Animation<double> listSlidePosition;
  final DailyLiturgy dailyLiturgy;

  CardList({@required this.listSlidePosition,@required this.dailyLiturgy,});

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: widget.listSlidePosition.value),
      child: ListTile(
        onTap: () { Navigator.push(context, MaterialPageRoute(builder:(_)=> DailyLiturgyScreen(edit: true, dailyLiturgy: widget.dailyLiturgy,)));},
        title: Text(
          "${widget.dailyLiturgy.title}",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
