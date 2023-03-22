import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabType = ref.watch(tabTypeProvider);
    return Scaffold(
      appBar: AppBar(
        //  change the title to be "Demo App" + the name of the current page
        //  retrieved from the global state variable
        title: Text('Demo App ${tabType.name}'),
      ),
      body: Center(
          child: Container(
              child: Text(
        '${tabType.name}',
        style: TextStyle(fontSize: 50, color: Colors.orange),
      ))),
    );
  }
}
