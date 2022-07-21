import 'package:flutter/material.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tooltip and Slider",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tooltip and Slider"),
        ),
        body: slider() //tooltip()
      ),
    );
  }
}

class tooltip extends StatelessWidget {
  const tooltip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Tooltip(
        message: "Set alaram",
        waitDuration: Duration(seconds: 1),
        showDuration: Duration(seconds: 2),
        textStyle: TextStyle(
          color: Colors.red,
          fontSize: 100,
        ),
        decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadiusDirectional.circular(20)
        ),
        child: FlatButton(
          onPressed: (){},
          child: Icon(Icons.alarm),
        ),
      ),
    );
  }
}

//Slider
class slider extends StatefulWidget {
  const slider({Key? key}) : super(key: key);

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  int _value = 6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Icon(
            Icons.volume_up,
          ),
        ),
        Expanded(//It will cover entire space
            child: Slider(
              value: _value.toDouble(),
              min: 0,
              max: 20,
              activeColor: Colors.green,
              inactiveColor: Colors.red,
              label: "Set volume",
              onChanged: (double v){
                setState((){
                  _value = v.toInt(); //By using _value as int, the slider loses smoothness due to integral shifting.
                });
              },
            )
        )
      ],
    ),
    );
  }
}

//
// //Image Slider - Flutter Swiper
//
// class imageSlider extends StatelessWidget {
//   const imageSlider({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: img_slider(context),
//       constraints: BoxConstraints.expand(
//         height: 200,
//       ),
//     );
//   }
// }
//
// Swiper img_slider(BuildContext context){
//   return new Swiper(
//     autoplay: true,
//       itemCount:10,
//     itemBuilder: (BuildContext context, int index){
//       return Image.network(
//         "https://www.myfreewalls.com/public/uploads/preview/8k-hacker-hacking-picture-wallpaper-background-11624016865nds6eol9ei.jpg",
//         //fit: BoxFit.cover,
//       );
//     },
//   );
// }
//
//

