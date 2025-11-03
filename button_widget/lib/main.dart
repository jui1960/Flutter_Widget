//text button
//elevated button
// outline button

import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}):super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text('flutter button'),
      ),
      // body:TextButton(
      //   child: Text('click'),
      //     onPressed: (){
      //     print('text button'); // button akbar click korle
      // },
      //     onLongPress: (){
      //     print('button'); //button chape dhore rakhle
      //     },
      //
      // )


      //elevated button
      // body: ElevatedButton(child:Text('elvated button'),
      //     onPressed: (){
      //       print('buttton_press');
      // }


      //outlinebutton
      body: OutlinedButton(
          child:Text('outline button'),
          onPressed: (){
            print('outline button');
          },
      ),

    );
  }
}
