import 'package:flutter/material.dart';
import 'injection.dart' as di;

import '2_application/pages/task/task_screen_imports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskScreenWrapperProvider();
  }
}
