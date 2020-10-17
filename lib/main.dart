import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'register.dart';
import 'userList.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[100],
        body: LoginPage(),
      ),
    ),
  );
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordWrong = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue[900],
                  child: Text(
                    'AUTH',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Ethnocentric',
                    ),
                  ),
                  // backgroundColor: Colors.white60,
                  // child: CircleAvatar(
                  //   radius: 78,
                  //   backgroundImage: AssetImage(
                  //     'images/appIcon.png',
                  //   ),
                  // ),
                ),
                SizedBox(
                  height: 20,
                  width: double.infinity,
                ),
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
                SizedBox(
                  width: 350,
                  height: 60,
                  child: RaisedButton(
                    textColor: Colors.black54,
                    color: Colors.teal[300],
                    onPressed: () {
                      // print(controllerEmail.text);
                      // print(controllerPassword.text);
                      setState(() {
                        isPasswordWrong = false;
                      });
                      var email = controllerEmail.text;
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email);
                      if (controllerEmail.text == 'admin@admin.com' &&
                          controllerPassword.text == 'admin' &&
                          emailValid) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserListPage(),
                          ),
                        );
                      } else if (controllerPassword.text != 'admin') {
                        setState(() {
                          isPasswordWrong = true;
                        });
                      } else if (!emailValid) {
                        print('Invalid Email');
                      } else {
                        print('Invalid credentials');
                      }
                    },
                    padding: EdgeInsets.all(10),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: isPasswordWrong,
                  child: Container(
                    child: Text(
                      'Incorrect password',
                      style: TextStyle(
                        color: Colors.red[400],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        onPressed: () {
                          print('I don\'t do anything yet');
                        },
                      ),
                      FlatButton(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
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
