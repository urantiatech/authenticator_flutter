import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of registered users'),
      ),
      backgroundColor: Colors.teal[100],
      body: SafeArea(
        child: Column(
          children: [
            Text('user1'),
            Text('user2'),
          ],
        ),
      ),
    );
  }
}
