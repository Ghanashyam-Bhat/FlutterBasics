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
      title: "Day 7",
      home: Scaffold(
        appBar: AppBar(),
        body:
            Column(
              children: <Widget>[
              Text(
                "Hello Coders!! Welcome to Flutter session,this is Day 7",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.yellow,
                  letterSpacing: 2.0,
                  wordSpacing: 1.5,
                  shadows: [
                    Shadow(
                      color: Colors.lightBlueAccent,
                      offset: Offset(3.0,3.0),
                    ),
                  ],
                ),
              ),
                RichText( //Rich Text is used to apply different properties to different part of the text
                          text: TextSpan(
                                    style: TextStyle(
                                    color: Colors.red,
                                  ),
                                      text:"Hello!!",
                                      children:<TextSpan>[
                                                TextSpan(
                                                        text: "Coder",
                                                        style: TextStyle(
                                                              color: Colors.green,
                                                        ),
                                                        children: <TextSpan>[
                                                                TextSpan(
                                                                       text: "3 rd level rich text",
                                                                    ),
                                                                  ],
                                                            ),
                                              ],
                          ),
                ),
            TextField( //Text field is used to take user input
              obscureText: true, //Used for passwords, it hides the input texts
              decoration: InputDecoration(
                //border:OutlineInputBorder(),
                border: InputBorder.none,
                labelText:"Name",
                hintText: "Enter your name here",
              ),
            )
        ],
            ),

      ),
    );
  }
}

