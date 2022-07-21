import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Progress Bar and Snack Bar",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Progress Bar and Snack bar"),
        ),
         body:Snack_Bar()// Linear()//Circular(),
      ),
    );
  }
}

//Linear Progress Bar
class Linear extends StatefulWidget {
  const Linear({Key? key}) : super(key: key);

  @override
  State<Linear> createState() => _LinearState();
}

class _LinearState extends State<Linear> {
  bool loading = false; //Default value is kept false
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: loading?LinearProgressIndicator():Text("Please Click to Download!!"),//Ternary Operator. If true, LinearProgressIndocator, if false, Text widget

          ),
          RaisedButton(
              onPressed: (){
                //loading = !loading; //->We should not do this, It will not work. We have to always use set state
                setState((){
                  this.loading = !this.loading;
                });

              },
            child: Text("Download"),
          )
        ],
      ),
    );
  }
}

//Only stateful widget supports setState method


//Circular Progress Bar
class Circular extends StatelessWidget {
  const Circular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircularProgressIndicator(
        backgroundColor: Colors.green,
        color: Colors.red,
        strokeWidth: 5,
      ),
    );
  }
}



//Snack bar
class Snack_Bar extends StatelessWidget {
  const Snack_Bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        child: Text("Snack bar"),
        color: Colors.pink,
        onPressed: (){
          final message = SnackBar(
              content: Text("Button is Pressed"),
            duration:Duration(seconds: 3),
            //animation:,
            action: SnackBarAction(
              label: "Press This",
              onPressed: (){},
            ),
          );
          Scaffold.of(context).showSnackBar(message);
        },
      ),
    );
  }
}

