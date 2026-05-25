import 'package:flutter/material.dart';

void main() {
  runApp(row());
}

class row extends StatelessWidget {
  const row({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      'jui',
      'joha',
      'apple',
      'banana',
      'mango',
      'papaya',
      'red',
      'blue',
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Row')),
        body: ListView.separated(

          itemBuilder: (context, index) {
            return Row(children: [

              Expanded( flex : 2 ,child: Image.asset('assets/images/androidd.png',height: 100,width: 100,)),
              Expanded( flex : 4,child: Text(list[index])),
              Expanded(child: Icon(Icons.add))
            ]);
          },
          separatorBuilder: (context, index) {
            return Divider(height: 16, color: Colors.grey, thickness: 2);
          },
          itemCount: list.length,
        ),
      ),
    );
  }
}
