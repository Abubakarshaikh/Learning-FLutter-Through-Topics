import 'package:flutter/material.dart';
import 'example3/home_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          activeIndicatorBorder: BorderSide(
            color: Colors.green,
          ),
          focusColor: Colors.green,
        ),
      ),
      home: Example3(),
    );
  }
}
