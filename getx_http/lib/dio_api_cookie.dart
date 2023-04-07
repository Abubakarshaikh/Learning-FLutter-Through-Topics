import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

const loginUrl = '/login/login_api';
const getTasksUrl = '/common/get_task_by_userid';
const token =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoidGVzdCIsIm5hbWUiOiJ0ZXN0IiwiQVBJX1RJTUUiOjE2Nzk1ODQ0MzZ9.EukzFwHLWjm2ye3O5HAGAkZvT56DkmFZuUbNeuCW98U";

class ApiProvider {
  late final Dio dio;
  late final CookieJar cookieJar;
  ApiProvider() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://gestio.primeraplanta.cat/api",
        headers: {
          'authtoken': token,
        },
      ),
    );
    cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    
  }

  Future<Map<String, dynamic>> loginUser(
      {required String email, required String password}) async {
    final formData = FormData.fromMap({
      "email": email,
      "password": password,
    });
    try {
      final response = await dio.post(
        loginUrl,
        data: formData,
      );
      return json.decode(response.toString());
    } on DioError catch (e) {
      throw (e.response?.data['error'] ?? 'An error occurred');
    }
  }

  Future<Map<String, dynamic>> getUserData() async {
    try {
      final response = await dio.get(getTasksUrl);
      return json.decode(response.toString());
    } on DioError catch (e) {
      throw (e.response?.data['error'] ?? 'An error occurred');
    }
  }
}