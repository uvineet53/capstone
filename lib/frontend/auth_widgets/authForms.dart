import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../backend/services/authentication_service.dart';
import '../auth/forgotPassword.dart';
import 'authButtons.dart';
import 'customFormField.dart';
import 'package:velocity_x/velocity_x.dart';

Form signUpForm(
    String? Function(String) confirmPassValidator,
    GlobalKey<FormState> _formkey,
    TextEditingController emailController,
    TextEditingController confirmPasswordController,
    TextEditingController passwordController,
    String? Function(String) emailValidator,
    String? Function(String) passwordValidator) {
  return Form(
    key: _formkey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customFormField(
            hint: "Email (you@example.com)",
            controller: emailController,
            validator: emailValidator as String Function(String)),
        const SizedBox(
          height: 10,
        ),
        customFormField(
            isPassword: true,
            hint: "Password (Min. 6 characters)",
            controller: passwordController,
            validator: passwordValidator as String Function(String)),
        const SizedBox(
          height: 10,
        ),
        customFormField(
            isPassword: true,
            hint: "Confirm Password",
            controller: confirmPasswordController,
            validator: confirmPassValidator as String Function(String)),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            if (_formkey.currentState!.validate()) {
              Auth().signUp(
                email: emailController.text,
                password: passwordController.text,
              );
            }
          },
          child: signButton(title: "Sign Up"),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    ),
  );
}

Form signInForm(
  GlobalKey<FormState> _formkey,
  TextEditingController emailController,
  TextEditingController passwordController,
  String? Function(String) emailValidator,
  String? Function(String) passwordValidator,
) {
  return Form(
    key: _formkey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customFormField(
          hint: "Email (you@example.com)",
          controller: emailController,
          validator: emailValidator as String Function(String),
        ),
        const SizedBox(
          height: 10,
        ),
        customFormField(
            isPassword: true,
            hint: "Password (Min. 6 characters)",
            controller: passwordController,
            validator: passwordValidator as String Function(String)),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            if (_formkey.currentState!.validate()) {
              Auth().signIn(
                email: emailController.text,
                password: passwordController.text,
              );
            }
          },
          child: signButton(title: "Sign In"),
        ),
        TextButton(
            onPressed: () {
              Get.to(() => ForgotPassword());
            },
            child: "Forgot Password".text.red500.xl.makeCentered()),
      ],
    ),
  );
}
