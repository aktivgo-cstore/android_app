import 'package:flutter/material.dart';

import '../../configuration/app_routes.dart';
import '../../configuration/assets.dart';
import '../../configuration/shared_prefs_constants.dart';
import '../../configuration/text_constants.dart';
import '../../configuration/text_styles.dart';
import '../../internal/shared_prefs_module.dart';

class TopProfileField extends StatelessWidget {
  const TopProfileField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              onPressed: () {},
              icon: Assets.searchProfileImage,
            ),
          ),
          Text(
            TextConstants.profile,
            style: TextStyles.profileTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                SharedPrefsModule.sharedPrefs()
                    .setBool(SharedPrefsConstants.login, false);
                SharedPrefsModule.sharedPrefs().remove(SharedPrefsConstants.id);
                SharedPrefsModule.sharedPrefs()
                    .remove(SharedPrefsConstants.token);
                SharedPrefsModule.sharedPrefs()
                    .remove(SharedPrefsConstants.name);
                SharedPrefsModule.sharedPrefs()
                    .remove(SharedPrefsConstants.email);
                SharedPrefsModule.sharedPrefs()
                    .remove(SharedPrefsConstants.password);

                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  AppRoutes.logInScreen,
                );
              },
              icon: Assets.exitButtonImage,
            ),
          ),
        ],
      ),
    );
  }
}
