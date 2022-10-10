import 'package:flutter/material.dart';

//: Lifting state up
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Game")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Player:  (1)
          Player1(),
          // Player:  (2)
          Player2(),
        ],
      ),
    );
  }
}

class Player1 extends StatelessWidget {
  const Player1({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Player2 Scores"),
            const Text("0"),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}

class Player2 extends StatelessWidget {
  const Player2({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Player1 Scores"),
            const Text("0"),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}


//: callback
// void main() {}
