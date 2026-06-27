import 'package:flutter/material.dart';

import 'Db_helper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> noteList = [];
  DbHelper dbref = DbHelper.getInstance;
  var titleController = TextEditingController();
  var detailsController = TextEditingController();
  String errorMessage = '';

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
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Card(
                    color: Colors.amber,
                    child: ListTile(

                      leading: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        child: Text(
                          noteList[index][DbHelper.COLUMN_SERIAL_NO].toString(),
                        ),
                      ),
                      title: Text(noteList[index][DbHelper.COLUMN_NOTE_TITLe]),
                      subtitle: Text(
                          noteList[index][DbHelper.COLUMN_NOTE_DESC]),
                    ),
                  ),
                );
              },
            )
          : Center(child: Text('No note yet',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(context: context, builder: (context) {
            return Container(
              height: 400,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Add Note', style: TextStyle(fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Enter Title',
                      ),
                      controller: titleController,
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Enter descreption',
                      ),
                      controller: detailsController,
                    ),
                    SizedBox(height: 21,),
                    Row(
                      children: [
                        Expanded(child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(

                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }, child: Text('Cancel'))),
                        SizedBox(width: 21,),
                        Expanded(child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(

                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),
                            onPressed: () async {
                              var title = titleController.text;
                              var details = detailsController.text;
                              if (title.isNotEmpty && details.isNotEmpty) {
                                bool chek = await dbref.addNote(
                                    Mtitle: title, Mdetails: details);
                                if (chek) {
                                  getData();
                                  Navigator.pop(context);
                                }
                                else {
                                  errorMessage = 'please fill all fields';
                                  setState(() {});
                                }
                                titleController.clear();
                                detailsController.clear();
                                setState(() {});
                              }
                            }, child: Text('Save'))),
                        Text(errorMessage),
                      ],
                    )
                  ],
                ),
              ),

            );
          });
          /*    bool chek = await dbref.addNote(
            Mtitle: 'personal note',
            Mdetails: 'my favoutite fruit is apple',
          );
          if (chek) {
            getData();
          }*/
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
