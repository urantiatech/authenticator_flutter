import 'package:authenticator_flutter/userDetails.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                      backgroundColor: Colors.blue,
                      child: Text('D'),
                    ),
                    title: Text('Demo user'),
                    subtitle: Text('email@email.com'),
                  ),
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
                      backgroundColor: Colors.blue,
                      child: Text('D'),
                    ),
                    title: Text('Demo user'),
                    subtitle: Text('email@email.com'),
                  ),
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
                      backgroundColor: Colors.blue,
                      child: Text('D'),
                    ),
                    title: Text('Demo user'),
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
