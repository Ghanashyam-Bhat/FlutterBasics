import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Card Widget",
      home: DefaultTabController( //This is for TabBar
        length: 3, //Number of tabs in tab bar
        child: Scaffold(


          appBar: AppBar(
            title: Text("Tab Bar and Drawer"),
            backgroundColor: Colors.red,
            bottom: TabBar(
              tabs: [ //If there are no 3 tabs, it will give error
                Tab(
                  icon: Icon(Icons.store),
                  text: "Store",
                ),
                Tab(
                  icon: Icon(Icons.cable),
                  text: "Connect",
                ),
                Tab(
                  icon: Icon(Icons.phone),
                  text: "contact",
                ),
              ],
            ),
          ),

          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.all(8),
              children:<Widget> [
                UserAccountsDrawerHeader(
                  accountName: Text("Username"),
                  accountEmail:Text("ghanashyambhat6@gmail.com"),

                  /*currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: Icon(Icons.person),
                ),*/

                  currentAccountPicture: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        //Surprisingly relative path worked
                        image: DecorationImage(image: AssetImage("assets/images/1.jpg"),fit: BoxFit.cover)
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  /* onTap: (){  //Routing we will learn later
                  HomePage()
                }, */
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  /* onTap: (){
                  HomePage()
                }, */
                ),
              ],
            ),
          ),

          body:TabBarView(
            children: [
              HomePage(),
              Connect(),
              Contact(),
            ],
          ),
        ),
      )
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Welcome to Home page"),
    );
  }
}

class Connect extends StatelessWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Page 2"),
    );
  }
}

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Page 3"),
    );
  }
}


