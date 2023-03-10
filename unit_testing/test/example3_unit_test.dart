import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/example3/todo_api.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test("read all data", () async {
    final TodoApi todoApi = TodoApi();

    final data = await todoApi.readAll();

    expect(data.isNotEmpty, true);
  });
}
