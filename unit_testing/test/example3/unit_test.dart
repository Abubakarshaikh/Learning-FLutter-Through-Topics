import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/example3/message_api.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test("Messages Api test", () async {
    final MessageApi messageApi = MessageApi();

    final allMessages = await messageApi.readAll();

    expect(allMessages.isNotEmpty, true);
  });
}
