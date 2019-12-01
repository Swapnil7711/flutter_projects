import 'package:flutter/material.dart';
import 'package:mydrawerapp/Category.dart';

import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Drawer App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/category': (BuildContext context) => Category(),
      },
    );
  }
}
