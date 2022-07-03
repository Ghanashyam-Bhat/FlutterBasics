import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Icons",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Icon Widget"),
          leading: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(80.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.green,
                        size: 40,
                        textDirection: TextDirection.rtl,
                      ),
                      Text("home"),
                    ],
                  ),
                ),
                SizedBox(/*height: 40,*/width: 30,), //this is used to give space between two widgets
                Icon(
                  Icons.alarm,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ) ,
      ),
    );
  }
}

