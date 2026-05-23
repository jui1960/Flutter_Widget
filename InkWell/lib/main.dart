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
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Center(
              child: Container(
                height: 300,
                width: 300,
                color: Colors.red,

                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      print('Clicked');
                    },
                    child: Text('Click me'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            InkWell(
              onTap: () {
                print('Clicked');
              },
              onLongPress: () {
                print('Long pressed');
              },
              child: Container(
                height: 300,
                width: 200,
                color: Colors.blue,

                child: Center(child: Text('jui',style: TextStyle(fontSize: 50),)),
              ),
            ),

            const SizedBox(height: 15),

            InkWell(
              onTap: () {
                print('My name is jui');
              },

              child: Container(
                height: 200,
                width: 200,
                color: Colors.amberAccent,
                padding: EdgeInsets.all(30),
                child: Text('Jui', style: TextStyle(fontSize: 59)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
