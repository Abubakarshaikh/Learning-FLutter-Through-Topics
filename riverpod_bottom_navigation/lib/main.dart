import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_bottom_navigation/provider/provider.dart';
import 'package:riverpod_bottom_navigation/screens/home_screen.dart';
import 'package:riverpod_bottom_navigation/screens/map_screen.dart';
import 'package:riverpod_bottom_navigation/screens/profile_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xff62abf5)),
      ),
      title: 'app',
      home: const ScreenContainer(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScreenContainer extends ConsumerWidget {
  const ScreenContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabType = ref.watch(tabTypeProvider);
    List<Widget> screens = const [
      HomeScreen(),
      MapScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: PageView.builder(
        controller: PageController(initialPage: tabType.index),
        itemCount: screens.length,
        itemBuilder: (context, index) {
          return screens[tabType.index];
        },
        onPageChanged: (int selectIndex) {
          ref
              .read(tabTypeProvider.notifier)
              .update((state) => TabType.values[selectIndex]);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabType.index,
        onTap: (int selectIndex) {
          ref
              .read(tabTypeProvider.notifier)
              .update((state) => TabType.values[selectIndex]);
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Page 3',
          ),
        ],
      ),
    );
  }
}
