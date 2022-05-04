import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'confirmEmail.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgotPassword extends StatefulWidget {
  final String message =
      "An email has just been sent to you, Click the link provided to complete password reset";

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  String? _email;

  Future<void> _passwordReset() async {
    try {
      _formKey.currentState!.save();
      final user = await _auth.sendPasswordResetEmail(email: _email);

      Get.off(() => ConfirmEmail(
            key: Key('Confirm Email'),
            message: widget.message,
          ));
    } catch (e) {
      Get.showSnackbar(GetBar(
        title: "Error",
        message: "Couldn't find an account associated with this email.",
        duration: const Duration(milliseconds: 1700),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "Enter Your Email".text.xl3.make(),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (!value!.isEmail) {
                    return "Enter a valid email";
                  }
                  return null;
                },
                onSaved: (newEmail) {
                  _email = newEmail;
                },
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.mail,
                    color: Colors.grey,
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
                  hintStyle: TextStyle(color: Colors.grey),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _passwordReset();
                    print(_email);
                  }
                },
                child: "Send Reset Link".text.white.lg.bold.make(),
              ).box.red500.rounded.p12.make(),
            ],
          ),
        ),
      ),
    );
  }
}
