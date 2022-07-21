import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


//Make the function async to connect it with firebase database
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Signup With Firebase" ,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup With Firebase"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(200.0),
              child: RaisedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUp()));
                  },
                child: Text("Signup"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget {

  //Text Editing controller are used to get input from the form filds
  TextEditingController _email = new TextEditingController();
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  Future<void> signup() async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _password.text
      );
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body:  Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    border: InputBorder.none,
                    labelText: "Enter Username",
                    hintText: "Username"
                ),
                controller: _username,
              ),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(20)
              ),
            ),

            // SizedBox(height: ,width: ,)

            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.mail),
                    labelText: "Enter Email",
                    hintText: "Email"
                ),
                controller: _email,
              ),
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20)
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.mail),
                    labelText: "Enter New Pasword",
                    hintText: "Password"
                ),
                controller: _password,
              ),
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20)
              ),
            ),

            Container(
              height: 40,
              width: 100,
              child: FlatButton(
                child: Text("Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,

                ),
                ),
                onPressed: (){
                  signup();
                },
              ),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20)
              ),
            )
          ],
        ),
      )
    );

  }
}

