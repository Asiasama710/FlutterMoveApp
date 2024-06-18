import 'package:flutter/material.dart';

class AppTextsTheme extends ThemeExtension<AppTextsTheme> {
  static const _baseFamily = "SourceSansPro";

  final TextStyle heading1;
  final TextStyle headline2;
  final TextStyle headline3;
  final TextStyle caption;
  final TextStyle body;
  final TextStyle label1;
  final TextStyle label2;
  final TextStyle label3;

  const AppTextsTheme._internal(
      {required this.headline2,
      required this.headline3,
      required this.caption,
      required this.label1,
      required this.label2,
      required this.label3,
      required this.heading1,
      required this.body});

  factory AppTextsTheme.main() => const AppTextsTheme._internal(
        heading1: TextStyle(
          fontSize: 24,
          fontFamily: _baseFamily,
          fontWeight: FontWeight.w600,
        ),
        headline2: TextStyle(
          fontSize: 22,
          fontFamily: _baseFamily,
          fontWeight: FontWeight.w600,
        ),
        headline3: TextStyle(
          fontFamily: _baseFamily,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
    label2 : TextStyle(
          fontFamily: _baseFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        body: TextStyle(
          fontFamily: _baseFamily,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        label1: TextStyle(
          fontFamily: _baseFamily,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
    caption: TextStyle(
            fontFamily: _baseFamily,
            fontSize: 12,
            fontWeight: FontWeight.w500,
        ),
        label3: TextStyle(
          fontFamily: _baseFamily,
          fontWeight: FontWeight.w400,
          fontSize: 10,
        ),
      );

  @override
  ThemeExtension<AppTextsTheme> copyWith() {
    return AppTextsTheme.main();
  }

  @override
  ThemeExtension<AppTextsTheme> lerp(
          covariant ThemeExtension<AppTextsTheme>? other, double t) =>
      this;
}
