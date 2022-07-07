import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Alert",
      home: AlertWidget(),
    );
  }
}

class AlertWidget extends StatelessWidget {
  //Create new object of text editing controller
  TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      child: RaisedButton(
        child: Text("Basic Alert Dialogue Widget"),
        color: Colors.red,

        /*onPressed: (){
          //alertdialoguewidget(context);
          textfieldalertdialoguewidget(context,_textEditingController);


        },*/

        /*
        onPressed: ()async{
          final field fieldatt = await confirmalertdialoguewidget(context);
            if (fieldatt == field.Null)
            {
              print("Nothing returned");
            }
          print("User Selection $fieldatt");
        },*/

        onPressed: () async{
          final  selectopt? option = await selectalertdialoguewidget(context);
          print(option);
        },

      ),
    ),
    );
  }
}
//////////////////////////////////////////////////////////////////////////////////////

alertdialoguewidget(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Basic"),
          content: Text("This is for notification purpose"),
          actions: [
            RaisedButton(
              onPressed: (){
                Navigator.of(context).pop(); //Navigation property to remove alert box after clicking OK
              },
              child: Text("OK"),
              color: Colors.blue,
            ),
          ],
        );
      }
  );
}
//////////////////////////////////////////////////////////////////////////////////////

//We can access the data using text editing controller
textfieldalertdialoguewidget(BuildContext context, TextEditingController textEditingController){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Text Field"),
          content: TextField(
            decoration: InputDecoration(
              hintText: "Enter whatever you want",
            ),
            controller: textEditingController,
          ),
          actions: [
            RaisedButton(
              onPressed: (){
                Navigator.of(context).pop(); //Navigation property to remove alert box after clicking OK
              },
              child: Text("OK"),
              color: Colors.blue,
            ),
          ],
        );
      }
  );
}
////////////////////////////////////////////////////////////////////////////////////
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!IMPORTANT NOTE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

//Asynchronous Function is not working properly - It is returning immediately instead of waiting for the return by clicking button

//NOTE : Solution to this problem is given for next function, which is SelectalAlertWidget
  // Change return type from <option> to <option?> both for function and in MyApp

//////////////////////////////////////////////////////////////////////////////////////

//Make this part asynchronised, so that we can get future confirmation

/*
Synchronous : Other execution will be blocked till the current execution is completed
Asynchronous: If the current execution is taking some time, we can continue with other methods
 */

//The data will be stored in "Future" for later access


//Create enum field for confirm alert dialogue box
enum field {Confirm,Accept,Null}
Future<field> confirmalertdialoguewidget(BuildContext context) async{

   showDialog<field>(context: context,
      barrierDismissible: false, //Prevent dialog from closing on outside touch in Flutter
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text("This is for notification purpose"),
          actions: [
            RaisedButton(
              onPressed: (){
                Navigator.of(context).pop(field.Confirm); //Navigation property to remove alert box after clicking OK
              },
              child: Text("Cancel"),
              color: Colors.red,
            ),

            RaisedButton(
              onPressed: (){
                Navigator.of(context).pop(field.Accept); //Navigation property to remove alert box after clicking OK
              },
              child: Text("Accept"),
              color: Colors.blue,
            ),
          ],
        );
      }
  );
  return field.Null;
}


/////////////////////////////////////////////////////////////////////////////////////////////
enum selectopt {C,Java,Python,PHP,Null}
//User can select any of the data specified inside it.

Future<selectopt?> selectalertdialoguewidget(BuildContext context) async{
  return showDialog<selectopt>(
      context: context,
      barrierDismissible: true,
      builder:  (context){
        return SimpleDialog( //We don't have list option in alertDialogueWidget. So we use simple dialogue widget
          title: Text("Choose any one"),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("C"),
              onPressed: (){
                Navigator.pop(context,selectopt.C);
              },
            ),
            SimpleDialogOption(
              child: Text("Python"),
              onPressed: (){
                Navigator.pop(context,selectopt.Python);
              },
            ),
            SimpleDialogOption(
              child: Text("Java"),
              onPressed: (){
                Navigator.pop(context,selectopt.Java);
              },
            ),
            SimpleDialogOption(
              child: Text("PHP"),
              onPressed: (){
                Navigator.pop(context,selectopt.PHP);
              },
            ),
          ],
        );
}
);
  //return selectopt.Null;
}
