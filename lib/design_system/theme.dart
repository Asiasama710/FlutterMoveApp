import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text.dart';

extension MoveTheme on ThemeData {
  AppColorsTheme get appColors => extension<AppColorsTheme>()!;
  AppTextsTheme get appTexts => extension<AppTextsTheme>()!;
}
