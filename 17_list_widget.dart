//newCard.dart

import 'package:flutter/material.dart';
import 'main.dart';

class newCard extends StatelessWidget {
  final data datas;
  const newCard({Key? key,required this.datas}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
              child: Icon(datas.icon,size: 50,),
          ),
          Text(datas.title),
        ],
      ),
    );
  }
}










//main.dart

import 'package:flutter/material.dart';
import 'package:hello_world/newCard.dart';



//--------------------------------------------------------------
//BASIC LIST

/*
void main()
{
  runApp(MyApp());
}
*/
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lists",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Basic Lists"),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home), //Icon at front of text
              title: Text("Tile 1"),
              trailing:Icon(Icons.security) ,//Icon at back of text
            ),

            ListTile(
              leading: Icon(Icons.phone), //Icon at front of text
              title: Text("Tile 2"),
              trailing:Icon(Icons.settings) ,//Icon at back of text
            ),
            ListTile(
              leading: Icon(Icons.headphones), //Icon at front of text
              title: Text("Tile 3"),
              trailing:Icon(Icons.zoom_in_map) ,//Icon at back of text
            )
          ],
        ),
      ),
    );
  }
}
//--------------------------------------------------------------
//LONG LIST

/*
void main()
{
  //Passed Parameter therefore we need to use constructor in the class MyApp2
  runApp(MyApp2(
    names: List<String>.generate(50, (a) => "Coders!! $a")
  ));
}
*/
class MyApp2 extends StatelessWidget {
  final List<String> names;

  //Constructor
  const MyApp2({Key? key, required this.names}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lists",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Long Lists"),
        ),
        body: ListView.builder(
          itemCount: names.length,
          itemBuilder:(context,index){
          return ListTile(
            title: Text("Hii ${names[index]}"),
          );

          },
        )
      ),
    );
  }
}
//--------------------------------------------------------------
//GRID VIEW LIST

//void main()=>runApp(MyApp3());

class MyApp3 extends StatelessWidget {
  const MyApp3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lists",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grid View"),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(datas.length, (index){
            return Center(
              child: newCard(
                  datas : datas[index]
              ),
            );
          }),
        ),
      ),
    );
  }
}

//Creating new datatype / widget
class data{
  const data({required this.title,required this.icon});
  final String title;
  final IconData icon;
}

//Creating a list containg data of datatype "data" created by us
const List<data> datas = const <data>[
  const data(
    title: "Home",icon:Icons.home,
  ),

  const data(
    title: "Call",icon:Icons.phone,
  ),

  const data(
    title: "Setting",icon:Icons.settings,
  ),

  const data(
    title: "Security",icon:Icons.security,
  ),

  const data(
    title: "Headphone",icon:Icons.headphones,
  ),

  const data(
    title: "Battery",icon:Icons.battery_0_bar,
  ),

];


//--------------------------------------------------------------
//HORIZONTAL LIST

void main()
{
  runApp(MyApp4());
}

class MyApp4 extends StatelessWidget {
  const MyApp4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Horizontal List",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Horizontal List"),
        ),
        body: Container(
          height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 148.0,
                color: Colors.red,
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text("home"),
                  ),
                ),
              ),

              Container(
                width: 148.0,
                color: Colors.green,
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.bus_alert),
                    title: Text("bus"),
                  ),
                ),
              ),

              Container(
                width: 148.0,
                color: Colors.yellow,
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.print),
                    title: Text("print"),
                  ),
                ),
              ),


              Container(
                width: 148.0,
                color: Colors.blue,
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.contact_mail),
                    title: Text("contact"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


