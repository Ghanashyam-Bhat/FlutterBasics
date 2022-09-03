//Day 9
//Button widget
/*
Flat Button
Text Button
Raised button
Elevated Button
Floating Action Button
FloatingActionButton.extended()
Drop Down Button
Inkwell Button
Icon Button
Pop Up Menu Button
 */

import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "buttons",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Buttons"),
          leading: Icon(Icons.radio_button_checked),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //Flat Button
            FlatButton(
              onPressed: (){},
              color: Colors.orange,
              textColor: Colors.white,
              child: Text("Flat Button"),
            ),
            //Flat Button is deprecated. Use Text Button instead. Both works similaraly
            TextButton(//Automatically takes background color. Change it later
              onPressed: (){},//Passing empty function
              style: ButtonStyle(
               backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.orange),
                foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
              ),
              child: Text("Text button",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),

            //Raised button - Rectangular shape, and provides different decoration.
            //Raised button has 2 callback functions. Press and Long press.
            RaisedButton(
              onPressed: (){},
              child: Text("Raised Button"),
              color: Colors.red,
              textColor: Colors.black,
              splashColor:Colors.green ,
            ) ,
            //-> Depricated. Use ElevatedButton instead.
            ElevatedButton(
                onPressed: (){},
                child: Text(
                    "Elevated button",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.red),
                foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black),
                overlayColor: MaterialStateProperty.resolveWith(
                      (states) {
                    return states.contains(MaterialState.pressed)
                        ? Colors.green
                        : null;
                  },
                ),
              ),
            ),

            //Floating Action Button
            //There are 2 types of floating action buttons
            //-Normal floating action button, provides simple circular floating button with a child widget inside it
            //-Floating action button with extended function - Creates a white floating button with an icon and label inside it

            FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.save),
              //Text("Update"), - We can give text/icon
              foregroundColor: Colors.black,
              backgroundColor: Colors.pink,
            ),


            //Allows both icons and label text
            FloatingActionButton.extended(
                onPressed: (){},
                label: Text("Save"),
                icon:Icon(Icons.save)
            ),
          ],
        ),
      ),
    );
  }
}

