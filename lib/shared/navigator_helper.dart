import 'package:flutter/material.dart';

import '../main.dart';

class NavigatorHelper {
  static final BuildContext context = navigateKey.currentState!.context;

  static Future<dynamic> push(Widget page) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );

  static Future<dynamic> pushNamedAndRemoveUntil(String page) =>
      Navigator.pushNamedAndRemoveUntil(
          NavigatorHelper.context, page, (route) => false);

  static Future<dynamic> pushReplacement(Widget page) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false,
      );

  static void pop() => Navigator.pop(context);

  static Future<dynamic> restart() =>
      Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
}
