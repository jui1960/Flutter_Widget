import 'package:flutter/material.dart';

void main() {
  runApp(const scrollView());
}

class scrollView extends StatelessWidget {
  const scrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('scrollView')),
        body: Padding(
          padding: EdgeInsets.all(50.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("this is scrollview"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(

                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        margin: EdgeInsets.only(right: 11),
                        height: 200,
                        width: 200,

                        child: Image.asset(
                            'assets/images/android.png', height: 90,
                            width: 100,
                           ),


                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        margin: EdgeInsets.only(right: 11),
                        height: 200,
                        width: 200,
                        child:Image.asset(
                          'assets/images/apple.png', height: 100,
                          width: 100,
                        ),



                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        margin: EdgeInsets.only(right: 11),
                        height: 200,
                        width: 200,



                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        margin: EdgeInsets.only(right: 11),
                        height: 200,
                        width: 200,



                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        margin: EdgeInsets.only(right: 11),
                        height: 200,
                        width: 200,



                      ),




                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,

                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Image.asset(
                    'assets/images/android.png', height: 100,
                    width: 100,
                  ),


                  margin: EdgeInsets.only(bottom: 11),
                  height: 200,
                        width: 600,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,

                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),

                  margin: EdgeInsets.only(bottom: 11),
                  height: 200,
                  /*           width: 200,*/
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  margin: EdgeInsets.only(bottom: 11),
                  height: 200,
                  /*
                  width: 200,
*/
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  margin: EdgeInsets.only(bottom: 11),
                  height: 200,
                  /*
                  width: 200,
*/
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
