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


      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key?key}):super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(



      appBar: AppBar(
        title:Text('row_column'),
      ),
      // body: Column(
      //   children: [
      //     Text('a',style: TextStyle(fontSize: 20),),
      //     Text('b'),
      //     Text('c'),
      //     Text('d'),
      //     Text('e'),
      //   ],
      // ),

      //children: <Text>[ er mane sudu texxt  widget newa jabe

      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('a',style: TextStyle(fontSize: 20),),
              Text('b',style: TextStyle(fontSize: 40),),
              Text('c',style: TextStyle(fontSize: 7),),
              Text('d',style: TextStyle(fontSize: 20),),
              Text('e',style: TextStyle(fontSize: 500),),
          ElevatedButton(onPressed: (){

          }, child: Text('click me'))
        ],
      ),
    );
  }
}
