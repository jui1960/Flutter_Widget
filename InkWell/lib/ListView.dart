import 'package:flutter/material.dart';

void main() {
  runApp(const listView());
}

class listView extends StatelessWidget {
  const listView({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('listView')),
        body: ListView(
          scrollDirection: Axis.horizontal,
         /* scrollDirection: Axis.vertical,
          reverse: true,*/
          children: [
            Padding(padding: const EdgeInsets.all(8.0), child: Text('one')),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('two')),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('three')),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('four')),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('five')),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('six')),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('seven')),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('eight')),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('nine')),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('ten')),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('seven')),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('eight')),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('nine')),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('ten')),
          ],


        ),
      ),
    );
  }
}
