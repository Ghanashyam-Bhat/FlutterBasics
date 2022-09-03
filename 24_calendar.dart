import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calender",
      home:Scaffold(
        appBar: AppBar(
          title: Text("Calender"),
        ),
        body:calender_widget(),
      )
    );
  }
}

class calender_widget extends StatefulWidget {
  const calender_widget({Key? key}) : super(key: key);

  @override
  State<calender_widget> createState() => _calender_widgetState();
}

class _calender_widgetState extends State<calender_widget> {
  /*
  CalendarController _controller;
  void initState(){
    super.initState();
    _controller = CalendarController;
  }*/
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
      TableCalendar(
        headerStyle: HeaderStyle(
          headerPadding: EdgeInsets.only(left: 50)
        ),

        calendarFormat: CalendarFormat.month,

        calendarStyle: CalendarStyle(

          selectedDecoration: BoxDecoration(
            color: Colors.green,
          ),

          todayDecoration: BoxDecoration(
            color: Colors.blueAccent,
          ),

          todayTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),

        ),

        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
    ),
        ],
      ),
    );
  }
}


