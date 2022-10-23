import 'package:flutter/material.dart';
import 'package:listview/AddDetailsScreen.dart';
import 'package:listview/ViewDetailsScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}
