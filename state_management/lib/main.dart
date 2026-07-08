import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

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
      home: ChangeNotifierProvider(
        create: (_) => CounterProvider(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo')),
      body: Center(child: Column(children: [
        Text('${Provider.of<CounterProvider>(context,listen: true).getCount()}',style: TextStyle(color: Colors.black,fontSize: 20),)])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CounterProvider>(context,listen: false).incrementCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
