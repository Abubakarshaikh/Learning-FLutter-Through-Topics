import 'package:flutter/material.dart';

import 'dio_api_cookie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = ApiProvider();

    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await apiProvider.loginUser(
              email: "support@xeon-consulting.com",
              password: "__xeon__",
            );
            await apiProvider.getUserData();
          },
          child: const Text("Call"),
        ),
      ),
    );
  }
}
