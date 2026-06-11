import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'NoteListScreeN.dart';
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
  List<String> notes = [];

  String? _TitileError;
  String? _SubTitleError;



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
                      errorText: _TitileError,
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
                      errorText: _SubTitleError,
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

                      setState(() {
                        _TitileError = null;
                        _SubTitleError = null;
                      });
                      if (note.isEmpty || subtitle.isEmpty) {
                        if (note.isEmpty) {
                          _TitileError = 'Please fill up Note';
                        }
                        if (subtitle.isEmpty) {
                          _SubTitleError = 'Please fill up SubTitle';
                        }


                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please fill all feild'),)
                        );
                        return;
                      }


                      var pref = await SharedPreferences.getInstance();
                      notes = pref.getStringList('value') ?? [];

                      var concat = ('$note##$subtitle');
                      notes.add(concat);

                      pref.setStringList('value', notes);

                      _Controller.clear();
                      _subController.clear();

                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => NoteListScreen()));
                    },

                    child: Text('SAVE'),
                  ),
                  SizedBox(height: 20),
                ])


        ),
      ),

    );
  }
}

