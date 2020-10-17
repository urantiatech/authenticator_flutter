import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black54,
                    letterSpacing: 3,
                    fontFamily: 'Ethnocentric',
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: double.infinity,
                ),
                Container(
                  width: 350,
                  child: TextField(
                    controller: controllerName,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  child: TextField(
                    controller: controllerEmail,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Email ID',
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  child: TextField(
                    obscureText: true,
                    controller: controllerPassword,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  child: TextField(
                    obscureText: true,
                    controller: controllerConfirmPassword,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Confirm Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 350,
                  height: 60,
                  child: RaisedButton(
                    textColor: Colors.black54,
                    color: Colors.teal[300],
                    onPressed: () {
                      var email = controllerEmail.text;
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email);
                      if (!emailValid) {
                        print('Email Invalid');
                      } else {
                        // print(controllerName.text);
                        // print(controllerEmail.text);
                        // print(controllerPassword.text);
                        // print(controllerConfirmPassword.text);
                        createUser(
                            name: controllerName.text,
                            email: controllerEmail.text,
                            password: controllerPassword.text);
                      }
                    },
                    padding: EdgeInsets.all(10),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: Text(
                          'Already have an account? Login',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> createUser(
    {@required String name,
    @required String email,
    @required String password}) async {
  var url = "http://10.0.2.2:8888/create";
  // var url = "http://192.168.1.106:8888/create";
  Map data = {'name': name, 'email': email, 'password': password};

  String body = jsonEncode(data);
  var response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: body);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
