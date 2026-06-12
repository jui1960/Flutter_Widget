import 'package:flutter/material.dart';
import 'package:shared_preference/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SplashScreen.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String saveEmail = 'is loading';
  String savePassword = 'is loading';
  var cardCount = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.cyan.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const SizedBox(width: 40),
                  const Expanded(
                    child: Center(
                      child: Icon(Icons.home, size: 100, color: Colors.cyan),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      var pref = await SharedPreferences.getInstance();
                      pref.setBool(SplashScreenState.KEYLOGIN, false);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    icon: const Icon(
                      Icons.logout,
                      size: 40,
                      color: Colors.cyan,
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        color: Colors.cyan.shade300,
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(child: Icon(Icons.person)),
                          title: Text(saveEmail),
                          subtitle: Text(savePassword),
                          trailing: IconButton(
                            onPressed: () async {
                              var pref = await SharedPreferences.getInstance();
                              /*pref.remove(LoginState.USER_EMAIL);
                              pref.remove(LoginState.USER_PASSWORD);
                              pref.remove(SplashScreenState.KEYLOGIN);*/
                              pref.clear();
                              setState(() {
                                cardCount = 0;
                              });
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: cardCount,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadData() async {
    var pref = await SharedPreferences.getInstance();

    saveEmail = pref.getString(LoginState.USER_EMAIL) ?? '';
    savePassword =
        pref.getString(LoginState.USER_PASSWORD) ?? '';
    setState(() {});
  }
}
