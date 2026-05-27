import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var array = ['jui', 'joha', 'apple', 'banana', 'mango', 'papaya','jui','jesi','jakia'];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Card')),

        body: ListView.builder(
          itemCount: array.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(left: 15, top: 25),
              elevation: 15,
              shadowColor: Colors.brown,
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  child: Center(
                    child: ListTile(
                      leading: CircleAvatar(child: Icon(Icons.person)),
                      title: Text(array[index]),
                      subtitle: Text('This is a subtitle'),
                      trailing: Text("${index+1}"),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
