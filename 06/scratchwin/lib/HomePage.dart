import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> itemArray;
  int luckyNumber;
  int count;

  AssetImage circle = AssetImage("images/circle.png");
  AssetImage lucky = AssetImage("images/rupee.png");
  AssetImage unlucky = AssetImage("images/sadFace.png");

  @override
  initState() {
    super.initState();

    setState(() {
      itemArray = List<String>.generate(25, (index) => "empty");
      generateLuckyNumber();
      count = 0;
    });
  }

  generateLuckyNumber() {
    luckyNumber = Random().nextInt(25);
    print(luckyNumber);
  }

  AssetImage getImage(int index) {
    String currentState = itemArray[index];

    switch (currentState) {
      case "lucky":
        return lucky;
        break;
      case "unlucky":
        return unlucky;
        break;
    }
    return circle;
  }

  showAlertDialogWinning(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(
        "Play Again",
        style: TextStyle(fontSize: 20.0),
      ),
      onPressed: () {
        this.resetGame();
        this.count = 0;
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Congratulations!!",
        style: TextStyle(fontSize: 25.0),
      ),
      content: Text(
        "You Are Lucky!",
        style: TextStyle(fontSize: 30.0),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(
        "Try Again",
        style: TextStyle(fontSize: 20.0),
      ),
      onPressed: () {
        this.resetGame();
        this.count = 0;
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.red,
      title: Text(
        "You Exceeded Maximum Attempts",
        style: TextStyle(fontSize: 30.0),
      ),
      content: Text(
        "Only 5 Guesses Allowed!",
        style: TextStyle(fontSize: 15.0),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void playGame(int index) {
    if (count < 5) {
      if (index == luckyNumber) {
        setState(() {
          itemArray[index] = "lucky";
          this.count = 5;
          showAlertDialogWinning(context);
        });
      } else {
        setState(() {
          itemArray[index] = "unlucky";
        });
      }
    } else {
      showAlertDialog(context);
    }
  }

  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
    });
  }

  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, "empty");
    });

    generateLuckyNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Scratch And Win",
            style: TextStyle(fontSize: 30),
          ),
          backgroundColor: Colors.red,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      crossAxisCount: 5),
                  itemCount: this.itemArray.length,
                  itemBuilder: (context, i) => SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: RaisedButton(
                      padding: EdgeInsets.all(20.0),
                      color: Colors.yellow,
                      onPressed: () {
                        this.playGame(i);
                        this.count++;
                      },
                      child: Image(
                        image: this.getImage(i),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    color: Colors.red,
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Reset",
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    onPressed: () {
                      this.resetGame();
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 15, 25, 80),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Colors.redAccent,
                  padding: EdgeInsets.all(20.0),
                  child: Text("ShowAll",
                      style: TextStyle(fontSize: 25.0, color: Colors.white)),
                  onPressed: () {
                    this.showAll();
                  },
                ),
              )
            ],
          ),
        ));
  }
}
