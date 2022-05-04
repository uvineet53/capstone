import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget signButton({required String title}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(
        Icons.arrow_forward,
        color: Colors.transparent,
      ),
      title.text.black.bold.xl3.make(),
      const SizedBox(
        width: 10,
      ),
      const Icon(
        Icons.arrow_forward,
        color: Colors.black,
      ),
    ],
  );
}
