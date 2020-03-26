class News{

  int id;
  String title;
  String description;

  News(this.title,{this.description});

  News.fromMap(Map map){
    this.id = map["id"];
    this.title = map["title"];
    this.description = map["description"];
  }


  Map toMap(){
    Map<String,dynamic> map = {
      "title" : this.title,
      "description" : this.description,
    };
    return map;
  }

}