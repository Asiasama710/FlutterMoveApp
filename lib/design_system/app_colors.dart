import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final Color primary;
  final Color secondary;
  final Color onSecondary;
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
  final Color errorContainer;
  final Color disable;
  final Color highlights;
  final Color textSecondary;

  const AppColorsTheme._internal(
      {required this.primaryVariant,
      required this.secondaryVariant,
      required this.shadePrimary,
      required this.shadeSecondary,
      required this.onSecondary,
      required this.shadeTertiary,
      required this.shadeQuad,
      required this.onPrimaryTitle,
      required this.onPrimaryBody,
      required this.onPrimaryTertiary,
      required this.errorContainer,
      required this.disable,
      required this.highlights,
      required this.primary,
      required this.secondary,
      required this.error,
      required this.surface,
      required this.background,
      required this.textSecondary});

  factory AppColorsTheme.dark() => const AppColorsTheme._internal(
        primary: Color(0xff98c1d9),
        secondary: Color(0xff4a5d6f),
        primaryVariant: Color(0xb398c1d9),
        secondaryVariant: Color(0xffFAF4E9),
        shadePrimary: Color(0xDD001A1F),
        shadeSecondary: Color(0x99001A1F),
        shadeTertiary: Color(0x5E001A1F),
        shadeQuad: Color(0x14001A1F),
        error: Color(0xFFD92832),
        errorContainer: Color(0x0AD92932),
        background: Color(0xFF242A32),
        surface: Color(0xFFFFFFFF),
        onPrimaryTitle: Color(0xDEFFFFFF),
        onPrimaryBody: Color(0x80FFFFFF),
        onPrimaryTertiary: Color(0x5EFFFFFF),
        disable: Color(0xFFDEDEDE),
        highlights: Color(0x7FD9D9D9),
        textSecondary: Color(0x99000000),
        onSecondary: Color(0xFF98C1D9),
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
