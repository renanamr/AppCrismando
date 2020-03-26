import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  final Animation<double> listSlidePosition;
  final String titulo;

  CardList({@required this.listSlidePosition,@required this.titulo});

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
          "${widget.titulo}",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
