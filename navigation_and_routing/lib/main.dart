import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';
// --------------------------------- 1. Using Navigator --------------------

// --------------------------------- 2. Using named routes --------------------
// If I'm Home Screen {Home Route}
// If I'm Detail Screen {Detail Route}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: "/",
//       routes: {
//         "/": (_) => const HomeScreen(),
//       },
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           Card(child: Icon(Icons.abc)),
//           Card(child: Icon(Icons.abc)),
//         ],
//       ),
//     );
//   }
// }

// --------------------------------- 3. Using go_router --------------------

void main() {
  setPathUrlStrategy();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  static const String title = 'GoRouter Routes';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }

  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          GoRoute(
            path: 'page2',
            builder: (BuildContext context, GoRouterState state) =>
                const Page2Screen(),
          ),
          GoRoute(
            path: 'page3',
            builder: (BuildContext context, GoRouterState state) =>
                const Page3Screen(),
          ),
          GoRoute(
            path: 'page4',
            builder: (BuildContext context, GoRouterState state) =>
                const Page4Screen(),
          ),
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const Page1Screen(),
      ),
    ],
  );
}

class ErrorScreen extends StatelessWidget {
  final Exception? error;
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error")),
      body: Center(
        child: Text(error.toString()),
      ),
    );
  }
}

class Page1Screen extends StatelessWidget {
  const Page1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(App.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/page2'),
              child: const Text("Go to Page 2"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.go('/page3'),
              child: const Text("Go to Page 3"),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2Screen extends StatelessWidget {
  const Page2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(App.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text("Go to Page 1"),
            ),
          ],
        ),
      ),
    );
  }
}

class Page3Screen extends StatelessWidget {
  const Page3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(App.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/page4'),
              child: const Text("Go to Page 4"),
            ),
          ],
        ),
      ),
    );
  }
}

class Page4Screen extends StatelessWidget {
  const Page4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(router.location.toString())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text("Go to Page 4"),
            ),
          ],
        ),
      ),
    );
  }
}
