import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../backend/services/validator_service.dart';
import '../auth_widgets/authForms.dart';
import '../auth_widgets/logoBuilder.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> with Validators {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  bool isSignUp = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 15,
              ),
              child: Column(
                children: [
                  mainTitle,
                  const SizedBox(
                    height: 20,
                  ),
                  if (isSignUp)
                    signUpForm(
                        confirmPassValidator,
                        _formkey,
                        emailController,
                        confirmPasswordController,
                        passwordController,
                        emailValidator,
                        passwordValidator)
                  else
                    signInForm(_formkey, emailController, passwordController,
                        emailValidator, passwordValidator),
                  registerUnderline(),
                ],
              )),
        ),
      ),
    );
  }

  String? confirmPassValidator(String value) {
    if (value != passwordController.text) {
      return "Passwords don't match";
    }
    return null;
  }

  Widget registerUnderline() {
    return HStack([
      if (!isSignUp)
        "No Account? ".text.lg.color(Colors.grey).make()
      else
        "Have an Account? ".text.lg.color(Colors.grey).make(),
      GestureDetector(
        onTap: () {
          setState(() {
            isSignUp = !isSignUp;
            emailController.clear();
            passwordController.clear();
            confirmPasswordController.clear();
          });
        },
        child: isSignUp
            ? "Login Here     ".text.color(Colors.grey).bold.lg.make()
            : "Register Here     ".text.color(Colors.grey).bold.lg.make(),
      )
    ]).centered();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
