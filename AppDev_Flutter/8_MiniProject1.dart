/*
Day 8 : Mini Project 1 using following widgets
MaterialApp
Scaffold widget
Container Widget
Row and column widget
Text and TextField widget
 */


//Portfolio application

import 'package:flutter/material.dart';

void main()=>runApp(MiniProject());

class MiniProject extends StatelessWidget {
  const MiniProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //To remove debug indicator flag on top right
      title: "Mini Project 1",
      home: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
          title: Text("Portfolio"),
          leading: Icon(Icons.home),
            backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child:Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(
                    top:40
                ),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                child:Center(
                  child: Text(
                    "G",
                    style: TextStyle(
                      fontSize: 75,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ) ,
                ),
              ),
            ),
            Container(
              alignment:Alignment.center,
              margin: EdgeInsets.all(30),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color:Colors.white,
                ),
                color: Colors.lightBlueAccent,
              ),
              child:Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    hintText: "Enter your name",
                    border: InputBorder.none, //Removes black underline
                    icon: Icon(Icons.person),
                  ),
                ),
              ),
            ),
            Container(
              alignment:Alignment.center,
              margin: EdgeInsets.only(left: 30,right: 30),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color:Colors.white,
                ),
                color: Colors.lightBlueAccent,
              ),
              child:Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: TextField(
                  obscureText : true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    border: InputBorder.none, //Removes black underline
                    icon: Icon(
                        Icons.lock,
                        color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment:Alignment.center,
              margin: EdgeInsets.only(left: 30,right: 30,top:30),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color:Colors.white,
                ),
                color: Colors.lightBlueAccent,
              ),
              child:Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Gituhub",
                    hintText: "Paste your github link",
                    border: InputBorder.none, //Removes black underline
                    icon: Icon(
                      Icons.link,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment:Alignment.center,
              width: 100,
              height: 50,
              margin: EdgeInsets.only(left: 30,right: 30,top: 30),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color:Colors.white,
                ),
                color: Colors.lightBlue,
              ),
              child:Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child:Center(
                  child: Text(
                    "Update",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      //backgroundColor: Colors.lightBlueAccent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


