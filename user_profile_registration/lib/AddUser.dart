import 'package:flutter/material.dart';
import 'package:user_profile_registration/Db_helper.dart';

class Adduser extends StatefulWidget {
  final Map<String, dynamic>? user;

  const Adduser({super.key, this.user});

  @override
  State<StatefulWidget> createState() => AdduserState();
}

class AdduserState extends State<Adduser> {
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();

  DbHelper dbRef = DbHelper.getInstance;
  bool isEdit = false;

  @override
  @override
  void initState() {
    super.initState();

    if (widget.user != null) {
      isEdit = true;
      userNameController.text = widget.user![DbHelper.COLUMN_USER_NAME] ?? '';
      emailController.text = widget.user![DbHelper.COLUMN_EMAIL] ?? '';
      addressController.text = widget.user![DbHelper.COLUMN_ADDRESS] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Update User' : 'Add New User')),
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
                    bool success = false;
                    if (isEdit) {
                      int id = widget.user![DbHelper.COLUMN_ID];
                      success = await dbRef.updateData(
                          mName: name, mEmail: email, mAddress: address, id: id);
                    }
                    else{
                      success = await dbRef.addNote(
                        mName: name,
                        mEmail: email,
                        mAddress: address,
                      );

                    }

                    if (success && mounted) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: Text(
                  isEdit ? 'Update User' :
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
