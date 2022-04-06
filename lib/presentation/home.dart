import 'package:flutter/material.dart';

import '../configuration/assets.dart';
import '../configuration/colors.dart';
import '../configuration/text_constants.dart';
import '../configuration/text_styles.dart';
import 'login.dart';

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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: AppColors.homePageButtonColor,
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
