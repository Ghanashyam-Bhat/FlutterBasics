import 'package:flutter/material.dart';
import 'package:hello_world/Services/AgeCalculation.dart';
import 'package:age/age.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DateTime todayDate = DateTime.now();

  List<String> _months= [
    "Months",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  AgeDuration  _ageDuration = new AgeDuration();
  AgeDuration _nextBorthdayDuration = new AgeDuration();
  String _weekday = "";

  DateTime dob = new DateTime(2002,12,11);

  Future<Null> _selectTodayDate(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate:  dob,
        lastDate: DateTime(2101),
    );
    if (picked != null && picked != todayDate)
      {
        setState((){
          todayDate = picked;
          _ageDuration = AgeCalculation().CalculateAge(todayDate, dob);
          _nextBorthdayDuration = AgeCalculation().nextBirthday(todayDate, dob);
          _weekday = AgeCalculation().nextWeekDay(todayDate,dob);
        });
      }
  }

  Future<Null> _selectDOB(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dob,
      firstDate:  DateTime(1900),
      lastDate: todayDate,
    );
    if (picked != null && picked != dob)
    {
      setState((){
        dob = picked;
        _ageDuration = AgeCalculation().CalculateAge(todayDate, dob);
        _nextBorthdayDuration = AgeCalculation().nextBirthday(todayDate, dob);
        _weekday = AgeCalculation().nextWeekDay(todayDate,dob);
      });
    }
  }

  void initState(){
    super.initState();
    _ageDuration = AgeCalculation().CalculateAge(todayDate, dob);
    _nextBorthdayDuration = AgeCalculation().nextBirthday(todayDate, dob);
    _weekday = AgeCalculation().nextWeekDay(todayDate,dob);
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea( //WHAT DOES THIS WIDGET DO?
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                  width: double.maxFinite, //WHAT DOES THIS DO?
                ),
                //HEADING - AGE CALCULATOR
                Text(
                    "AGE CALCULATOR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 40,),
                //ROW  - 1 - TODAY
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Today",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "${todayDate.day} ${_months[todayDate.month].toUpperCase()} ${todayDate.year}",
                            style: TextStyle(
                              color: Color(0xffCDDC39),
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){
                              _selectTodayDate(context);
                            },
                            child: Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //ROW - 2 - BIRTHDAY
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Date of Birth",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "${dob.day} ${_months[dob.month].toUpperCase()} ${dob.year}",
                            style: TextStyle(
                              color: Color(0xffCDDC39),
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){
                              _selectDOB(context);
                            },
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                //ROW 3 - BOX
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 40
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Color(0xff333333),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          //LEFT PART OF BLOCK
                          Container(
                            height: 190,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "AGE",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    //NUMBER
                                    Text(
                                      "${_ageDuration.years}",
                                      style: TextStyle(
                                        color: Color(0xffCDDC39),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 76,
                                      ),

                                    ),
                                    //TEXT
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 13.0),
                                      child: Text(
                                        "YEARS",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${_ageDuration.months} Months | ${_ageDuration.days} days",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          //MIDDLE LINE
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            height: 190,
                            width: 1,
                            color: Color(0xff999999),
                          ),
                          //RIGHT PART OF THE BLOCK
                          Container(
                            height: 190,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "NEXT BIRTHDAY",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(
                                  Icons.cake,
                                  color: Color(0xffCDDC39),
                                  size: 40,
                                ),
                                Text(
                                  "${_weekday.toUpperCase()}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "${_nextBorthdayDuration.months} Months | ${_nextBorthdayDuration.days} days",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                      //BOTTOM LINE
                      Container(
                        height: 1,
                        width: double.maxFinite,
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      //2ND HALF OF THE BOX

                      //TEXT ROW
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                            "SUMMARY",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xffCDDC39)
                          ),
                        ),
                      ),
                      //CONTAINERS ROW
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "YEARS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "${_ageDuration.years}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: <Widget>[
                              Text(
                                "MONTHS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "${_ageDuration.years*12+_ageDuration.months}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: <Widget>[
                              Text(
                                "WEEKS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "${(todayDate.difference(dob).inDays/7).floor()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          )
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "DAYS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "${todayDate.difference(dob).inDays}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "HOURS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "${todayDate.difference(dob).inHours}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "MINUTES",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "${todayDate.difference(dob).inMinutes}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 100,left: 100),
                  child:Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget>[
                      Text(
                        "Made with ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.heart_broken,color: Colors.red,),
                      Text(
                          " by @the.giga.byte",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
