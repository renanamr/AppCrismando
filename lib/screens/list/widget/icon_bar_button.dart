import 'package:bem_aventurancas/screens/home/home_screens.dart';
import 'package:flutter/material.dart';

class IconBarButton extends StatelessWidget {
  final bool news;

  IconBarButton({@required this.news});

  @override
  Widget build(BuildContext context) {
    if(news){
      return Container();
    }else{
      return IconButton(icon: Icon(Icons.add), onPressed: (){});
    }
  }
}
