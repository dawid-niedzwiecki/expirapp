import 'package:flutter/material.dart';

import 'logics/hubs/appwrite_hub.dart';
import 'logics/hubs/hdd_hub.dart';
import 'ui/login_screen/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HddHub().initHub();
  AppwriteHub().initHub();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpirApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
