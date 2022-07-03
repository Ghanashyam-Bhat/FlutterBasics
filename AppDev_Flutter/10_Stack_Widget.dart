import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stack Widget",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stack Widget"),
          leading: Text("G"),
        ),
      body: Center(
      child:Stack(
        //alignment: Alignment.center, //Alignment of the widget in the stack
        //textDirection: TextDirection.rtl,//This is to specify the direction text in the widget
        fit: StackFit.passthrough,//This is to control the size of non-positioned children of the stack
        //overflow:OverFlow.visible, - This was a method to show overflowing texts
        children: <Widget>[
          Container(
            color: Colors.red,
          ),
          Container(
            height: 500,
            width: 250,
            color: Colors.yellow,
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.deepPurple,
          ),



          Container(
              height: 300,
              width: 400,

            color: Colors.green,
            child: Center(
              child: Text(
                "Hello!!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        Positioned(
          top: 30,
          right: 20,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.orange,
            child: Center(
              child: Text(
                "Coders",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),

          Positioned(
            bottom: 30,
            left: 20,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.pink,
              child: Center(
                child: Text(
                  "Coders",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
      ),
      ),
    );
  }
}

