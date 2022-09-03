import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Switch and Table",
      home:Scaffold(
        appBar: AppBar(
          title: Text("Switch and Table"),
        ),
        body: table_widget(),
      )
    );
  }
}


//SWITCH WIDGET
class switch_widget extends StatefulWidget {
  const switch_widget({Key? key}) : super(key: key);

  @override
  State<switch_widget> createState() => _switch_widgetState();
}

class _switch_widgetState extends State<switch_widget> {
  bool switch_state = false;
  var textvalue = "Switch is OFF";
  void display_state() {
    if (switch_state == true) {
      setState(() {
        switch_state = false;
        textvalue = "Switch is OFF";
      });
    }
    else {
      if (switch_state == false) {
        setState(() {
          switch_state = true;
          textvalue = "Switch is ON";
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Transform.scale( //Used to increase or decrease the size of child widget
              scale: 0.9,
              child: Switch(
                activeColor: Colors.red,
                inactiveThumbColor: Colors.yellow,
                inactiveTrackColor: Colors.purple,
                activeTrackColor: Colors.pink,
                value: switch_state,
                onChanged: (bool val){
                  display_state();

                  // setState(() {
                  //   switch_state = val;
                  // });

                },
              ),
            )
          ),
          Text("$textvalue"),
        ],
      ),
    );
  }
}

//TABLE WIDGET
class table_widget extends StatefulWidget {
  const table_widget({Key? key}) : super(key: key);

  @override
  State<table_widget> createState() => _table_widgetState();
}

class _table_widgetState extends State<table_widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.all(20),
      child: Table(
        defaultColumnWidth: FixedColumnWidth(200),
        border: TableBorder.all(
            color: Colors.red,
            width: 2,
            style: BorderStyle.solid,
        ),
        children: [
          TableRow(
            children: [
              Column(
                children: [
                  Text("Name"),
                  Text("Ghanashyam"),
                ],
              ),
              Column(
                children: [
                  Text("Name"),
                  Text("Ghanashyam"),
                ],
              ),
              Column(
                children: [
                  Text("Name"),
                  Text("Ghanashyam"),
                ],
              )
            ]
          ),



          TableRow(
              children: [
                Column(
                  children: [
                    Text("Name"),
                    Text("Ghanashyam"),
                  ],
                ),
                Column(
                  children: [
                    Text("Name"),
                    Text("Ghanashyam"),
                  ],
                ),
                Column(
                  children: [
                    Text("Name"),
                    Text("Ghanashyam"),
                  ],
                )
              ]
          ),



          TableRow(
              children: [
                Column(
                  children: [
                    Text("Name"),
                    Text("Ghanashyam"),
                  ],
                ),
                Column(
                  children: [
                    Text("Name"),
                    Text("Ghanashyam"),
                  ],
                ),
                Column(
                  children: [
                    Text("Name"),
                    Text("Ghanashyam"),
                  ],
                )
              ]
          )
        ],
      ),
    );
  }
}

