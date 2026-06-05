import 'package:flutter/material.dart';

void main() {
  runApp(const column());
}

class column extends StatelessWidget {
  const column({super.key});

  @override
  Widget build(BuildContext context) {
    var array = [
      'jui',
      'joha',
      'apple',
      'banana',
      'mango',
      'papaya',
      'jui',
      'jesi',
      'jakia',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Column')),
        body: ListView.builder(
          itemCount: array.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(left: 15, top: 25, right: 15),
              color: Colors.grey,
              elevation: 15,
              shadowColor: Colors.brown,

              child: Container(
                height: 70,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.person, size: 30, color: Colors.white),
                      ),
                      const SizedBox(width: 15),

                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              array[index],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('This is a subtitle'),
                          ],
                        ),
                      ),

                      Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
