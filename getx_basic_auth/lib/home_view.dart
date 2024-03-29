import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/authentication_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AuthenticationManager _authManager = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                _authManager.logOut();
              },
              icon: Icon(Icons.logout_rounded))
        ],
      ),
      body: Center(
        child: Text('HOME VIEW'),
      ),
    );
  }
}
