import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:unit_testing/example3/todo.dart';

class TodoApi {
  Future<List<Todo>> readAll() async {
    final response = await _fromString("assets/todos.json");
    final List<dynamic> fromJson = json.decode(response) as List<dynamic>;
    return fromJson.map((item) => Todo.fromjson(item)).toList();
  }

  Future<String> _fromString(String path) async {
    final fromJson = await rootBundle.loadString(path);
    return fromJson;
  }
}
