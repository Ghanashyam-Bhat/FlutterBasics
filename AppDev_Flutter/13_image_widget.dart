import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Why use material app?   Without that I got this error
    //https://stackoverflow.com/questions/66181322/flutter-error-renderflex-with-multiple-children-has-a-null-textdirection
    return MaterialApp(
          title: "Assets",
          home: Scaffold(
          appBar: AppBar(
          title: Text("Assets-Images"),
      ),
            body: Column(
              children: <Widget>[
                 Image.asset("assets/images/1.jpg",height: 200,width: 200,),
                Text("Why so serious ??"),

                Image.network("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",height: 200,width: 100,),
                FadeInImage.assetNetwork(placeholder: "assets/images/1.jpg", image:"https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",height: 200,width: 100,)
              ],
            ),
      ),
    );

  }
}

