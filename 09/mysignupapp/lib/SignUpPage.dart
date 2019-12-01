import 'package:flutter/material.dart';
import 'package:mysignupapp/HomePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _key = GlobalKey();

  String name, email, phone, fax;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("Sign Up Page"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Image(
                  image: AssetImage('images/logo.png'),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please Enter a Valid Name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    onSaved: (input) => name = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please Enter a Valid email';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'email',
                    ),
                    onSaved: (input) => email = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please Enter a Valid phone';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'phone',
                    ),
                    onSaved: (input) => phone = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.ring_volume),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please Enter a Valid fax';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'fax',
                    ),
                    onSaved: (input) => fax = input,
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 30)),
                ButtonTheme(
                  height: 40,
                  minWidth: 100,
                  child: RaisedButton(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: _sendToNextScreen,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sendToNextScreen() {
    if (_key.currentState.validate()) {
      _key.currentState.save();

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(
                name: name,
                phone: phone,
                email: email,
                fax: fax,
              )));
    }
  }
}
