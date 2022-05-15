import 'package:capstoneproject/auth.dart';
import 'package:capstoneproject/fire_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

Future<void> main() async {
  await Auth.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FireAuth(
        key: Key('auth'),
        authPage: Login(),
        home: Home(),
      ),
    );
  }
}
