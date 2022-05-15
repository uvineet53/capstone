import 'package:capstoneproject/auth.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  String email = '', password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(18),
        children: [
          TextField(
            decoration: const InputDecoration(
              label: Text("Email"),
            ),
            onChanged: (value) => email = value,
          ),
          TextField(
            decoration: const InputDecoration(
              label: Text("Password"),
            ),
            onChanged: (value) => password = value,
          ),
          ElevatedButton(
            onPressed: (() => Auth().login(email, password, context)),
            child: const Text("Login"),
          ),
          ElevatedButton(
            onPressed: (() async {
              await Auth().register(email, password, context);
            }),
            child: const Text("Register"),
          ),
        ],
      ),
    );
  }
}
