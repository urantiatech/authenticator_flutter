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
        title: Text('Registered Users'),
        backgroundColor: Colors.teal[400],
      ),
      backgroundColor: Colors.teal[100],
      body: SafeArea(
        child: Column(
          children: [
            Card(
              child: InkWell(
                splashColor: Colors.teal[200],
                onTap: () {
                  print('Card tapped.');
                },
                child: ListTile(
                  title: Text('Demo user'),
                ),
              ),
            ),
            Card(
              child: InkWell(
                splashColor: Colors.teal[200],
                onTap: () {
                  print('Card tapped.');
                },
                child: ListTile(
                  title: Text('Demo user'),
                ),
              ),
            ),
            Card(
              child: InkWell(
                splashColor: Colors.teal[200],
                onTap: () {
                  print('Card tapped.');
                },
                child: ListTile(
                  title: Text('Demo user'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
