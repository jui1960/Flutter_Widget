import 'package:flutter/material.dart';

void main() {
  runApp(const datePicker());
}

class datePicker extends StatelessWidget {
  const datePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Date Picker")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Date picker', style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  DateTime? Datepickerr = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2030),
                  );
                  if(Datepickerr!= null){
                    print('SELECT DATE : ${Datepickerr.day}-${Datepickerr.month}-${Datepickerr.year}');
                  }
                },
                child: Text('Get Date'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
