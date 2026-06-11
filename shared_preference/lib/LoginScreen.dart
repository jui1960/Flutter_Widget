import 'package:flutter/material.dart';

import 'SplashScreen.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splashsscreen(),
    );
  }
}

class Login extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var _EmailController = TextEditingController();
  var _PasswordController = TextEditingController();
  String? _EmailError;
  String? _PasswordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              margin: EdgeInsets.only(top: 70),
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  CircleAvatar(
                      radius: 50,
                      child: Icon(
                          Icons.person, size: 80, color: Colors.cyan)),

                  SizedBox(height: 100,),
                  TextField(
                    controller: _EmailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      errorText: _EmailError,
                      hintText: 'Enter your email',
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: _PasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      errorText: _PasswordError,
                      hintText: 'Enter your password',
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 16, color: Colors.cyan),),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {

                      }, child: Text('Login', style: TextStyle(fontSize: 24),)),

                  SizedBox(height: 20,),
                  Text(
                    'Don\'t have an account?', style: TextStyle(fontSize: 16),),
                  SizedBox(height: 30,),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                              'assets/images/img_2.png', width: 24, height: 24),
                          SizedBox(width: 10,),
                          Text('Continue with google',
                            style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),

                  ),
                ],
              )
          )
      ),
    );
  }
}