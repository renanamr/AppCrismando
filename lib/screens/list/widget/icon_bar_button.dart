import 'package:bem_aventurancas/model/News.dart';
import 'package:bem_aventurancas/screens/dailyLiturgy/daily_liturgy_screens.dart';
import 'package:flutter/material.dart';

class IconBarButton extends StatelessWidget {
  final bool news;
  final News liturgy;

  IconBarButton({@required this.news,@required this.liturgy});

  @override
  Widget build(BuildContext context) {
    if(news){
      return Container();
    }else{
      return IconButton(
          icon: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(_)=> DailyLiturgyScreen(edit: false,liturgy: liturgy,)));}
            );
    }
  }
}
