import 'package:flutter/material.dart';

class AppColors {
  static Color blackColor = const Color.fromRGBO(0, 0, 0, 1);
  static Color lightBlackColor = const Color.fromRGBO(34, 34, 34, 1);
  static Color whiteColor = const Color.fromRGBO(255, 255, 255, 1);
  static Color deepWhite = const Color.fromRGBO(242, 242, 242, 1);
  static Color blueColor = const Color.fromRGBO(0, 127, 180, 1);
  static Color blueColor2 = const Color.fromRGBO(0, 127, 180, 0.4);
  static Color darkBlueColor = const Color.fromRGBO(35, 55, 133, 1);
  static Color redColor = Colors.red;
  static Color orangeColor = Colors.orange;
  static Color greenColor = const Color.fromRGBO(71, 196, 9, 1);
  static Color lightgreenColor = const Color.fromRGBO(125, 255, 60, 1);
  static Color pinkColor = Colors.pink;
  static Color yellowColor = const Color.fromRGBO(255, 204, 1, 1);
  static Color greyColor = const Color.fromRGBO(213, 221, 231, 1);
  static Color lightGreyColor = const Color.fromRGBO(158, 172, 191, 0.7);
  static Color redColor_400 = Colors.red.shade400;
  static Color deepGrey = const Color.fromRGBO(71, 85, 105, 1);
  static Color delete = const Color.fromRGBO(255, 75, 85, 1);
  static Color darkBlue = const Color.fromRGBO(0, 84, 143, 1);
  static Color disabledColor = const Color(0xFFCCCCCC);
  static Color lightGreyColor2 = const Color.fromRGBO(198, 205, 218, 0.7);
  static Color lightGreyColor3 = const Color.fromRGBO(233, 233, 233, 1);
  static Color borderColor = const Color.fromRGBO(0, 127, 180, 0.4);
  static Color buttonColor = const Color.fromRGBO(0, 84, 143, 0.62);
  static Color borderColor2 = const Color.fromRGBO(235, 240, 249, 1);
  static Color dialogColor = const Color.fromRGBO(105, 165, 207, 1);
}

class AppFonts {
  static double Size8 = 6.2;
  static double Size10 = 7.5;
  static double Size11 = 8.5;
  static double Size12 = 9.2;
  static double Size14 = 10.7;
  static double Size15 = 11.5;
  static double Size16 = 12.2;
  static double Size17 = 13;
  static double Size18 = 13.7;
  static double Size20 = 15.5;
  static double Size23 = 17.5;
  static double Size24 = 18.3;
  static double Size25 = 19;
  static double Size30 = 23;
  static double Size32 = 24.5;
  static double Size35 = 26.5;
  static double Size40 = 30.6;
}

double appHeight({required BuildContext context, required double h}) {
  var screenper = h / 956;
  return MediaQuery.of(context).size.height * screenper;
}

double appWidth({required BuildContext context, required double w}) {
  var screenper = w / 440;
  return MediaQuery.of(context).size.width * screenper;
}

double respovsiveFontSize({required BuildContext context, required double f}) {
  var sum = ((MediaQuery.of(context).size.width / 3) / 100) * f;
  return sum;
}

class SharedKeys {
  static const String userData = 'userData';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
}
