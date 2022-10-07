import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(MaterialApp(
    home: Scaffold(
      body: FutureBuilder<List>(
        future: fetchAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]['title']),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    ),
  ));
}

Future<List> fetchAll() async {
  final url = Uri.https('jsonplaceholder.typicode.com', '/todos');

  final response = await http.get(url);
  final List fromJson = json.decode(response.body) as List;
  return fromJson;
}
