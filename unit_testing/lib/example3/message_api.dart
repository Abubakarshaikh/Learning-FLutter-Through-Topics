import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:unit_testing/example3/message.dart';

class MessageApi {
  Future<List<Message>> readAll() async {
    final response = await _fromString("assets/messages.json");
    final List<dynamic> fromJson = json.decode(response) as List<dynamic>;
    return fromJson.map((item) => Message.fromjson(item)).toList();
  }

  Future<String> _fromString(String path) async {
    final fromJson = await rootBundle.loadString(path);
    return fromJson;
  }
}
