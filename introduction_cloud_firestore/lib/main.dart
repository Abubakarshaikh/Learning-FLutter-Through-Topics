import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Json")),
      body: FutureBuilder(
        future: loadJson(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products.elementAt(index);
                return ListTile(
                  title: Text(product['name']),
                );
              },
            );
          }
          return const Text("Loading ..");
        },
      ),
    );
  }

  Future<List> loadJson() async {
    final fromString = await rootBundle.loadString("assets/products.json");
    return json.decode(fromString) as List;
  }
}
