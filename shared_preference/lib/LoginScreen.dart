import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';
import 'SplashScreen.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashsscreen(),
    );
  }
}

class Login extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {

  var _EmailController = TextEditingController();
  var _PasswordController = TextEditingController();

  static const String USER_EMAIL = 'user_email';
  static const String USER_PASSWORD = 'user_password';

  //validation

  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(

              margin: EdgeInsets.only(top: 70),
              width: 350,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    CircleAvatar(
                        radius: 50,
                        child: Icon(
                            Icons.person, size: 80, color: Colors.cyan)),

                    SizedBox(height: 100,),
                    TextFormField(
                      controller: _EmailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        hintText: 'Enter your email',
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty) {
                          return 'Email is required';
                        }
                        final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value.trim())) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: _PasswordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(


                          border: OutlineInputBorder(),
                          hintText: 'Enter your password',
                          labelText: 'Password',

                          suffixIcon: IconButton(onPressed: () {
                            isPasswordVisible = !isPasswordVisible;
                            setState(() {});
                          },
                              icon: Icon(
                                isPasswordVisible ? Icons.visibility : Icons
                                    .visibility_off, color: Colors.cyan,))
                      ),
                      validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var email = _EmailController.text.toString();
                            var password = _PasswordController.text.toString();


                            var pref = await SharedPreferences.getInstance();
                            pref.setBool(SplashScreenState.KEYLOGIN, true);
                            pref.setString(USER_EMAIL, email);
                            pref.setString(USER_PASSWORD, password);


                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Homescreen()));
                          }
                        },
                        child: Text('Login', style: TextStyle(fontSize: 24),)),

                    SizedBox(height: 20,),
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 16),),
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
                                'assets/images/img_2.png', width: 24,
                                height: 24),
                            SizedBox(width: 10,),
                            Text('Continue with google',
                              style: TextStyle(fontSize: 16),),
                          ],
                        ),
                      ),

                    ),
                  ],
                ),
              )
          )
      ),
    );
  }
}