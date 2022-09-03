import 'package:flutter/material.dart';
import 'dart:async'; //Timer module

// import 'package:splashscreen/splashscreen.dart'; //Method 2 of Splash Screen

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Splash Screen",
        home:Scaffold(
          appBar: AppBar(
            title: Text("Splash Screen"),
          ),
          body: SplashScreen1(),
        )
    );
  }
}

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  void initState(){
    super.initState();
    //Automatically pushes new page after 5 seconds after loading this page
    Timer(
        Duration(seconds: 5),
            ()=> Navigator.pushReplacement(context,MaterialPageRoute(
            builder: (context)=>HomePage()
        ))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Image.network("https://cdn.logo.com/hotlink-ok/logo-social.png"),
      ),
    );
  }
}


//THIS IS THE SCREEN FOLLOWING THE SPLASH SCREEN - have to make these screen visible for limited time
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to Splash screen"),
        ),
      ),
    );
  }
}
//Some error occured with loading this package

// class SplashScreen2 extends StatelessWidget {
//   const SplashScreen2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen( //Widget present in Package
//       seconds: 5,
//       navigateAfterSeconds: HomePage(),
//       title: Text("Package SplashScreen"),
//       image: Image.network("https://cdn.logo.com/hotlink-ok/logo-social.png"),
//       photoSize: 100,
//       loadingText: Text("Loading..."),
//       loaderColor: Colors.blueAccent,
//     );
//   }
// }

