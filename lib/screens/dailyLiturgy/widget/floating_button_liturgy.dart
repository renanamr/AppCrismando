import 'package:bem_aventurancas/model/News.dart';
import 'package:bem_aventurancas/screens/bottom_sheet.dart';
import 'package:flutter/material.dart';

class FloatingButtonLiturgy extends StatefulWidget {

  final bool edit;
  final News liturgy;

  FloatingButtonLiturgy({@required this.edit,@required this.liturgy});

  @override
  _FloatingButtonLiturgyState createState() => _FloatingButtonLiturgyState();
}

class _FloatingButtonLiturgyState extends State<FloatingButtonLiturgy> {
  @override
  Widget build(BuildContext context) {
    if(widget.edit)
      return Container();
    else
      return FloatingActionButton(
        backgroundColor: Color.fromRGBO(169, 26, 54, 1),
        onPressed: (){bottomSheet b =bottomSheet(); b.newsExpanded(context, widget.liturgy);},
        child: Icon(Icons.chrome_reader_mode),
      );
  }
}
