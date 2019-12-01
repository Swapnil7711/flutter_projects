import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer App"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Swapnil"),
              accountEmail: Text("Swapnil@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("SH"),
              ),
            ),
            ListTile(
              title: Text("Item 1"),
              trailing: Icon(Icons.add_a_photo),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/category');
              },
            ),
            ListTile(
              title: Text("Item 2"),
              trailing: Icon(Icons.phone),
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
