import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'register.dart';

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
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blue[900],
            child: Text(
              'AUTH',
              style: TextStyle(
                fontSize: 43,
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
              color: Colors.black,
              letterSpacing: 3,
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
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
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
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
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
                print(controllerEmail.text);
                print(controllerPassword.text);
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
          Container(
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  child: Text('Forgot password?'),
                  onPressed: () {
                    print('I don\'t do anything yet');
                  },
                ),
                FlatButton(
                  child: Text('Register'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
