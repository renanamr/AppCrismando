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
          _newsExpanded(context,widget.news);
        },
        title: Text(
          "${widget.news.title}",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

void _newsExpanded(BuildContext context, News news) {
  showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Wrap(children: <Widget>[
          Container(
              color: Color(0xFF737372),
              child: Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(12.0),
                          topRight: const Radius.circular(12.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.arrow_back), onPressed: (){Navigator.of(context).pop();}),
                          Container(
                            width: MediaQuery.of(context).size.width *0.8,
                            child: Padding(padding: EdgeInsets.only(top: 9),
                            child: Text(news.title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),)
                            ))
                        ],
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(12, 8, 10, 20),
                        child: Text(news.description, style: TextStyle(letterSpacing: 0.3, fontWeight: FontWeight.w400, fontSize: 16), textAlign: TextAlign.justify,)
                      )
                    ],
                  )))
        ]);
      });
}

