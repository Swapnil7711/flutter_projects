import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = "https://api.github.com/users";

  List data;

  bool isLoading;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(Uri.encodeFull(url));
    // print(response.body);

    setState(() {
      var convertToJson = json.decode(response.body);

      data = convertToJson;

      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Api App"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(data[index]['login'],
                      style: TextStyle(fontSize: 20)),
                  subtitle:
                      Text(data[index]['url'], style: TextStyle(fontSize: 15)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
