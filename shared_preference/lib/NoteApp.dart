import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SplashScreen.dart';

void main() {
  runApp(Note());
}

class Note extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NoteAppState();
}

class _NoteAppState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Splashsscreen());
  }
}

class NoteApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NoteAppStateApp();
}

class _NoteAppStateApp extends State<NoteApp> {
  var _Controller = TextEditingController();
  var _subController = TextEditingController();
  var noteValue = "No note saved";
  List<String> notes = [];

  @override
  void initState() {
    super.initState();

    showNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60),

              Text(
                'Nota App',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.cyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              TextField(
                controller: _Controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Enter your note",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _subController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Enter your Subtitle",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  var note = _Controller.text.toString();
                  var subtitle = _subController.text.toString();

                  var pref = await SharedPreferences.getInstance();
                  var concat = '$note##$subtitle';
                  notes.add(concat);
                  pref.setStringList('Value', notes);
                  setState(() {
                    _Controller.clear();
                    _subController.clear();
                  });
                },
                child: Text('SAVE'),
              ),
              SizedBox(height: 20),
              Expanded(
                child: notes.isEmpty
                    ? Text(noteValue)
                    : ListView.builder(

                        itemBuilder: (context, index) {
                          var split = notes[index].split('##');
                          var noteTitle = split[0];
                          var subtitle = split[1];
                          return Card(

                            margin: EdgeInsets.all(10),
                            color: Colors.cyan.shade200,
                            elevation: 10,
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text('${index + 1}'),
                              ),
                              title: Text(noteTitle),
                              subtitle: Text(subtitle),
                              trailing: Icon(Icons.delete),
                            ),
                          );
                        },
                        itemCount: notes.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNote() async {
    var pref = await SharedPreferences.getInstance();
    var showPref = pref.getStringList('Value');
    notes = showPref != null ? showPref : [];
    noteValue = notes.isEmpty ? 'No note saved' : "";
    setState(() {});
  }
}
