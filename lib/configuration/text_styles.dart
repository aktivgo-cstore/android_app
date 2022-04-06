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
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static TextStyle homePageButtonTextTextStyle = const TextStyle(
    fontSize: 18,
    fontFamily: 'Gelasio',
    color: AppColors.homePageButtonTextColor,
  );

  static TextStyle helloLineTextStyle = const TextStyle(
    fontSize: 30,
    fontFamily: 'Merriweather',
    fontWeight: FontWeight.normal,
    color: AppColors.helloColor,
  );

  static TextStyle welcomeBackTextStyle = const TextStyle(
    fontSize: 24,
    fontFamily: 'Merriweather',
    fontWeight: FontWeight.bold,
    color: AppColors.welcomeBackColor,
  );

  static TextStyle formFieldTextStyle = const TextStyle(
    color: AppColors.helloColor,
    fontSize: 14,
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textButtonForFormTextStyle = const TextStyle(
    color: AppColors.welcomeBackColor,
    fontSize: 18,
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w600,
  );

  static TextStyle elevatedButtonForFormTextStyle = const TextStyle(
    color: AppColors.homePageButtonTextColor,
    fontSize: 18,
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w600,
  );
}
