import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: RaisedButton(),
  ));
}

class RaisedButton extends StatefulWidget {
  @override
  RaisedButtonState createState() {
    return (RaisedButtonState());
  }
}

class RaisedButtonState extends State<RaisedButton> {
  int counter = 0;

  String defaultText = 'Spanish Numbers';
  String numbers = 'Integer Numbers';

  List<String> sNumbers = [
    'uno',
    'dos',
    'tres',
    'cuatro',
    'cinco',
    'seis',
    'seite',
    'uchoo',
    'nueve',
    'dietz'
  ];

  List<String> sInt = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  void displayNumbers() {
    setState(() {
      defaultText = sNumbers[counter];
      numbers = sInt[counter];

      if (counter < 9) {
        counter++;
      } else {
        counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text(
          'Spanish Numbers',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                numbers,
                style: TextStyle(fontSize: 25.0),
              ),
              Text(defaultText, style: TextStyle(fontSize: 25.0)),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              FloatingActionButton(
                onPressed: displayNumbers,
                child: Icon(
                  Icons.vibration,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
