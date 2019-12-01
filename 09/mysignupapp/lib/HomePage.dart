import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name, phone, email, fax;

  HomePage({
    Key key,
    @required this.name,
    this.phone,
    this.email,
    this.fax,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(name),
              )
            ],
          ),
        ),
      ),
    );
  }
}
