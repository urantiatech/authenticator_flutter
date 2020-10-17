import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserDetails extends StatefulWidget {
  final String userEmail;
  UserDetails(this.userEmail);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  var userDetails;
  Future<void> getUserDetails() async {
    var url = "http://10.0.2.2:8888/read";
    Map data = {'email': widget.userEmail};
    String body = jsonEncode(data);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    userDetails = json.decode(response.body);
    print(userDetails);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Colors.teal[400],
      ),
      backgroundColor: Colors.teal[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue[900],
                  child: Text(
                    'Display Picture',
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Ethnocentric',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Name: ',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'DEMO',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Email: ',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      widget.userEmail,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Username: ',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'demousername',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
