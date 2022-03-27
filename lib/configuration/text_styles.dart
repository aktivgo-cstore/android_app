import 'package:flutter/material.dart';

import 'colors.dart';

class TextStyles {
  static TextStyle welcomeToTextStyle = const TextStyle(
    color: AppColors.welcomeToColor,
    fontSize: 24,
    fontFamily: 'Gelasio',
  );

  static TextStyle homePageOnboardingTextStyle = const TextStyle(
    color: AppColors.homePageOnboardingTextColor,
    fontSize: 18,
    fontFamily: 'NunitoSans',
    height: 1.6,
  );

  static TextStyle homePageButtonTextTextStyle = const TextStyle(
    fontSize: 18,
    fontFamily: 'Gelasio',
    color: AppColors.homePageButtonTextColor,
  );
}
