import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String message;
  final int id;
  const Message({required this.message, required this.id});

  factory Message.fromjson(Map<String, dynamic> map) {
    return Message(
      message: map["message"] as String,
      id: map["id"] as int,
    );
  }

  copyWith({
    String? message,
    int? id,
  }) {
    return Message(
      message: message ?? this.message,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [message, id];
}
