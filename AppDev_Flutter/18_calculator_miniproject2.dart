/*
In the code given by the instructor, there were plenty of loopholes which I have fixed in my code.
->The code was able perform operation between only 2 numbers and previous operations were forgotten. So I fixed it by updating the "num1"
every time a operator is clicked, instead of just calculating when pressed "=".
->Displaying the operator selected at top left
->Displaying previously calculated values at bottom right
->After pressing "=", if we pressed any operand, it would have been appended to calculated value. Removed that and started appending to "0.00". Previously calculated value will be used only if operator is pressed.

*/

import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String prev_fun = "";
  int prev_is_operator = 0;
  String output = "0.00";
  String _output = "";
  double num1 = 0.0;
  double num2 = 0.0;
  String operator = "";
  //Creating function to perform operations
  operation(String btnText){
    if(btnText == "C"){
      prev_fun = "CLEAR";
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      output = "0";
    }
    else if(btnText == "+"||btnText == "-"||btnText == "x"||btnText == "/"){
      if(operator=="+")
      {
        num1 = num1 + double.parse(output);
      }
      else if(operator=="-")
      {
        num1 = num1 - double.parse(output);
      }
      else if(operator=="x")
      {
        num1 = num1 * double.parse(output);
      }
      else if(operator=="/")
      {
        num1 = num1 / double.parse(output);
      }
      else if(operator=="")
      {
        num1 = double.parse(output);
      }
      operator = btnText;
      prev_is_operator = 1;
      prev_fun = operator;
      //_output = num1.toStringAsFixed(2);
      _output = "0";
    }
    else if(btnText=="="){
      num2 = double.parse(output);
      prev_fun = "=";
      if(operator=="+")
      {
        _output = (num1+num2).toString();
      }
      else if(operator=="-")
      {
        _output = (num1-num2).toString();
      }
      else if(operator=="x")
      {
        _output = (num1*num2).toString();
      }
      else if(operator=="/")
      {
        _output = (num1/num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operator = "";
      prev_is_operator = 2;
    }
    else{
      if (prev_fun =="CLEAR")
      {
        prev_fun = "";
      }
      if (prev_is_operator==1){
        _output = btnText;
        prev_is_operator = 0;
      }
      else if(prev_is_operator==2){
        prev_fun = "";
        _output = btnText;
        prev_is_operator = 0;
      }
      else{
        _output = _output + btnText;
      }
    }

    setState((){
      output = double.parse(_output).toStringAsFixed(2);
    });
  }



  //Creating new widget which can be called repeatedly
  Widget button(btnText){
    return Expanded(
      child: RawMaterialButton(
        onPressed: (){
          operation(btnText);
        },
        shape: Border.all(color: Colors.black,width: 2),
        fillColor: Colors.black12,
        splashColor: Colors.black,
        padding: EdgeInsets.all(30.0),
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Colors.black54,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        prev_fun,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    alignment:Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top:180,right: 30),
                      child: Text(
                        num1.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child:  Container(
                      height: 200,
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        border: Border.all(color: Colors.black,width: 2),
                      ),
                      margin: EdgeInsets.only(bottom: 8,top:8,left: 2,right: 2),
                      padding: EdgeInsets.all(20),
                      child: Text(
                          output,
                          style:TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 60,
                          )
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: <Widget>[
                  SizedBox(width: 2,),
                  button("7"),
                  SizedBox(width: 2,),
                  button("8"),
                  SizedBox(width: 2,),
                  button("9"),
                  SizedBox(width: 2,),
                  button("/"),
                  SizedBox(width: 2,),
                ],
              ),
              SizedBox(height: 2,),

              Row(
                children: <Widget>[
                  SizedBox(width: 2,),
                  button("4"),
                  SizedBox(width: 2,),
                  button("5"),
                  SizedBox(width: 2,),
                  button("6"),
                  SizedBox(width: 2,),
                  button("x"),
                  SizedBox(width: 2,),
                ],
              ),
              SizedBox(height: 2,),

              Row(
                children: <Widget>[
                  SizedBox(width: 2,),
                  button("1"),
                  SizedBox(width: 2,),
                  button("2"),
                  SizedBox(width: 2,),
                  button("3"),
                  SizedBox(width: 2,),
                  button("-"),
                  SizedBox(width: 2,),
                ],
              ),
              SizedBox(height: 2,),

              Row(
                children: <Widget>[
                  SizedBox(width: 2,),
                  button("C"),
                  SizedBox(width: 2,),
                  button("0"),
                  SizedBox(width: 2,),
                  button("="),
                  SizedBox(width: 2,),
                  button("+"),
                  SizedBox(width: 2,),
                ],
              ),
              SizedBox(height: 2,),

            ],
          ),
        ),
      ),
    );
  }
}



