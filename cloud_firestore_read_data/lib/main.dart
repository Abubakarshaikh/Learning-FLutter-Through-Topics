import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Active",
              ),
              Tab(
                text: "Completed",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ActiveTabBarView(),
            CompletedTabBarView(),
          ],
        ),
      ),
    );
  }
}

class ActiveTabBarView extends StatelessWidget {
  const ActiveTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection("todos").limit(2).snapshots(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading ..");
        }

        if (snapshot.connectionState == ConnectionState.active) {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 6),
            itemBuilder: (context, index) {
              final todo = snapshot.data!.docs.elementAt(index);
              return ListTile(
                subtitle: Text(DateFormat.jm()
                    .format((todo['deadline'] as Timestamp).toDate())),
                leading: Checkbox(
                  value: todo['isChecked'],
                  onChanged: (value) {
                    todo.reference.update({'isChecked': value});
                  },
                ),
                title: Text(todo["name"],
                    style: TextStyle(
                      decoration:
                          todo['isChecked'] ? TextDecoration.lineThrough : null,
                    )),
              );
            },
            itemCount: snapshot.data!.docs.length,
          );
        }

        return const Text("Something went wrong");
      }),
    );
  }
}

class CompletedTabBarView extends StatelessWidget {
  const CompletedTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("todos")
          .where('isChecked', isEqualTo: true)
          .limit(1)
          .snapshots(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading ..");
        }

        if (snapshot.connectionState == ConnectionState.active) {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 6),
            itemBuilder: (context, index) {
              final todo = snapshot.data!.docs.elementAt(index);
              return Column(
                children: [
                  ListTile(
                    leading: Checkbox(
                      value: todo['isChecked'],
                      onChanged: (value) {
                        todo.reference.update({'isChecked': value});
                      },
                    ),
                    title: Text(todo["name"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 56),
                    child: ListTile(
                      leading: Checkbox(
                        value: todo['isChecked'],
                        onChanged: (value) {
                          todo.reference.update({'isChecked': value});
                        },
                      ),
                      title: Text(todo["name"]),
                    ),
                  ),
                ],
              );
            },
            itemCount: snapshot.data!.docs.length,
          );
        }

        return const Text("Something went wrong");
      }),
    );
  }
}
