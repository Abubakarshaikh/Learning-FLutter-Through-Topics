import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int player1Score = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Counter Game")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           PlayersScoreCard(
//             player1: player1Score,
//           ),
//           PlayersCounterButtons(
//             player1Increment: () {
//               setState(() {
//                 player1Score++;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PlayersScoreCard extends StatelessWidget {
//   final int player1;
//   const PlayersScoreCard({super.key, required this.player1});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: Card(
//               margin: EdgeInsets.all(12),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Player1 Scores"),
//                   const SizedBox(height: 12),
//                   Text("$player1", textAlign: TextAlign.center),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Card(
//               margin: EdgeInsets.all(12),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Player2 Scores"),
//                   const SizedBox(height: 12),
//                   Text("0", textAlign: TextAlign.center),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PlayersCounterButtons extends StatelessWidget {
//   final Function() player1Increment;
//   const PlayersCounterButtons({super.key, required this.player1Increment});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: Card(
//               margin: const EdgeInsets.all(12),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   const Text("Player - 1"),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Card(
//                           shape: const CircleBorder(),
//                           child: IconButton(
//                               onPressed: player1Increment,
//                               icon: const Icon(Icons.add))),
//                       Card(
//                           shape: const CircleBorder(),
//                           child: IconButton(
//                               onPressed: () {},
//                               icon: const Icon(Icons.remove))),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Card(
//               margin: const EdgeInsets.all(12),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   const Text("Player - 2"),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Card(
//                           shape: const CircleBorder(),
//                           child: IconButton(
//                               onPressed: () {}, icon: const Icon(Icons.add))),
//                       Card(
//                           shape: const CircleBorder(),
//                           child: IconButton(
//                               onPressed: () {},
//                               icon: const Icon(Icons.remove))),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// : Provider

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureProvider<int?>(
      initialData: null,
      create: (_) => Future.value(42),
      child: MaterialApp(
        home: CounterApp(),
      ),
    );
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<int>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(
        child: Text("$value"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
