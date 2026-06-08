import 'package:flutter/material.dart';

import 'FlowerDetails.dart';
import 'Gradiun.dart';

class MyClipRRect extends StatefulWidget {
  const MyClipRRect({super.key});

  @override
  State<MyClipRRect> createState() => _MyClipRRectState();
}

class _MyClipRRectState extends State<MyClipRRect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>GradiunScreen()));
              },
                child: Icon(Icons.arrow_right,size: 50,)),
            SizedBox(height: 40,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  Flowerdetails()));
              },
              child: Hero(
                tag: "flower",
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(71),
                    topRight: Radius.circular(11),
                    bottomLeft: Radius.circular(11),
                    bottomRight: Radius.circular(11),
                  ),
                  child: Image(image: AssetImage('assets/images/flower.webp'),height: 400,width: 400,fit: BoxFit.cover,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
