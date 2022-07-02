void main()
{
  //type runApp() and press enter
  runApp(MyApp());
}

//type st and select
class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
                        title: "Application 1",//This is the title of the app, not home page
                        home : Scaffold(
                                          backgroundColor: Colors.black,
                                          appBar: AppBar(title: const Text("Day 1"),
                                                          backgroundColor: Colors.red,
                                                          leading: Icon(Icons.home),
                                                        ),
                                          body: const Center(child: Text("Hello World"),),
                                       ),
                       );
  }
}

