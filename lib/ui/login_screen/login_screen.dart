import 'package:flutter/material.dart';

import '../../logics/hubs/appwrite_hub.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpirApp'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _login,
          child: const Text('Log in via Google'),
        ),
      ),
    );
  }

  Future<void> _login() async {
    AppwriteHub().login();
  }
}
