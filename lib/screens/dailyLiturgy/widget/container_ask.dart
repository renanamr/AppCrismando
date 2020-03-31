import 'package:bem_aventurancas/helpers/InformationHelper.dart';
import 'package:bem_aventurancas/model/DailyLiturgy.dart';
import 'package:flutter/material.dart';


class ContainerAsk extends StatefulWidget {

  final DailyLiturgy dailyLiturgy;

  ContainerAsk({@required this.dailyLiturgy});

  @override
  _ContainerAskState createState() => _ContainerAskState();
}

class _ContainerAskState extends State<ContainerAsk> {

  InformationHelper database = InformationHelper();
  TextEditingController answerController1 = TextEditingController();
  TextEditingController answerController2 = TextEditingController();
  TextEditingController answerController3 = TextEditingController();
  TextEditingController answerController4 = TextEditingController();

  _registerDiary() async{

    if(widget.dailyLiturgy.answer1 == null){
      widget.dailyLiturgy.answer1 = answerController1.text;
      widget.dailyLiturgy.answer2 = answerController2.text;
      widget.dailyLiturgy.answer3 = answerController3.text;
      widget.dailyLiturgy.answer4 = answerController4.text;

      database.saveDailyLiturgy(widget.dailyLiturgy);
    }

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();

    if(widget.dailyLiturgy.answer1 != null){
      answerController1.text = widget.dailyLiturgy.answer1;
      answerController2.text = widget.dailyLiturgy.answer2;
      answerController3.text = widget.dailyLiturgy.answer3;
      answerController4.text = widget.dailyLiturgy.answer4;
    }
  }

  @override
  void dispose() {
    super.dispose();
    answerController1.dispose();
    answerController2.dispose();
    answerController3.dispose();
    answerController4.dispose();
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
              keyboardType: TextInputType.multiline,
              maxLines: null,
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
              keyboardType: TextInputType.multiline,
              maxLines: null,
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
              keyboardType: TextInputType.multiline,
              maxLines: null,
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
              keyboardType: TextInputType.multiline,
              maxLines: null,
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

