import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restapi_getx/movie.dart';

import 'constant.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: FutureBuilder<List<Movie>>(
        future: movies(apiUrl),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            log("${snapshot.data![1].title}");
            return Text("True");
          }
        },
      ),
    );
  }
}
