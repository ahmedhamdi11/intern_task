import 'package:flutter/material.dart';

class AppColor {
  static const primaryColor = Color(0xFF0062BD);
  static const whiteColor = Color(0xFFFFFFFF);
  static const greyColor = Color(0xff696969);
  static const shadowsColor = Color(0x3F000000);
  static const backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColor.primaryColor, AppColor.whiteColor],
    stops: [0, 0.55],
  );
}
