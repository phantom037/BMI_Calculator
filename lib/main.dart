import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E23),
        scaffoldBackgroundColor: Color(0xFF0A0E23),
        textTheme: TextTheme(body1: TextStyle(color: Colors.white)),
      ),
      home: InputPage(),
    ); //MaterialApp
  }
}
