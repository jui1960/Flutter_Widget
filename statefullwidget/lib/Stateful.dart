import 'package:flutter/material.dart';

void main() {
  runApp(const StateFulExaple());
}

class StateFulExaple extends StatelessWidget {
  const StateFulExaple({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateful Widget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter First Number',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller2,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Second Number',
                  hintStyle: TextStyle(color: Colors.grey),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      var no1 = int.parse(controller1.text.toString());
                      var no2 = int.parse(controller2.text.toString());

                      var sum = no1 + no2;

                      result = "The Sum of $no1 and $no2 is $sum";

                      setState(() {});
                    },
                    child: Text('Sum'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      var no1 = int.parse(controller1.text.toString());
                      var no2 = int.parse(controller2.text.toString());

                      var sub = no1 - no2;

                      result = "The Sub of $no1 and $no2 is $sub";

                      setState(() {});
                    },
                    child: Text('sub'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      var no1 = int.parse(controller1.text.toString());
                      var no2 = int.parse(controller2.text.toString());

                      var mul = no1 * no2;

                      result = "The Mul of $no1 and $no2 is $mul";

                      setState(() {});
                    },
                    child: Text('Mul'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      var no1 = int.parse(controller1.text.toString());
                      var no2 = int.parse(controller2.text.toString());

                      var div = no1 / no2;

                      result =
                          "The Div of $no1 and $no2 is ${div.toStringAsFixed(2)}";

                      setState(() {});
                    },
                    child: Text('Div'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 100, minHeight: 100),
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
