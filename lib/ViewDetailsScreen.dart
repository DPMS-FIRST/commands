import 'package:flutter/material.dart';
import 'package:listview/AddDetailsScreen.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({super.key, required this.user});
final UserDetails user;
//final Function(String value, String value1) callBackValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Center(
    child: Column(
      children: <Widget>[
        const Text('Header'),
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Email: ${user.email}'),
              ),
              ListTile(
                title: Text('Password: ${user.password}'),
              ),
            ],
          ),
        ),
      ],
    ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Details()),
            );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
