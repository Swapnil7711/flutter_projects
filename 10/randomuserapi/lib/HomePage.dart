import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'global.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://randomuser.me/api/?results=50";

  List userData;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    getusersdata();
  }

  Future getusersdata() async {
    var response = await http.get(Uri.encodeFull(url));

    var data = json.decode(response.body)['results'];

    print(data);

    setState(() {
      userData = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Users"),
      ),
      body: Container(
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: userData == null ? 0 : userData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Image(
                              width: 70.0,
                              height: 70.0,
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  userData[index]['picture']['thumbnail']),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(userData[index]['name']['first'],
                                    style: TextStyle(fontSize: 20.0)),
                                Text(
                                  userData[index]['email'],
                                  style: secondaryText,
                                ),
                                Text(
                                  userData[index]['location']['country'],
                                  style: secondaryText,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
