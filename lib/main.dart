import 'package:flutter/material.dart';
import 'package:stockapp/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Touch',
      theme: ThemeData(
        canvasColor: Colors.teal,
        primarySwatch: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}
