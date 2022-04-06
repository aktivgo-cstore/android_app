import 'package:flutter/material.dart';

import '../configuration/assets.dart';

class TopStripe extends StatelessWidget {
  const TopStripe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 64,
          width: 105,
          child: Divider(
            thickness: 1,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Assets.loginPageImage,
        const SizedBox(
          width: 24,
        ),
        const SizedBox(
          height: 64,
          width: 105,
          child: Divider(
            thickness: 1,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
