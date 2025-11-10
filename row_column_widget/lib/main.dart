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

      // body: Container(
      //   height: 300,
      //   child: Row(
      //
      //       // mainAxisAlignment: MainAxisAlignment.spaceEvenly, sobsight a
      //       // mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //
      //       children: [
      //         Text('a',style: TextStyle(fontSize: 20),),
      //         Text('b',style: TextStyle(fontSize: 14),),
      //         Text('c',style: TextStyle(fontSize: 17),),
      //         Text('d',style: TextStyle(fontSize: 20),),
      //         Text('e',style: TextStyle(fontSize: 15),),
      //         ElevatedButton(onPressed: (){
      //
      //         }, child: Text('click me'))
      //       ],
      //   ),



      body: Container(
        height: 300,
        child: Column(

          // mainAxisAlignment: MainAxisAlignment.spaceEvenly, sobsight a
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text('a',style: TextStyle(fontSize: 20),),
            Text('b',style: TextStyle(fontSize: 20),),
            Text('c',style: TextStyle(fontSize: 20),),
            Text('d',style: TextStyle(fontSize: 20),),
            Text('e',style: TextStyle(fontSize: 20),),
            ElevatedButton(onPressed: (){

            }, child: Text('click me',style: TextStyle(fontSize: 30,color: Colors.grey),))
          ],
        ),
      ),
    );
  }
}
