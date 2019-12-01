import 'package:flutter/material.dart';

class AudioNumber {
  String audioUri;
  Color buttonColor;
  String buttonText;

  AudioNumber(String audioUri, Color buttonColor, String buttonText) {
    this.audioUri = audioUri;
    this.buttonColor = buttonColor;
    this.buttonText = buttonText;
  }
}
