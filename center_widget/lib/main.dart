import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) : super(key:key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter container'),
      ),
      body: Center(
        child: Container(
              width: 200,
              height: 100,
              color: Colors.blueGrey,
              child: Center( // Text er opor alt+enter marle warp in center lekha uthbe
                child: Text('this is center of container',
                  style: TextStyle(color: Colors.blue,
                  ),),
              ),
            ),
      ), //container er modde hello lekha child

    );
  }
}




