import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget logoBuilder() {
  return VStack([
    Image.asset(
      "assets/logo_bg.png",
      height: 300,
    ).box.makeCentered(),
    mainTitle,
  ]).centered();
}

Widget mainTitle = HStack([
  "She".text.xl4.wider.extraBold.black.make(),
  "raksha".text.xl4.wider.black.make(),
]).centered();
