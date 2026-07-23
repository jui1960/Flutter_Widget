import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static final DbHelper getInstance = DbHelper._();

  static final TABLE_NAME = 'expense';
  static final COLUMN_SERIAL_NO = 'a_no';
  static final COLUMN_TITLE = 'title';
  static final COLUMN_DESC = 'details';
  static final COLUMN_PRICE = 'price';
  static final COLUMN_DATE = 'date';
  static final COLUMN_USER_EMAIL = 'user_email';

  Database? myDb;

  Future<Database> getDb() async {
    myDb = myDb ?? await openDb();
    return myDb!;
  }

  Future<Database> openDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();

    String dbpath = join(appDir.path, "expenseDb");

    return await openDatabase(
      dbpath,
      version: 2,
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE $TABLE_NAME ("
                "$COLUMN_SERIAL_NO INTEGER PRIMARY KEY AUTOINCREMENT, "
                "$COLUMN_TITLE TEXT, "
                "$COLUMN_DESC TEXT, "
                "$COLUMN_PRICE TEXT, "
                "$COLUMN_DATE TEXT, "
                "$COLUMN_USER_EMAIL TEXT)"
        );
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < 2) {
          db.execute("ALTER TABLE $TABLE_NAME ADD COLUMN $COLUMN_USER_EMAIL TEXT");
        }
      },
    );
  }

  Future<bool> addExpense({
    required String mTitle,
    required String mDetails,
    required String mPrice,
    required String mDate,
    required String mEmail,
  }) async {
    var db = await getDb();
    int rowsEffected = await db.insert(TABLE_NAME, {
      COLUMN_TITLE: mTitle,
      COLUMN_DESC: mDetails,
      COLUMN_PRICE: mPrice,
      COLUMN_DATE: mDate,
      COLUMN_USER_EMAIL: mEmail,
    });
    return rowsEffected > 0;
  }

  Future<List<Map<String, dynamic>>> fetchAllExpense({required String email}) async {
    var db = await getDb();
    List<Map<String, dynamic>> mData = await db.query(
      TABLE_NAME,
      where: "$COLUMN_USER_EMAIL = ?",
      whereArgs: [email],
      orderBy: "$COLUMN_SERIAL_NO DESC",
    );
    return mData;
  }

  Future<bool> updateExpense({
    required String mTitle,
    required String mDes,
    required String mPrice,
    required String mDate,
    required int sno,
  }) async {
    var db = await getDb();
    int rowsEffected = await db.update(
      TABLE_NAME,
      {
        COLUMN_TITLE: mTitle,
        COLUMN_DESC: mDes,
        COLUMN_PRICE: mPrice,
        COLUMN_DATE: mDate,
      },
      where: "$COLUMN_SERIAL_NO = ?",
      whereArgs: [sno],
    );
    return rowsEffected > 0;
  }

  Future<bool> deleteExpense({required int sno}) async {
    var db = await getDb();
    int rowsEffected = await db.delete(
      TABLE_NAME,
      where: "$COLUMN_SERIAL_NO = ?",
      whereArgs: [sno],
    );
    return rowsEffected > 0;
  }
}