import 'package:flutter/material.dart';

// void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation and Routing",
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Container(
        child: RaisedButton(
          color: Colors.blueAccent,
          onPressed: (){
            //We have to route to next page //Mehtod 1
            // Navigator.push(context,MaterialPageRoute(
            //     builder: (context)=>SecondScreen()
            // ));

            //Method 2
            Navigator.pushNamed(context, '/second');
          },
          child: Text("Navigate M1"),
        ),
      ),
    );
  }
}
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: RaisedButton(
          color: Colors.blueAccent,
          onPressed: (){
            //We have to route to previous page
            Navigator.pop(context);  //Popping is same for both methods
          },
          child: Text("Navigate M1"),
        ),
      ),
    );
  }
}


//METHOD 2 - Using routing
void main()=>runApp(MyApp2());

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Routing and Navigation",
      initialRoute: '/',
      routes: {
        '/': (context)=>FirstScreen(),
        '/second': (context)=>SecondScreen(),
      },

    );
  }
}

