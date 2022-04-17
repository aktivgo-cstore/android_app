import 'package:flutter/material.dart';

import '../../configuration/assets.dart';
import '../../configuration/text_constants.dart';
import '../../configuration/text_styles.dart';

class TopHomeField extends StatelessWidget {
  const TopHomeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              onPressed: () {},
              icon: Assets.searchImage,
            ),
          ),
          Column(
            children: [
              Text(
                TextConstants.makeLife,
                style: TextStyles.makeLifeTextStyle,
              ),
              Text(
                TextConstants.happy,
                style: TextStyles.happyTextStyle,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: Assets.cartImage,
            ),
          ),
        ],
      ),
    );
  }
}
