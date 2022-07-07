import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Card Widget",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Card Widget"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Container(
            height:200 ,
            width: 300,
            child: Card(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 10,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Ghanashyam Bhat"),
                    subtitle: Text("Student"),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      RaisedButton(onPressed: (){} , child: Icon(Icons.mouse),color: Colors.orange,),
                      RaisedButton(onPressed: (){} , child: Text("Press"),color: Colors.white,),
                      RaisedButton(onPressed: (){} , child: Text("this"),color: Colors.green,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

