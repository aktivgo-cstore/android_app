import 'package:flutter/material.dart';

import '../../configuration/assets.dart';
import '../../configuration/text_constants.dart';
import '../../configuration/text_styles.dart';
import 'settings_tile.dart';

class SettingsForm extends StatelessWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 22,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                TextConstants.personalInformation,
                style: TextStyles.personalInfoTextStyle,
              ),
              IconButton(
                onPressed: () {},
                icon: Assets.editPersonalInfoImage,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SettingsTile(
            label: TextConstants.name,
            value: 'Жмыщенко Николай',
          ),
          const SizedBox(
            height: 15,
          ),
          SettingsTile(
            label: TextConstants.email,
            value: 'vladko4kin1@yandex.ru',
          ),
          const SizedBox(
            height: 15,
          ),
          SettingsTile(
            label: TextConstants.password,
            value: '1230321',
          ),
        ],
      ),
    );
  }
}
