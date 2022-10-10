import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
      appBar: AppBar(title: const Text("Counter Game")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          PlayersScoreCard(),
          PlayersCounterButtons(),
        ],
      ),
    );
  }
}

class PlayersScoreCard extends StatelessWidget {
  const PlayersScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Card(
              margin: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Player1 Scores"),
                  const SizedBox(height: 12),
                  Text("0", textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          Expanded(
            child: Card(
              margin: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Player2 Scores"),
                  const SizedBox(height: 12),
                  Text("0", textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayersCounterButtons extends StatelessWidget {
  const PlayersCounterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Card(
              margin: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Player - 1"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                          shape: const CircleBorder(),
                          child: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.add))),
                      Card(
                          shape: const CircleBorder(),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Card(
              margin: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Player - 2"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                          shape: const CircleBorder(),
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.add))),
                      Card(
                          shape: const CircleBorder(),
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.remove))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
