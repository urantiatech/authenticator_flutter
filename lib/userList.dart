import 'dart:convert';

import 'package:authenticator_flutter/userDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List users = new List();

  Future<void> getUserList() async {
    var url = "http://10.0.2.2:8888/list";
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    Map<String, dynamic> map = json.decode(response.body);
    // print(map);
    users = map["users"];
    print(users);
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getUserList();
  // }

  @override
  Widget build(BuildContext context) {
    getUserList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Registered Users'),
        backgroundColor: Colors.teal[400],
      ),
      backgroundColor: Colors.teal[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: 140,
                child: ListView.builder(
                  itemCount: users.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.teal,
                          child: Text(
                              users[index]["name"][0].toString().toUpperCase()),
                        ),
                        title: Text(users[index]["name"]),
                        subtitle: Text(users[index]["email"]),
                      ),
                    );
                  },
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.teal[200],
                  onTap: () {
                    print('Card tapped.');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetails(),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.teal,
                      child: Text('D'),
                    ),
                    title: Text('HARDCODED USER'),
                    subtitle: Text('email@email.com'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
