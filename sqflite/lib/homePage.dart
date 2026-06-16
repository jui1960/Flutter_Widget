import 'package:flutter/material.dart';

import 'Db_helper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> noteList = [];
  DbHelper dbref = DbHelper.getInstance;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: noteList.isNotEmpty
          ? ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (_, index) {
                return ListTile(
                  leading: Text(
                    noteList[index][DbHelper.COLUMN_SERIAL_NO].toString(),
                  ),
                  title: Text(noteList[index][DbHelper.COLUMN_NOTE_TITLe]),
                  subtitle: Text(noteList[index][DbHelper.COLUMN_NOTE_DESC]),
                );
              },
            )
          : Center(child: Text('No note yet')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool chek = await dbref.addNote(
            Mtitle: 'personal note',
            Mdetails: 'my favoutite fruit is apple',
          );
          if (chek) {
            getData();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void getData() async {
    noteList = await dbref.FetchAllNote();
    setState(() {});
  }
}
