import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final Color primary;
  final Color secondary;
  final Color primaryVariant;
  final Color secondaryVariant;
  final Color surface;
  final Color background;
  final Color shadePrimary;
  final Color shadeSecondary;
  final Color shadeTertiary;
  final Color shadeQuad;
  final Color onPrimaryTitle;
  final Color onPrimaryBody;
  final Color onPrimaryTertiary;
  final Color error;
  final Color disable;
  final Color highlights;
  final Color textSecondary;

  const AppColorsTheme._internal(
      {required this.primaryVariant,
      required this.secondaryVariant,
      required this.shadePrimary,
      required this.shadeSecondary,
      required this.shadeTertiary,
      required this.shadeQuad,
      required this.onPrimaryTitle,
      required this.onPrimaryBody,
      required this.onPrimaryTertiary,
      required this.disable,
      required this.highlights,
      required this.primary,
      required this.secondary,
      required this.error,
      required this.surface,
      required this.background,
      required this.textSecondary});

  factory AppColorsTheme.dark() => const AppColorsTheme._internal(
        primary: Color(0xff861818),
        secondary: Color(0xffffffff),
        primaryVariant: Color(0xfff5d4d4),
        secondaryVariant: Color(0xffffffff),
        shadePrimary: Color(0xFFF1F1F1),
        shadeSecondary: Color(0x99F1F1F1),
        shadeTertiary: Color(0x4DF1F1F1),
        shadeQuad: Color(0x142C2A2A),
        error: Color(0xFFD92832),
        background: Color(0xFF110E0E),
        surface: Color(0xFF2A2828),
        onPrimaryTitle: Color(0xDE212121),
        onPrimaryBody: Color(0x99212121),
        onPrimaryTertiary: Color(0x5E212121),
        disable: Color(0xFF343434),
        highlights: Color(0x7FD9D9D9),
        textSecondary: Color(0x99000000),
  );


  @override
  ThemeExtension<AppColorsTheme> copyWith() {
    return AppColorsTheme.dark();
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
          covariant ThemeExtension<AppColorsTheme>? other, double t) =>
      this;
}
