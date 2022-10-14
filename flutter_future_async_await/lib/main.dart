import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Future (Async, Await )"),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text("Get Data"),
            onPressed: () {
              log("1. Task");

              //Network request to get current weather
              Future.delayed(const Duration(seconds: 3), () {
                log("2. Weather: Sunny");
              });
              log("3. Task");
            },
          ),
        ),
      );
}
