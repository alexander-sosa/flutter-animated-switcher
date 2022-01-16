import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  List colors = [Colors.pink, Colors.cyan];
  int i = 0;

  bool on = true, display = true;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Switch'),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.linearToEaseOut,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 2000),
                    curve: Curves.linearToEaseOut,
                    width: display ? 100 : 500,
                    height: display ? 500: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [colors[i][100], colors[i][400], colors[i][700]],
                          begin: on ? (display ? Alignment.topCenter : Alignment.centerLeft) : (display ? Alignment.bottomCenter : Alignment.centerRight),
                          end: on ? (display ? Alignment.bottomCenter : Alignment.centerRight) : (display ? Alignment.topCenter : Alignment.centerLeft),
                      ),
                      borderRadius: BorderRadius.circular(100.0)
                    ),

                    child: Stack(children: [currentSwitch()]),
                  ),
              ),
              button()
            ],
          ),
        )

      ),
    );
  }

  Widget currentSwitch(){
      return AnimatedPositioned(
          duration: Duration(milliseconds: 1000),
          top: display ? on ? 0 : 400 : 0,
          left: display ? 0 : on ? 0 : 292,
        child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: on ? Colors.pinkAccent : Colors.cyanAccent,
                borderRadius: BorderRadius.circular(100)
            ),

            child: IconButton(
                icon: Icon(on ? Icons.wifi : Icons.signal_wifi_off, color: Colors.white),
                iconSize: 30,
                onPressed: (){
                  setState(() {
                    i = (i == 1) ? i = 0 : i = 1;
                    on = !on;
                  });
                }
            ),
          ),
      );
  }

  Widget horizontalSwitch(){
    return AnimatedPositioned(
      duration: Duration(milliseconds: 1000),
      left: on ? 0 : 400, // android: 292

      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(100)
        ),

        child: IconButton(
            icon: Icon(Icons.bolt, color: Colors.white),
            iconSize: 30,
            onPressed: (){
              setState(() {
                i = (i == 1) ? i = 0 : i = 1;
                on = !on;
              });
            }
        ),
      ),
    );
  }

  Widget button() {
    return FlatButton(
        onPressed: (){
          setState(() {
            display = !display;
          });
        },
        child: Text('Change Display...')
    );
  }

}