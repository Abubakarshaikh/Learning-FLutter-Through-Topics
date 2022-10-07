import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      appBar: AppBar(
        title: const Text("Json to Object"),
      ),
      body: FutureBuilder<List>(
        future: fetchCommentsApi(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                // final Map<String,dynamic> comment = snapshot.data![index];
                final Comment comment = Comment.fromMap(snapshot.data![index]);
                return ListTile(
                  leading: Text(comment.postId.toString()),
                  title: Text(comment.name),
                  subtitle: Text(comment.body),
                  trailing: Text(comment.id.toString()),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List> fetchCommentsApi() async {
    final url = Uri.https('jsonplaceholder.typicode.com', '/comments');
    final response = await http.get(url);
    return json.decode(response.body) as List;
  }
}

// Json to Object
class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;
  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      postId: map['postId'],
      body: map['body'],
      email: map['email'],
      id: map['id'],
      name: map['name'],
    );
  }
}
