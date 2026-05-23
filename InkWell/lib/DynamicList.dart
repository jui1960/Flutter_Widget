import 'package:flutter/material.dart';

void main() {
  runApp(const dynamicList());
}

class dynamicList extends StatelessWidget {
  const dynamicList({super.key});

  Widget build(BuildContext context) {
    var arrName = ['jui', 'jemi', 'joha', 'jakia','mafi','meraj','mohin'];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('listView')),
        //ListView.builder
        body: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                arrName[index],
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
              ),
            );
          },
          itemCount: arrName.length,
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey,
              height: 100,
              thickness: 2,
            );
          }
/*
          scrollDirection: Axis.horizontal,
*/
        ),
      ),
    );
  }
}
