import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configuration/assets.dart';
import '../../configuration/text_constants.dart';
import '../../configuration/text_styles.dart';

class TopCart extends StatelessWidget {
  const TopCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: IconButton(
              onPressed: () {},
              icon: Assets.previousImage,
            ),
          ),
          Text(
            TextConstants.myCart,
            style: TextStyles.profileTextStyle,
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            height: 1,
            width: 50,
          )
        ],
      ),
    );
  }
}
