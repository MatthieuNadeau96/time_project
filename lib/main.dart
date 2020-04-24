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

  @override
  void initState() {
    tb = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

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
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: hour,
                      minValue: 0,
                      maxValue: 23,
                      listViewWidth: 60.0,
                      onChanged: (val) {
                        hour = val;
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
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: minute,
                      minValue: 0,
                      maxValue: 23,
                      listViewWidth: 60.0,
                      onChanged: (val) {
                        minute = val;
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
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: second,
                      minValue: 0,
                      maxValue: 23,
                      listViewWidth: 60.0,
                      onChanged: (val) {
                        second = val;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text('1'),
          ),
          Expanded(
            flex: 3,
            child: Text('3'),
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
