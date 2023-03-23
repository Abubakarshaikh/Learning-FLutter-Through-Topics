import 'package:http/http.dart' as http;

void main() async {
  await UrwayApi.urwayPayment();
}

class UrwayApi {
  static Future<void> urwayPayment() async {
    final uri = Uri.parse(
        "https://payments.urway-tech.com/URWAYPGService/transaction/jsonProcess/JSONrequest");
    print("true");
    final reponse = await http.post(uri);

    print(reponse.body);
  }
}
