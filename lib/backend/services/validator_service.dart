import 'package:get/get.dart';

mixin Validators {
  String? emailValidator(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String value) {
    if (value.length < 6) {
      return 'Password length is too short';
    }
    return null;
  }

  String? nameValidator(String value) {
    if (value.isEmpty) {
      return "Name cannot be empty";
    }
    return null;
  }

  String? phoneValidator(String value) {
    const String pattern = r'(^(?:[+0]91)?0?[0-9]{10}$)';
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return "Invalid phone number";
    }
    return null;
  }
}
