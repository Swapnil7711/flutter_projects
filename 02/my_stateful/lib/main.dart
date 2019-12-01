import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyButton(),
  ));
}

class MyButton extends StatefulWidget {
  @override
  MyButtonState createState() {
    return MyButtonState();
  }
}

class MyButtonState extends State<MyButton> {
  int counter = 0;

  List<String> spanishNumbers = [
    'uno',
    'dos',
    'tres',
    'countro',
    'cinco',
    'seis',
    'seite',
    'ocho',
    'nueve',
    'dietz'
  ];

  String defaultText = 'Spanish Numbers';

  void displaySpanishNumber() {
    setState(() {
      defaultText = spanishNumbers[counter];

      if (counter < 9) {
        counter++;
      } else {
        counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spanish Number App'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(defaultText,
                  style: TextStyle(fontSize: 30.0, color: Colors.black)),
              Padding(padding: EdgeInsets.all(10)),
              RaisedButton(
                onPressed: displaySpanishNumber,
                child: Text(
                  'Call Numbers',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
