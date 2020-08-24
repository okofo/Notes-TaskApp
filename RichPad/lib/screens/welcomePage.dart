import 'package:RichPad/models/user.dart';
import 'package:RichPad/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homePage.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  final controller = TextEditingController();
  User user = User();

  @override
  Widget build(BuildContext context) {
    void _onPress() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.validate();
        final p = Provider.of<UserProvider>(context, listen: false);
        p.setUser(user);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MyHomePage(),
          ),
        );
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Center(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(40),
                shrinkWrap: true,
                children: [
                  Text("Welcome", style: TextStyle(fontSize: 22 , color: Colors.blueGrey)),
                  SizedBox(height: 20),
                  TextFormField(
                    autovalidate: _autoValidate,
                    validator: validatName,
                    maxLength: 12,
                    onChanged: (s) => user.username = s,
                    decoration: InputDecoration(
                      hintText: "Enter your username",
                    ),
                  ),
                  SizedBox(height: 30),
                  RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(17))),
                    elevation: 1,
                    color: Colors.blueGrey,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(20),
                    child: Text("Continue"),
                    onPressed: _onPress,
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String validatName(String value) {
    if (value.length < 1)
      return 'can not be empty';
    else
      return null;
  }
}
