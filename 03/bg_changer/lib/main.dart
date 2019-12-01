import 'package:flutter/material.dart';

import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BackGround Changer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Background changer'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentColor = Colors.white;
  var bbg = Colors.black;

  var colors = [
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.purple,
    Colors.red,
    Colors.orange,
    Colors.grey,
    Colors.pink,
  ];

  var bgColor = [
    Colors.black,
    Colors.blueGrey,
    Colors.redAccent,
  ];

  void setBGColor() {
    var rnd = Random().nextInt(colors.length);

    var rr = Random().nextInt(bgColor.length);

    setState(() {
      currentColor = colors[rnd];
      bbg = bgColor[rr];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: currentColor,
      child: Center(
        child: RaisedButton(
          color: bbg,
          child: Text(
            'Change BG Color',
            style: TextStyle(color: Colors.white),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: setBGColor,
        ),
      ),
    );
  }
}
