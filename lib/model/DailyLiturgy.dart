class DailyLiturgy{

  int id;
  String title;
  String date;
  String answer1;
  String answer2;
  String answer3;
  String answer4;

  DailyLiturgy(this.title,this.date,{this.answer1,this.answer2,this.answer3,this.answer4});

  DailyLiturgy.fromMap(Map map){
    this.id = map["id"];
    this.title = map["title"];
    this.date = map["date"];
    this.answer1 = map["answer1"];
    this.answer2 = map["answer2"];
    this.answer3 = map["answer3"];
    this.answer4 = map["answer4"];
  }


  Map toMap(){
    Map<String,dynamic> map = {
      "title" : this.title,
      "date" : this.date,
      "answer1" : this.answer1,
      "answer2" : this.answer2,
      "answer3" : this.answer3,
      "answer4" : this.answer4
    };
    return map;
  }

}