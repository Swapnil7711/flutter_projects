import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.black,
        primaryColor: Colors.black,
        accentColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Stateless App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('I am text line one'),
              Text('I am text line two'),
              RaisedButton(
                onPressed: () {},
                child: Text('Login'),
                splashColor: Colors.blue,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add_a_photo,
          ),
        ),
      ),
    );
  }
}
