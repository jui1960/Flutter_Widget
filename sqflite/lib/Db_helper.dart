import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{



  // ১. প্রাইভেট কনস্ট্রাক্টর (যাতে বাইরে থেকে এই ক্লাসের অবজেক্ট তৈরি করা না যায়)
  DbHelper._();
  //static final ektdhoroner instane,, class er object create kora sarai access kora jai..singletone

  static final DbHelper getInstance = DbHelper._();


  static final TABLE_NOTE = 'note';
  static final COLUMN_SERIAL_NO = 'a_no';
  static final COLUMN_NOTE_TITLe = 'title';
  static final COLUMN_NOTE_DESC = 'details';

// ৪. ডাটাবেজ অবজেক্ট হোল্ডার (শুরুতে এটি null থাকবে)
  Database? myDb;

    Future<Database>  getDb() async{
      myDb = myDb ?? await openDb();
      return myDb!;
      /*if(myDb != null){
      return myDb!;
    }
    else{
      myDb = await openDb();
      return myDb!;
    }*/

  }

  Future<Database> openDb() async{
      // ফোনের ভেতরে অ্যাপের জন্য নিরাপদ ডিরেক্টরি বা ফোল্ডার খুঁজে বের করা
     Directory appDir = await getApplicationDocumentsDirectory();
     String dbpath = join(appDir.path,"noteDb");
     // ডাটাবেজ ওপেন করা (প্রথমবার হলে onCreate রান হবে)
     return await openDatabase(
       dbpath,
       version: 1,
       onCreate: (db, version) {
         db.execute(
             "create table $TABLE_NOTE ($COLUMN_SERIAL_NO integer primary key autoincrement,$COLUMN_NOTE_TITLe text,$COLUMN_NOTE_DESC text)");
       },
     );
  }

  //insert

  Future<bool> addNote(
      {required String Mtitle, required String Mdetails}) async {
    var db = await getDb();
    int rowsEffected = await db.insert(TABLE_NOTE, {
      COLUMN_NOTE_TITLe: Mtitle,
      COLUMN_NOTE_DESC: Mdetails
    });
    return rowsEffected > 0;
  }

  //fetch data\

  Future<List<Map<String, dynamic>>> FetchAllNote() async {
    var db = await getDb();
    //select from note
    List<Map<String, dynamic>> mData = await db.query(TABLE_NOTE);
    return mData;
  }



}