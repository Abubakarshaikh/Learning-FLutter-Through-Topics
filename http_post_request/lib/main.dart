import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await addPost();
            },
            icon: Icon(Icons.add),
          )
        ],
        title: const Text("Http Post Request"),
      ),
      body: FutureBuilder<List<Post>>(
        future: fetchAllPost(),
        builder: (_, snapshots) {
          if (snapshots.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshots.data?.length ?? 0,
              itemBuilder: (_, index) {
                final todo = snapshots.data?.elementAt(index);
                return ListTile(
                  title: Text(todo?.title ?? 'No Data'),
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
    ),
  ));
}

final Uri url = Uri.https("jsonplaceholder.typicode.com", "/posts");
Future<List<Post>> fetchAllPost() async {
  final response = await http.get(url);
  if (response.statusCode != 200) {
    throw Exception('Post Request Failure');
  }
  final fromJson = json.decode(response.body) as List;
  final List<Post> todos = fromJson.map((e) => Post.fromMap(e)).toList();
  return todos;
}

Future<void> addPost() async {
  final response = await http.post(
    url,
    body: json.encode(
      {
        'userId': 20001,
        'title': 'abubakar',
        'body': 'abubakar creating new resource',
      },
    ),
    headers: {
      'Content-type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode != 201) {
    throw Exception('Resource are not Created');
  }
  log('Resourse Are Created  💪');
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userId: map["userId"],
      id: map["id"],
      title: map["title"],
      body: map["body"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  String toJson() => json.encode(toMap());
}
