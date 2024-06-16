import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LogUtil {
  static PrintColor defaultColor = PrintColor.normal;

  static void debugPrintOverride({
    PrintColor printColor = PrintColor.normal,
  }) {
    if (!kDebugMode) {
      debugPrint = (String? message, {int? wrapWidth}) {};
    }
    defaultColor = printColor;
    donePrint('Debug mode is on'.toUpperCase());
  }

  static void normalPrint(String text) {
    debugPrint('\x1B[${defaultColor.color}$text\x1B[0m');
  }

  static void errorPrint(String text) {
    debugPrint('\x1B[31m$text\x1B[0m');
  }

  static void warningPrint(String text) {
    debugPrint(
      '\x1B[33m$text\x1B[0m',
      wrapWidth: 10000000,
    );
  }

  static void notePrint(String text) {
    debugPrint('\x1B[36m$text\x1B[0m', wrapWidth: 10000000);
  }

  static void conferencePrint(String text) {
    debugPrint('CONFERENCE => \x1B[36m$text\x1B[0m');
  }

  static void donePrint(String text) {
    debugPrint('\x1B[32m$text\x1B[0m');
  }

  static void printResponse(
    String key,
    Response response,
  ) {
    debugPrint('\x1B[32m${key.toUpperCase()} : ${response.data}\x1B[0m');
  }
}

enum PrintColor {
  black(color: '30m'),
  red(color: '31m'),
  green(color: '32m'),
  yellow(color: '33m'),
  blue(color: '34m'),
  magenta(color: '35m'),
  cyan(color: '36m'),
  white(color: '37m'),
  normal(color: '0m');

  final String color;
  const PrintColor({required this.color});
}
