import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ButtonOptions extends StatefulWidget {

  final IconData icon;
  final String text;
  final Function function;
  final double marginBottom;

  ButtonOptions({@required this.icon,@required this.text,@required this.function,@required this.marginBottom});

  @override
  _ButtonOptionsState createState() => _ButtonOptionsState();
}

class _ButtonOptionsState extends State<ButtonOptions> {


  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only( bottom: widget.marginBottom),
        color: Color.fromRGBO(169, 26, 54, 1),
        child: FlatButton(
          padding: EdgeInsets.all(0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(widget.icon,color: Colors.white,size: 40,),
                  ),
                  Text(widget.text, style: TextStyle(color: Colors.white),)
                ],
              )
          ),
          onPressed: (){
            widget.function();
          },
        )
    );
  }
}
