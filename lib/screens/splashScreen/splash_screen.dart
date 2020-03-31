import 'dart:async';

import 'package:bem_aventurancas/model/News.dart';
import 'package:bem_aventurancas/screens/home/home_screens.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  Firestore _db = Firestore.instance;

  void didChangeDependencies() {
    super.didChangeDependencies();
    _recoverLiturgy();
  }

  _recoverLiturgy() async{

    DocumentSnapshot snapshort = await _db.collection("liturgy").document(DateTime.now().day.toString()).get();

    News liturgy = News.fromMap(snapshort.data);

    if(liturgy == null){
      liturgy = News("Evangelho (Jo 5,31-47)",description: "— O Senhor esteja convosco."
          "\n\n— Ele está no meio de nós."
          "\n\n— PROCLAMAÇÃO do Evangelho de Jesus Cristo + segundo João."
          "\n\n— Glória a vós, Senhor."
          "\n\nNaquele tempo, disse Jesus aos judeus: 31“Se eu der testemunho de mim mesmo, meu testemunho não vale. 32Mas há um outro que dá testemunho de mim, e eu sei que o testemunho que ele dá de mim é verdadeiro. 33Vós mandastes mensageiros a João, e ele deu testemunho da verdade. 34Eu, porém, não dependo do testemunho de um ser humano. Mas falo assim para a vossa salvação. 35João era uma lâmpada que estava acesa e a brilhar, e vós com prazer vos alegrastes por um tempo com a sua luz. 36Mas eu tenho um testemunho maior que o de João; as obras que o Pai me concedeu realizar. As obras que eu faço dão testemunho de mim, mostrando que o Pai me enviou. 37E também o Pai que me enviou dá testemunho a meu favor. Vós nunca ouvistes sua voz, nem vistes sua face, 38e sua palavra não encontrou morada em vós, pois não acreditais naquele que ele enviou. 39Vós examinais as Escrituras, pensando que nelas possuís a vida eterna. No entanto, as Escrituras dão testemunho de mim, 40mas não quereis vir a mim para ter a vida eterna! 41Eu não recebo a glória que vem dos homens. 42Mas eu sei que não tendes em vós o amor de Deus. 43Eu vim em nome do meu Pai, e vós não me recebeis. Mas, se um outro viesse em seu próprio nome, a este vós o receberíeis. 44Como podereis acreditar, vós que recebeis glória uns dos outros e não buscais a glória que vem do único Deus? 45Não penseis que eu vos acusarei diante do Pai. Há alguém que vos acusa: Moisés, no qual colocais a vossa esperança. 46Se acreditásseis em Moisés, também acreditaríeis em mim, pois foi a respeito de mim que ele escreveu. 47Mas se não acreditais nos seus escritos, como acreditareis então nas minhas palavras?"
          "\n\n— Palavra da Salvação."
          "\n\n— Glória a vós, Senhor.");
    }

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Home(liturgy: liturgy,)));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color.fromRGBO(139, 14, 18, 1),
          padding: EdgeInsets.all(60),
          child: Center(
            child: Image.asset("assets/imagens/icon_square.png"),
      ),
    ));
  }
}
