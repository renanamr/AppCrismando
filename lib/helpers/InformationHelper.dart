import 'package:bem_aventurancas/model/DailyLiturgy.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class InformationHelper {
  static final String nameTable = "dailyLiturgy";
  static final InformationHelper _informationHelper = InformationHelper._internal();
  Database _db;


  factory InformationHelper(){
    return _informationHelper;
  }

  InformationHelper._internal(){}

  get db async{

    if(_db != null){
      return _db;
    }else{
      _db = await inicializarDB();
      return _db;
    }
  }

  _onCreate(Database db, int version) async{

    String sql= "CREATE TABLE $nameTable (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR, date VARCHAR, answer1 VARCHAR, answer2 VARCHAR, answer3 VARCHAR, answer4 VARCHAR)";

    await db.execute(sql);
  }

  inicializarDB() async{
    final pathDatabase = await getDatabasesPath();
    final placeDatabase = join(pathDatabase,"database_information.db");

    var db = await openDatabase(
        placeDatabase, version: 1, onCreate: _onCreate
    );
    return db;
  }


  Future<int> saveDailyLiturgy(DailyLiturgy dailyLiturgy) async{
    var database = await db;
    return await database.insert(nameTable, dailyLiturgy.toMap());
  }

  listDailyLiturgy() async{
    var database = await db;
    String sql="SELECT * FROM $nameTable ORDER BY UPPER(title) DESC";
    List dailyLiturgy = await database.rawQuery(sql);
    return dailyLiturgy;

  }

  Future<int> updateDailyLiturgy(DailyLiturgy dailyLiturgy) async{
    var database = await db;
    return await database.update(nameTable, dailyLiturgy.toMap(), where: "id = ?", whereArgs : [dailyLiturgy.id]);
  }

  Future<int> removeDailyLiturgy(int id) async{
    var database = await db;
    return await database.delete(nameTable,where: "id = ?", whereArgs:[id]);
  }
}