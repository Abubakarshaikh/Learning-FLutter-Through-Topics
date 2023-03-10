import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Todo extends Equatable {
  final String title;
  final bool isChecked;
  final String? id;
  Todo({required this.title, this.isChecked = false, String? id})
      : id = id ?? const Uuid().v4();

  factory Todo.fromjson(Map<String, dynamic> map) {
    return Todo(
      title: map["title"] as String,
      id: map["id"] as String,
      isChecked: map["isChecked"] as bool,
    );
  }

  copyWith({
    String? title,
    bool? isChecked,
    String? id,
  }) {
    return Todo(
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [title, id, isChecked];
}
