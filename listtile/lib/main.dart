import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var arr = ['jui', 'joha', 'jakia', 'jim', 'kdjfuhrew'];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(title: Text('List tile')),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              minTileHeight: 100,  //full list er height
              horizontalTitleGap: 100,// images r title er majhe gap kore dibe

            /*  leading: Image.asset('assets/images/androidd.png'),*/
              title: Text(arr[index]),
              subtitle: Text('Number'),
              trailing: Icon(Icons.add)
            );
          },
          itemCount: arr.length,
          separatorBuilder: (context, index) {
            return Divider(height: 16, color: Colors.grey, thickness: 2);
          },
        ),
      ),
    );
  }
}
