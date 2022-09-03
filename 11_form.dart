import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Form",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Form"),
          leading: Icon(Icons.format_align_center),
        ),
        body: MyForms(), //Returning from stateful widget
      ),
    );
  }
}


//Create a stateful widget for form - Name should be same as calling function in stateless widget
class MyForms extends StatefulWidget {
  const MyForms({Key? key}) : super(key: key);

  @override
  State<MyForms> createState() => _MyFormsState();
}

class _MyFormsState extends State<MyForms> {
  //We need this global key to extract unique details of user for validation purposes.
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key:formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField( //We can use TextFormField or TextField
            decoration: InputDecoration(
              hintText: "Enter your name",
              labelText: "Name",
              icon: Icon(Icons.person),
            ),

            //Validation of input data can be done by -
            validator: (value){
              if(value?.isEmpty ?? true){ // Same as this code :- if(value == '' || value ==null)
                return "Please fill the details";
              }
              return null;
            },
          ),

          TextFormField( //We can use TextFormField or TextField

            decoration: InputDecoration(
              hintText: "Enter your password",
              labelText: "Password",
              icon: Icon(Icons.lock),
            ),

            //Validation of input data can be done by -
            validator: (value){
              if(value?.isEmpty ?? true){ // Same as this code :- if(value == '' || value ==null)
                return "Please fill the details";
              }
              return null;
            },
          ),

          TextFormField( //We can use TextFormField or TextField
            decoration: InputDecoration(
              hintText: "Enter your github link",
              labelText: "Github",
              icon: Icon(Icons.link),
            ),

            //Validation of input data can be done by -
            validator: (value){
              //https://www.codegrepper.com/code-examples/dart/dart+string+empty+or+null
              if(value?.isEmpty ?? true){ // Same as this code :- if(value == '' || value ==null)
                  return "Please fill the details";
              }
              return null;
            },

          ),
          Container(
            child: RaisedButton(
              //The validator functions to be called after hitting submit button.
              //So we need to call it in onPressed method.

              //https://docs.flutter.dev/cookbook/forms/validation
              onPressed: (){
                //if(formKey.currentState.validate()) {
                if(formKey.currentState!.validate()) {
                   ScaffoldMessenger.of(context).showSnackBar(  //Replace Scaffold with ScaffoldMessenger because Scaffold.of(context).showSnackbar() is depricated
                        SnackBar(
                            content: Text("Validation going on")
                        ),
                    );
                  }
              },
              child: Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}

