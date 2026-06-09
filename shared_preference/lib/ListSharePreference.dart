import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _controller = TextEditingController();
  var _subController = TextEditingController();
  var noteValue = "No save Value";
  List<String> notes = [];

  @override
  void initState() {
    super.initState();
    NoteShow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 360,
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Note App',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _controller,
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
                    hintText: "Enter your subTitle",
                  ),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    var userNote = _controller.text.toString();
                    var userSub = _subController.text.toString();

                    var pref = await SharedPreferences.getInstance();
                    var combineStringList = "$userNote##$userSub";
                    notes.add(combineStringList);

                    pref.setStringList('NOTE', notes);
                    setState(() {
                      _controller.clear();
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
                            var split = notes[index].split("##");
                            var titleText = split[0];
                            var subTitleText = split[1];
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              elevation: 10,
                              color: Colors.cyan.shade100,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.cyan,
                                  child: Text("${index + 1}"),
                                ),
                                title: Text(titleText),
                                subtitle: Text(subTitleText),
                                trailing: Icon(Icons.edit),
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
      ),
    );
  }

  void NoteShow() async {
    var pref = await SharedPreferences.getInstance();
    var showNote = pref.getStringList("NOTE");
    notes = showNote != null ? showNote : [];
    noteValue = notes.isEmpty ?  "No save value" : "";
    setState(() {});
  }
}
