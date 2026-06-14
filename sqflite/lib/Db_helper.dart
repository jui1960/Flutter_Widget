import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

  DbHelper._();

  static final DbHelper getInstance = DbHelper._();

  Database? myDb;

    Future<Database>  getDb() async{
    if(myDb != null){
      return myDb!;
    }
    else{
      myDb = await openDb();
      return myDb!;
    }

  }

  Future<Database> openDb() async{
     Directory appDir = await getApplicationDocumentsDirectory();
     String dbpath = join(appDir.path,"noteDb");
     openDatabase(dbpath,onCreate: (db,version){

     } ,version: 1);


  }

}