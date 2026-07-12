import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/List_page.dart';

import 'list_map_provider.dart';

class Addscreen extends StatelessWidget {
  final bool isEdit;
  final int? index;
  final Map<String, dynamic>? oldData;

  Addscreen({this.isEdit = false, this.index, this.oldData});

  final nameController = TextEditingController();
  final rollController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = oldData?[ListPage.NAMEKEY] ?? '';
    rollController.text = oldData?[ListPage.ROLLKEY] ?? '';
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Update Data' : 'Add Data')),
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
                   if (isEdit && index != null) {
                     context.read<ListMapProvider>().updateData(
                       index!,
                       newData,
                     );
                   } else {
                     context.read<ListMapProvider>().addData(newData);
                   }

                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill all the fields')),
                    );
                  }
                },
                child: Text(isEdit ? 'Update' : 'Add',
                    style: TextStyle(color: Colors.white)),),
            ],
          ),
        ),
      ),
    );
  }
}
