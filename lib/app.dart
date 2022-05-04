import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'backend/models/user.dart';
import 'backend/services/authentication_service.dart';
import 'frontend/auth/authentication_wrapper.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<KUser?>.value(
      value: Auth().user,
      initialData: null,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              color: Colors.white,
            )),
        home: AuthenticationWrapper(),
      ),
    );
  }
}
