import 'package:flutter/material.dart';

void main() {
  runApp(const datePicker());
}

class datePicker extends StatelessWidget {
  const datePicker({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DatepickerScreen(),
    );
  }
}

class datePickerScreen extends StatelessWidget {
  const datePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Show Date', style: TextStyle(fontSize: 20),),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),

                onPressed: () async {
                  DateTime? datePicked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2030));

                  if (datePicked != null) {
                    print('SELECT DATE: ${datePicked.day} - ${datePicked
                        .month} - ${datePicked.year}');
                  }
                }, child: Text('Get Date')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async {
              TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now()
                  ,
                  initialEntryMode: TimePickerEntryMode.dial);

              if (time != null) {
                print('SELECT time : ${time.hour} : ${time.minute}');
              }
            }, child: Text('Select time'))
          ],
        ),
      ),
    );
  }
}
