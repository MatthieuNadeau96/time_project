import 'package:flutter/material.dart';

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

  @override
  void initState() {
    tb = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
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
          Text('Timer'),
          Text('Stopwatch'),
        ],
        controller: tb,
      ),
    );
  }
}
