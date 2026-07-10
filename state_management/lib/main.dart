import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/List_page.dart';
import 'package:state_management/list_map_provider.dart';

import 'counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CounterProvider()),
      ChangeNotifierProvider(create: (context) => ListMapProvider())

    ],
    child: MaterialApp(
      title: 'State Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListPage(),
    ),);

    /*
    * /* home: ChangeNotifierProvider(
        create: (_) => CounterProvider(),
        child: MyHomePage(),
      ),*/
      /*home: ChangeNotifierProvider(
        create: (_) => ListMapProvider(),
        child: ListPage(),
      ),*/

      home: MultiProvider(providers: [
       ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ListMapProvider())

      ],
      child: ListPage()
    *
    *
    * */


  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo')),
      body: Center(child: Column(children: [
        Consumer<CounterProvider>(builder: (ctx, _, __) {
          return Text(
/*
           '${Provider.of<CounterProvider>(ctx,listen: true).getCount()}',
           observe krbe tai listen true tai watch kore hoi
*/
            '${ctx.watch<CounterProvider>().getCount()}',
            style: TextStyle(color: Colors.black, fontSize: 20),
          );
        }


        )
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
/*
          Provider.of<CounterProvider>(context,listen: false).incrementCount();
          jokjon liser false ,,mane sudu data change tokon read korlei hoi,,,r jkn listen (true)o krte hoi tokhon watch korte hoi
*/
          context.read<CounterProvider>().incrementCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
