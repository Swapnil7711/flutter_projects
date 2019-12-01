import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;

  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future openGallary() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future<void> _optionDialogBox() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.cyan,
          shape: RoundedRectangleBorder(),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                    child: Text(
                      "Take a Picture",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    onTap: () {
                      openCamera();
                      Navigator.of(context).pop();
                    }),
                GestureDetector(
                    child: Text(
                      "Open Gallary",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    onTap: () {
                      openGallary();
                      Navigator.of(context).pop();
                    })
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera App"),
      ),
      body: Container(
        child: Center(
          child:
              _image == null ? Text('No image selected') : Image.file(_image),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _optionDialogBox,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
