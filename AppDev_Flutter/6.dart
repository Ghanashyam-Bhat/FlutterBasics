import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
                        title: "Day 6",
                        home: Scaffold(
                                appBar: AppBar(
                                  title: Text("Row and column"),
                                  leading: Icon(Icons.hardware),
                                ),
                        body:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min, //Occupies minimum space possible
                          
                                      children:<Widget>[
                                        Container(
                                          height: 50,
                                          width: 100,
                                          color: Colors.orange,
                                          margin: EdgeInsets.all(10),
                                          child: Text("Container 1"),
                                  ),
                                        Container(
                                          height: 50,
                                          width: 100,
                                          color: Colors.green,
                                          margin: EdgeInsets.all(10),
                                          child: Text("Container 2"),
                                        ),
                  ],

              ),
                        ),
    );
  }
}

