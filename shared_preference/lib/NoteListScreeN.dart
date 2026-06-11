import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<String> notes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    showNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved notes'),
        backgroundColor: Colors.cyan.shade200,
      ),

      // 1st a isloading true tai cicularindicator show korbe,,jody isloading
      //false hoi taile check korbe nortes.isempty kina..jody empty hole no value save dekhabe
      // jody notes not empty hole listview.builder show korbe
      // true hoile ? er pore likha hoi ,,,r flase hole : er pore likha hoi
      body: isLoading ? Center(child: CircularProgressIndicator())
          : notes.isEmpty ? Center(child: Text('No value save',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.cyan),))
          : ListView.builder(
              itemBuilder: (context, index) {
                var split = notes[index].split('##');
                var noteTitle = split[0];
                var noteSubTitle = split[1];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  color: Colors.cyan.shade100,
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(noteTitle),
                    subtitle: Text(noteSubTitle),
                    trailing: IconButton(
                      onPressed: () async {
                        var pref = await SharedPreferences.getInstance();
                        notes.removeAt(index);
                        pref.setStringList('value', notes);
                        setState(() {});
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ),
                );
              },
              itemCount: notes.length,
            ),
    );
  }

  void showNote() async {
    var pref = await SharedPreferences.getInstance();
    var noteShow = pref.getStringList('value');
    notes = noteShow != null ? noteShow : [];
    isLoading = false;
    setState(() {});
  }
}
