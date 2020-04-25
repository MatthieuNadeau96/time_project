import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController tb;
  int hour = 0;
  int minute = 0;
  int second = 0;
  bool started = true;
  bool stopped = true;
  int timeForTimer = 0;
  String timeToDisplay = '';

  @override
  void initState() {
    tb = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  void startHandler() {
    timeForTimer = ((hour * 60 * 60) + (minute * 60) + second);
    Timer.periodic(
        Duration(
          seconds: 1,
        ), (Timer t) {
      setState(() {
        if (timeForTimer < 1) {
          t.cancel();
        } else {
          timeForTimer = timeForTimer - 1;
        }
        timeToDisplay = timeForTimer.toString();
      });
    });
  }

  void stopHandler() {}

  Widget timer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Hours
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        'HH',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: hour,
                      minValue: 0,
                      maxValue: 23,
                      listViewWidth: 60.0,
                      onChanged: (val) {
                        setState(() {
                          hour = val;
                        });
                      },
                    ),
                  ],
                ),
                // Minutes
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        'MM',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: minute,
                      minValue: 0,
                      maxValue: 23,
                      listViewWidth: 60.0,
                      onChanged: (val) {
                        setState(() {
                          minute = val;
                        });
                      },
                    ),
                  ],
                ),
                // Seconds
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        'SS',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: second,
                      minValue: 0,
                      maxValue: 23,
                      listViewWidth: 60.0,
                      onChanged: (val) {
                        setState(() {
                          second = val;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              timeToDisplay,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: started ? startHandler : null,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  color: Colors.green[300],
                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                RaisedButton(
                  onPressed: stopped ? null : stopHandler,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  color: Colors.red[300],
                  child: Text(
                    'Stop',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Project"),
        centerTitle: true,
        bottom: TabBar(
          tabs: <Widget>[
            Text('Timer'),
            Text('Stopwatch'),
          ],
          labelPadding: EdgeInsets.only(bottom: 10),
          labelStyle: TextStyle(fontSize: 18.0),
          unselectedLabelColor: Colors.white60,
          controller: tb,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          timer(),
          Text('Stopwatch'),
        ],
        controller: tb,
      ),
    );
  }
}
