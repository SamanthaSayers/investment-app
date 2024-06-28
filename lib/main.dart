import 'package:flutter/material.dart';
import 'package:mock_ronas_it/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Investment App',
      home: HomeScreen(),
    );
  }
}
