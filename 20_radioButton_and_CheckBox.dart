import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

enum Gender{Male,Female,Prefer_not_to_say}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? firstbox = false;
  bool? secondbox = true; //Since this value is true, the checkbox will by default be checked
  bool? thirdbox = false;

  Gender? gender = Gender.Female;
  //If same variable used for 2 or more checkboxes, both gets changed simultaneously
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CheckBox and Radio Buttons",
      home: Scaffold(
        appBar: AppBar(
          title: Text("CheckBox and RadioButtons"),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text("Hobby"),
                ],
              ),
              Row(
                children: [
                  Text("Painting"),
                  Checkbox(
                      value: this.firstbox,
                      onChanged: (bool? value){
                        setState((){
                          this.firstbox = value;
                        });
                      }
                  ),
                ],
              ),

              Row(
                children: [
                  Text("Singing"),
                  Checkbox(
                    checkColor: Colors.red,
                      activeColor: Colors.green,
                      value: this.secondbox,
                      onChanged: (bool? value){
                        setState((){
                          this.secondbox = value;
                        });
                      }
                  ),
                ],
              ),


              //Another method of creating checkboxes
              CheckboxListTile(
                  title: Text("Check Box Tile"),
                  subtitle: Text("Fine!!"),
                  secondary: Icon(Icons.home),
                  value: this.thirdbox,
                  onChanged: (bool? value){
                    setState((){
                      this.thirdbox = value;
                    });
                  }
              ),


                  //Radio Buttons
                  ListTile(
                    leading: Radio(
                      groupValue: gender,
                      value: Gender.Male,
                      onChanged: (Gender? value){
                        setState((){
                          this.gender = value;
                        });
                      },
                    ),
                    title: Text("Male"),
                  ),
                  ListTile(
                    leading: Radio(
                      groupValue: gender,
                      value: Gender.Female,
                      onChanged: (Gender? value){
                        setState((){
                          this.gender = value;
                        });
                      },
                    ),
                    title: Text("Female"),
                  ),
                  ListTile(
                    leading: Radio(
                      groupValue: gender,
                      value: Gender.Prefer_not_to_say,
                      onChanged: (Gender? value){
                        setState((){
                          this.gender = value;
                        });
                      },
                    ),
                    title: Text("Others"),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

