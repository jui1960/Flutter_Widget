import 'package:flutter/material.dart';

void main() {
  runApp(const CustomWidgete());
}

class CustomWidgete extends StatelessWidget {
  const CustomWidgete({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: newWidget());
  }
}

class newWidget extends StatelessWidget {
  const newWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Widget')),
      body: Container(
        child: Column(children: [step1(), step2(), step3(), step4()]),
      ),
    );
  }
}

class step1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.blueAccent,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 100,
              child: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('A'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class step2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arrayName = [
      'jui',
      'kamal',
      'kamal',
      'kamal',
      'kamal',
      'kamal',
      'kamal',
      'kamal',
      'kamal',
    ];

    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.amber,

        child: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text('A'),
            ),
            title: Text(arrayName[index]),

            subtitle: Text('Subtitle $index'),

            trailing: Icon(Icons.delete),
          ),
          itemCount: arrayName.length,
        ),
      ),
    );
  }
}

class step3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.grey,
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
              ),
            ),
          ),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class step4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
