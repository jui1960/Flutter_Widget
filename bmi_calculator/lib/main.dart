import 'package:flutter/material.dart';

import 'SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: SplashscreenExample(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String nameFrom;

  const MyHomePage(this.nameFrom, {super.key});
  @override
  State<MyHomePage> createState() => _BMI();
}

class _BMI extends State<MyHomePage> {
  var wight = TextEditingController();
  var height = TextEditingController();
  var inch = TextEditingController();

  var res = "";
  var bgColor = Colors.indigo.shade50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('BMI Calculator', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView( // Keyboard ashle jate screen crash na hoy
          child: Container(
            width: 330,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hello! ${widget.nameFrom}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Check Your BMI Status',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 25),

                TextField(
                  controller: wight,
                  decoration: const InputDecoration(
                    labelText: 'Enter Your Weight [in kg]',
                    prefixIcon: Icon(Icons.fitness_center),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: height,
                  decoration: const InputDecoration(
                    labelText: 'Enter Your Height [in feet]',
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: inch,
                  decoration: const InputDecoration(
                    labelText: 'Enter Your Height [in inches]',
                    prefixIcon: Icon(Icons.straighten),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      var wt = wight.text.toString();
                      var ht = height.text.toString();
                      var inc = inch.text.toString();
                      if(wt != "" && ht!="" && inc!=""){
                        var iwt = int.parse(wt);
                        var ift = int.parse(ht);
                        var Iinch = int.parse(inc);

                        var tinc = (ift*12) + Iinch;
                        var tcm = tinc*2.54;
                        var tm = tcm/100;
                        var bmi = iwt/(tm*tm);
                        var mgs = "";

                        if(bmi>25){
                          mgs = "You're Overweight";
                          bgColor = Colors.amber.shade100;
                        }
                        else if(bmi<18){
                          mgs = "You're Underweight";
                          bgColor = Colors.red.shade100;
                        }
                        else{
                          mgs = "You're Healthy";
                          bgColor = Colors.green.shade100;
                        }
                        res = "$mgs \n Your BMI is ${bmi.toStringAsFixed(2)}"; // Doshomik er por 2 ghor clear dekhabe
                        setState(() {});
                      }
                      else{
                        setState(() {
                          res = "Please fill all required Blanks !! ";
                        });
                      }
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                Text(
                  res,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}