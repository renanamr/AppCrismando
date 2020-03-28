import 'package:bem_aventurancas/model/DailyLiturgy.dart';
import 'package:flutter/material.dart';

class ContainerAsk extends StatefulWidget {
  @override
  _ContainerAskState createState() => _ContainerAskState();
}

class _ContainerAskState extends State<ContainerAsk> {

  TextEditingController answerController1 = TextEditingController();
  TextEditingController answerController2 = TextEditingController();
  TextEditingController answerController3 = TextEditingController();
  TextEditingController answerController4 = TextEditingController();

  _registerDiary(){
    DailyLiturgy dailyLiturgy = DailyLiturgy(
      "",
      "",
      answer1: answerController1.text,
      answer2: answerController2.text,
      answer3: answerController3.text,
      answer4: answerController4.text,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            Text(
              "Perguntas:",
              style: TextStyle(
                  color: Color.fromRGBO(128, 128, 128, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "1. Qual a mensagem de Deus para mim?",
                style: TextStyle(
                    color: Color.fromRGBO(128, 128, 128, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            TextField(
              cursorColor: Colors.red,
              controller: answerController1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "2. Qual a ordem de Deus?",
                style: TextStyle(
                    color: Color.fromRGBO(128, 128, 128, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            TextField(
              cursorColor: Colors.red,
                controller: answerController2,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "3. Qual a promessa de Deus?",
                style: TextStyle(
                    color: Color.fromRGBO(128, 128, 128, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            TextField(
              cursorColor: Colors.red,
                controller: answerController3,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "4. Como aplicar a mensagem de Deus hoje?",
                style: TextStyle(
                    color: Color.fromRGBO(128, 128, 128, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            TextField(
              cursorColor: Colors.red,
                controller: answerController4,
            ),

            Card(
              margin: EdgeInsets.only(top: 20,bottom: 5),
              color: Color.fromRGBO(169, 26, 54, 1),
              child: FlatButton(
              padding: EdgeInsets.all(15),
                  onPressed: (){_registerDiary();},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Concluir", style: TextStyle(color: Colors.white),)
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

