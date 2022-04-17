import 'package:flutter/material.dart';

import '../../configuration/colors.dart';
import '../../configuration/text_constants.dart';
import '../../configuration/text_styles.dart';
import 'setting_changing_tile.dart';

class SettingChangingForm extends StatelessWidget {
  const SettingChangingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 49),
            height: 60,
            child: Text(
              TextConstants.profile,
              style: TextStyles.profileTextStyle,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 22,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TextConstants.personalInformation,
                    style: TextStyles.personalInfoTextStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SettingChangingTile(
                    label: TextConstants.name,
                    value: 'Жмыщенко Николай',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SettingChangingTile(
                    label: TextConstants.email,
                    value: 'vladko4kin1@yandex.ru',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SettingChangingTile(
                    label: TextConstants.password,
                    value: '1230321',
                  ),
                ],
              ),
            ),
          ),
          Align(
            child: Container(
              margin: const EdgeInsets.only(bottom: 30),
              height: 60,
              width: 335,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  TextConstants.save,
                  style: TextStyles.saveTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
