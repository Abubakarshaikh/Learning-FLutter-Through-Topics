// import 'dart:io';
// import 'dart:async';
// import 'package:http/http.dart' as http;

// void main() async {
//   await Api.readById();
// }

// class Api {
//   static Future<void> readById() async {
//     final rs = await http.post(
//         Uri.parse("https://gestio.primeraplanta.cat/api/login/login_api"),
//         headers: <String, String>{
//           "content-type":
//               "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
//           "authtoken":
//               "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoidGVzdCIsIm5hbWUiOiJ0ZXN0IiwiQVBJX1RJTUUiOjE2Nzk1ODQ0MzZ9.EukzFwHLWjm2ye3O5HAGAkZvT56DkmFZuUbNeuCW98U"
//         },
//         body: {
//           "email": "support@xeon-consulting.com",
//           "password": "__xeon__"
//         });
//     print(rs.body);

//     final reponse = await http.get(
//       Uri.parse(
//           "http://gestio.primeraplanta.cat/api/common/get_task_by_userid"),
//       headers: <String, String>{
//         "authtoken":
//             "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoidGVzdCIsIm5hbWUiOiJ0ZXN0IiwiQVBJX1RJTUUiOjE2Nzk1ODQ0MzZ9.EukzFwHLWjm2ye3O5HAGAkZvT56DkmFZuUbNeuCW98U"
//       },
//     );
//     print(reponse.body);

//     print(reponse.statusCode);
//   }
// }
