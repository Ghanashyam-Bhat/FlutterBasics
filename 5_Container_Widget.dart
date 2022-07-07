
import 'package:flutter/material.dart';

void main()
{
  //type runApp() and press enter
  runApp(MyApp());
}

//type st and select
class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
                        title: "Application 2",//This is the title of the app, not home page
                        home : Scaffold(
                                          backgroundColor: Colors.black,
                                          appBar: AppBar(title: const Text("Conatiner Widgit"),
                                                          backgroundColor: Colors.red,
                                                          leading: Icon(Icons.home),
                                                        ),
                                          body: Container(
                                                        height: 100,
                                                        width: 100,
                                                        alignment: Alignment.center,
                                                        margin: EdgeInsets.all(2.5),
                                                        transform: Matrix4.rotationZ(0.2),//To rotate the container
                                                        //constraints: BoxConstraints.expand(height: 0.1),
                                                        //color: Colors.blue, Having color here gives error
                                                        decoration: BoxDecoration(
                                                          border: Border.all(width: 4,color: Colors.white),
                                                          color: Colors.blue,
                                                          borderRadius: BorderRadius.circular(50),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.white,
                                                                offset: Offset(6.0,6.0),
                                                            )
                                                          ]
                                                        ),
                                                        padding: EdgeInsets.all(5),
                                                        child: Text("Welcome to Day 2"),//Container can specify single child

                                                      ),
                                          ),
                       );
  }
}
