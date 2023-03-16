import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HoomeScreen(),
    );
  }
}

class HoomeScreen extends StatelessWidget {
  const HoomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.builder(
        itemCount: 6,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset("images/image${index + 1}.jpg"),
          ),
        ),
      ),
    );
  }
}
