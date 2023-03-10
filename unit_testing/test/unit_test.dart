// import 'package:flutter_test/flutter_test.dart';
// import 'package:unit_testing/example3/todo.dart';
// import 'package:unit_testing/example3/todo_repository.dart';

// void main() {
//   // for adding todo.
//   test("Adding todo", () {
//     // setup
//     final TodoRepository todoRepository = TodoRepository();
//     Todo todo = Todo(title: "Go to gym");
//     // Do
//     todoRepository.add(todo);
//     // Test
//     expect(todoRepository.todos().length, 1);
//   });

//   // for updating todo.
//   test("updating todo", () {
//     // setup
//     final TodoRepository todoRepository = TodoRepository();
//     Todo todo = Todo(title: "Go to Market.");
//     // Do
//     todoRepository.add(todo);
//     todoRepository.update(todo.copyWith(isChecked: true));
//     // Test
//     expect(todoRepository.todos()[0].isChecked, true);
//   });

//   test("delete todo", () {
//     // setup
//     final TodoRepository todoRepository = TodoRepository();
//     Todo todo = Todo(title: "Buy some grocery.");
//     // Do
//     todoRepository.add(todo);
//     todoRepository.delete(todo);
//     // Test
//     expect(todoRepository.todos().contains(todo), false);
//   });
// }
