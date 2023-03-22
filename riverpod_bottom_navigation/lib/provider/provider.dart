import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TabType { pag1, pag2, pag3 }

final tabTypeProvider = StateProvider<TabType>((ref) => TabType.pag1);
