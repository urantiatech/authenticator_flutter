import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Register"),
      // ),
      backgroundColor: Colors.teal[100],
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome!',
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
              letterSpacing: 3,
            ),
          ),
        ],
      )),
    );
  }
}
