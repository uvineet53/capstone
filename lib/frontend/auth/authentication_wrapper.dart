import 'package:capstone/frontend/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../backend/models/user.dart';
import 'sign_in.dart';

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final KUser user = Provider.of<KUser>(context);
    if (user != null) {
      return HomeScreen();
      // ignore: invariant_booleans
    } else if (user == null) {
      return SignInForm();
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
