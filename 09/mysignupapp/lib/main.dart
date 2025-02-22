import 'package:flutter/material.dart';
import 'SignUpPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignUpDemo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SignUpPage(),
    );
  }
}
