import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage cross = AssetImage('images/cross.png');
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage edit = AssetImage('images/edit.png');

  String message;

  List<String> gameState;

  bool isCross = true;

  @override
  void initState() {
    super.initState();

    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(
        "Reset Game",
        style: TextStyle(fontSize: 25.0, color: Colors.red),
      ),
      onPressed: () {
        this.resetGame();
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "",
        style: TextStyle(fontSize: 20.0),
      ),
      content: Text(
        this.message.toUpperCase(),
        style: TextStyle(fontSize: 25.0),
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

  checkWin() {
    if ((this.gameState[0] != 'empty') &&
        (this.gameState[0] == this.gameState[1]) &&
        (this.gameState[1] == this.gameState[2])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
        showAlertDialog(context);
      });
    } else if ((this.gameState[3] != 'empty') &&
        (this.gameState[3] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[5])) {
      setState(() {
        this.message = '${this.gameState[3]} Wins';
        showAlertDialog(context);
      });
    } else if ((this.gameState[6] != 'empty') &&
        (this.gameState[6] == this.gameState[7]) &&
        (this.gameState[7] == this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} Wins';
        showAlertDialog(context);
      });
    } else if ((this.gameState[0] != 'empty') &&
        (this.gameState[0] == this.gameState[3]) &&
        (this.gameState[3] == this.gameState[6])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
        showAlertDialog(context);
      });
    } else if ((this.gameState[1] != 'empty') &&
        (this.gameState[1] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[7])) {
      setState(() {
        this.message = '${this.gameState[1]} Wins';
        showAlertDialog(context);
      });
    } else if ((this.gameState[2] != 'empty') &&
        (this.gameState[2] == this.gameState[5]) &&
        (this.gameState[5] == this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[2]} Wins';
        showAlertDialog(context);
      });
    } else if ((this.gameState[0] != 'empty') &&
        (this.gameState[0] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
        showAlertDialog(context);
      });
    } else if ((this.gameState[2] != 'empty') &&
        (this.gameState[2] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[6])) {
      setState(() {
        this.message = '${this.gameState[2]} Wins';
        showAlertDialog(context);
      });
    } else if (!this.gameState.contains('empty')) {
      setState(() {
        this.message = "Game Draw";
        showAlertDialog(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TicTacToe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  color: Colors.white,
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(this.gameState[i]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.message,
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          RaisedButton(
            padding: EdgeInsets.all(20.0),
            color: Colors.blue,
            child: Text(
              'Reset Game',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            onPressed: resetGame,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Made By Swapnil Harpale",
              style: TextStyle(fontSize: 18.0),
            ),
          )
        ],
      ),
    );
  }
}
