import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/List_page.dart';

import 'list_map_provider.dart';

class Addscreen extends StatelessWidget {
  var nameController = TextEditingController();
  var rollController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Data')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: rollController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Roll',
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  var name = nameController.text;
                  var roll = rollController.text;

                  if (name.isNotEmpty && roll.isNotEmpty) {
                   Map<String,dynamic> newData = {
                     ListPage.NAMEKEY: name,
                     ListPage.ROLLKEY: roll,
                   };

                    context.read<ListMapProvider>().addData(newData);

                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill all the fields')),
                    );
                  }
                },
                child: Text('Add', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
