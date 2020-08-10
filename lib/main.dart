import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stopwatch',
      theme: ThemeData(
        canvasColor: Colors.black12,
        //iconTheme: new IconThemeData(color: Colors.white),
        accentColor: Colors.pinkAccent,
        brightness: Brightness.dark,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {

  double _progress = 0;

  void startTimer() {
    new Timer.periodic(
      Duration(seconds: 1),
          (Timer timer) => setState(
            () {
          if (_progress == 1) {
            timer.cancel();
          } else {
            _progress += 0.2;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스톱워치'),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 90,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: 0.9,
                  center: Text("90.0%"),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.greenAccent,
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '12',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '24',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.0,
                ),
                Container(
                  width: 120,
                  height: 200,
                  child: ListView(
                    children: <Widget>[
                      Text(
                        '5등 8.19',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        '4등 4.19',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        '3등 3.19',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        '2등 2.19',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            //in this demo, only the button text is updated based on the bottom app bar clicks
            child: RaisedButton(
              color: Colors.pinkAccent,
              child: Text('랩타임',style: TextStyle(color: Colors.white),),
              onPressed: () {

              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //specify the location of the FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _progress = 0;
          });
          startTimer();
        },
        tooltip: "Centre FAB",
        child: Container(
          //margin: EdgeInsets.all(15.0),
          child: Icon(Icons.play_arrow),
        ),
        elevation: 10.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                iconSize: 27.0,
                icon: Icon(
                  Icons.rotate_right,
                  color: Colors.pinkAccent,
                ),
              ),
            ],
          ),
        ),
        //to add a space between the FAB and BottomAppBar
        shape: CircularNotchedRectangle(),
        color: Colors.white,
      ),
    );
  }
}
