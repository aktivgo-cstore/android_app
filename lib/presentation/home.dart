import 'package:flutter/material.dart';

import '../configuration/app_routes.dart';
import '../configuration/assets.dart';
import '../configuration/colors.dart';
import '../configuration/shared_prefs_constants.dart';
import '../configuration/text_constants.dart';
import '../configuration/text_styles.dart';
import '../internal/shared_prefs_module.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 225,
            ),
            Assets.homePageImage,
            const SizedBox(
              height: 16,
            ),
            Text(
              TextConstants.welcomeToText,
              style: TextStyles.welcomeToTextStyle,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 77,
                right: 77,
              ),
              child: Text(
                TextConstants.homePageOnboardingText,
                textAlign: TextAlign.center,
                style: TextStyles.homePageOnboardingTextStyle,
              ),
            ),
            const SizedBox(
              height: 66,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  SharedPrefsModule.sharedPrefs()
                              .containsKey(SharedPrefsConstants.login) &&
                          SharedPrefsModule.sharedPrefs()
                              .getBool(SharedPrefsConstants.login)!
                      ? AppRoutes.shopScreen
                      : AppRoutes.logInScreen,
                );
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.homePageButtonColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                fixedSize: const Size(159, 54),
              ),
              child: Text(
                TextConstants.homePageButtonText,
                style: TextStyles.homePageButtonTextTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
