import 'package:flutter/material.dart';
import 'AudioNumber.dart';
import 'package:audioplayers/audio_cache.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioCache audioPlayer = AudioCache();

  List<AudioNumber> numberList = [
    AudioNumber("one.wav", Colors.red, "One"),
    AudioNumber("two.wav", Colors.green, "Two"),
    AudioNumber("three.wav", Colors.pink, "Three"),
    AudioNumber("four.wav", Colors.blue, "Four"),
    AudioNumber("five.wav", Colors.yellow, "Five"),
    AudioNumber("six.wav", Colors.cyan, "Six"),
    AudioNumber("seven.wav", Colors.grey, "Seven"),
    AudioNumber("eight.wav", Colors.orange, "Eight"),
    AudioNumber("nine.wav", Colors.deepOrange, "Nine"),
    AudioNumber("ten.wav", Colors.deepPurple, "Ten"),
  ];

  playAudio(url) {
    audioPlayer.play(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spanish Audio Number"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage("images/logo.png"),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(15.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemCount: numberList.length,
                  itemBuilder: (context, i) => SizedBox(
                    height: 50.0,
                    width: 100.0,
                    child: RaisedButton(
                        color: numberList[i].buttonColor,
                        child: Text(
                          numberList[i].buttonText,
                          style: TextStyle(fontSize: 25.0, color: Colors.black),
                        ),
                        onPressed: () {
                          playAudio(numberList[i].audioUri);
                        }),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 60.0),
                child: Text(
                  "Made by Swapnil",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
