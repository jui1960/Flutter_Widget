import 'package:flutter/material.dart';
import 'package:user_profile_registration/Db_helper.dart';

class Adduser extends StatefulWidget {
  const Adduser({super.key});

  @override
  State<StatefulWidget> createState() => AdduserState();
}

class AdduserState extends State<Adduser> {
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();

  DbHelper dbRef = DbHelper.getInstance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New User')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                labelText: 'User Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () async {
                  var name = userNameController.text;
                  var email = emailController.text;
                  var address = addressController.text;

                  if (name.isNotEmpty && email.isNotEmpty) {
                    bool isSaved = await dbRef.addNote(
                      mName: name,
                      mEmail: email,
                      mAddress: address,
                    );

                    if (isSaved && mounted) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: const Text(
                  'Save User',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
