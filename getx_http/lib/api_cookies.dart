// import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'package:cookie_jar/cookie_jar.dart';

// Future<void> login() async {
//   // create a cookie jar to store cookies
//   final cookieJar = CookieJar();

//   // create a POST request with user credentials
//   final url = Uri.parse('https://gestio.primeraplanta.cat/api/login/login_api');
//   final response = await http.post(
//     url,
//     headers: <String, String>{
//       "authtoken":
//           "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoidGVzdCIsIm5hbWUiOiJ0ZXN0IiwiQVBJX1RJTUUiOjE2Nzk1ODQ0MzZ9.EukzFwHLWjm2ye3O5HAGAkZvT56DkmFZuUbNeuCW98U"
//     },
//     body: {
//       'username': 'support@xeon-consulting.com',
//       'password': '__xeon__',
//     },
//   );

//   List<Cookie> cookies = [
//     Cookie('name', 'hyderabad'),
//     Cookie('location', 'pakistan')
//   ];

//   // add cookies to the cookie jar
//   cookieJar.saveFromResponse(url, cookies);

//   // use the cookie jar to send authenticated requests
//   final taskUrl = Uri.parse(
//       'https://gestio.primeraplanta.cat/api/common/get_task_by_userid');
//   List<Cookie> results = await cookieJar.loadForRequest(url);
//   final cookies2 = response.headers['set-cookie'];
//   print("Login COOKIE:  $cookies2");

//   final taskResponse = await http.get(
//     taskUrl,
//     headers: {
//       "authtoken":
//           "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoidGVzdCIsIm5hbWUiOiJ0ZXN0IiwiQVBJX1RJTUUiOjE2Nzk1ODQ0MzZ9.EukzFwHLWjm2ye3O5HAGAkZvT56DkmFZuUbNeuCW98U",
//       'Cookie': results.toString(),
//     },
//   );

//   // print the response body
//   print(taskResponse.body);
// }
