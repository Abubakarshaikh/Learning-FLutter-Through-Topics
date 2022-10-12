import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//  <!----------------- EXAMPLE - 1: Primitive Data -------------------------->
// void main() {
//   runApp(const MaterialApp(
//     home: MainPageState(),
//   ));
// }

// class MainPageState extends StatefulWidget {
//   const MainPageState({super.key});

//   @override
//   State<MainPageState> createState() => _MainPageStateState();
// }

// class _MainPageStateState extends State<MainPageState> {
//   String name = '';
//   late SharedPreferences preferences;
//   @override
//   void initState() {
//     super.initState();
//     init();
//   }

//   Future init() async {
//     preferences = await SharedPreferences.getInstance();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(title: const Text("SharedPreferences")),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(name),
//               const SizedBox(height: 32),
//               ElevatedButton(
//                 onPressed: () async {
//                   preferences.setString("name", "Paul");
//                 },
//                 child: const Text("Store"),
//               ),
//               const SizedBox(height: 32),
//               ElevatedButton(
//                 onPressed: () async {
//                   String? name = preferences.getString('name');
//                   if (name == null) return;
//                   setState(() => this.name = name);
//                 },
//                 child: const Text("Load"),
//               ),
//             ],
//           ),
//         ),
//       );
// }

// <!------------------ EXAMPLE - 2: OBJECT -------------------------->

void main() {
  runApp(const MaterialApp(
    home: MainPageState(),
  ));
}

class MainPageState extends StatefulWidget {
  const MainPageState({super.key});

  @override
  State<MainPageState> createState() => _MainPageStateState();
}

class _MainPageStateState extends State<MainPageState> {
  User? user;
  late SharedPreferences preferences;
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();

    final userJson = preferences.getString('user');
    if (userJson == null) return;

    final user = User.fromJson(json.decode(userJson));
    setState(() => this.user = user);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("SharedPreferences")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              user != null
                  ? Column(
                      children: [
                        CircleAvatar(
                            backgroundImage: NetworkImage(user!.urlImage)),
                        Text("${user!.birthday}"),
                        Text("${user!.friends} Friends"),
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        final userJson = preferences.getString('user');
                        if (userJson == null) return;

                        final user = User.fromJson(json.decode(userJson));
                        setState(() => this.user = user);
                      },
                      child: const Text("Load"),
                    ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  final user = User(
                    name: 'Julia',
                    friends: 81,
                    urlImage:
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                    birthday: DateTime(2002, 7, 9),
                  );
                  final userJson = json.encode(user.toJson());
                  preferences.setString('user', userJson);
                },
                child: const Text("Store"),
              ),
            ],
          ),
        ),
      );
}

class User {
  final String name;
  final int friends;
  final String urlImage;
  final DateTime birthday;
  User({
    required this.name,
    required this.friends,
    required this.urlImage,
    required this.birthday,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'friends': friends,
      'urlImage': urlImage,
      'birthday': birthday.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      friends: map['friends']?.toInt() ?? 0,
      urlImage: map['urlImage'] ?? '',
      birthday: DateTime.fromMillisecondsSinceEpoch(map['birthday']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, friends: $friends, urlImage: $urlImage, birthday: $birthday)';
  }
}
