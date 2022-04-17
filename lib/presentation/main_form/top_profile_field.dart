import 'package:flutter/material.dart';

import '../../configuration/assets.dart';
import '../../configuration/text_constants.dart';
import '../../configuration/text_styles.dart';

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
              onPressed: () {},
              icon: Assets.exitButtonImage,
            ),
          ),
        ],
      ),
    );
  }
}
