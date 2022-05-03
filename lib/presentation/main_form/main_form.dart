import 'package:flutter/material.dart';

import '../../configuration/assets.dart';
import '../../configuration/colors.dart';
import '../../configuration/enums.dart';
import 'settings_form.dart';
import 'shop_form.dart';
import 'top_home_field.dart';
import 'top_profile_field.dart';

class MainForm extends StatefulWidget {
  const MainForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainFormState();
  }
}

class _MainFormState extends State<MainForm> {
  MainPage _tmpMainPage = MainPage.home;

  @override
  Widget build(BuildContext context) {
    void _changePage(MainPage newMainPage) {
      setState(() {
        _tmpMainPage = newMainPage;
      });
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 49),
            child: _tmpMainPage == MainPage.home
                ? const TopHomeField()
                : const TopProfileField(),
          ),
          Expanded(
            child: _tmpMainPage == MainPage.home
                ? const ShopForm()
                : const SettingsForm(),
          ),
          Container(
            height: 75,
            color: AppColors.bottomFieldColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => _changePage(MainPage.home),
                  icon: _tmpMainPage == MainPage.home
                      ? Assets.homeButtonPressedImage
                      : Assets.homeButtonImage,
                ),
                IconButton(
                  onPressed: () => _changePage(MainPage.settings),
                  icon: _tmpMainPage == MainPage.settings
                      ? Assets.settingsButtonPressedImage
                      : Assets.settingsButtonImage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
