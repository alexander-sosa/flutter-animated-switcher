import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage>{
  bool move=false, sentido=true;
  var grand = Random();
  double ancho=100,alto=400;
  List colors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.cyanAccent,Colors.indigoAccent,Colors.deepPurpleAccent];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('AniBarra_Demo'),
          ),

          body:Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                child: Container(
                  width: sentido ? ancho : alto,
                  height: sentido ? alto : ancho,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [colors[index][700],colors[index][100]],
                        begin:
                        sentido ?
                        move ? Alignment.topCenter : Alignment.bottomCenter
                            : move ? Alignment.centerLeft : Alignment.centerRight,
                        end:
                        sentido ?
                        move ? Alignment.centerRight : Alignment.centerLeft
                            : move ? Alignment.bottomCenter : Alignment.topCenter,

                      ),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1.0)
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 500),
                        top: sentido ? move ? 298 : 0 : 0,
                        left: sentido ? 0 :  move ? 298 : 0,
                        child: Container(
                          width: 98,
                          height: 100,
                          decoration: BoxDecoration(
                              gradient: RadialGradient(colors: [colors[index][100], colors[index][700]]),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 2.0)
                          ),
                          child: IconButton(
                              icon: Icon(
                                  move ? Icons.mic_off : Icons.mic
                              ),
                              iconSize: 50,
                              onPressed: (){
                                setState(() {
                                  index = grand.nextInt(colors.length);
                                  move = !move;
                                });
                              }
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              )


          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(
                  sentido ? Icons.swap_horiz : Icons.vertical_align_center
              ),
              onPressed:(){
                setState(() {
                  sentido = !sentido;
                });
              }
          )
      ) ,

    );

  }
}