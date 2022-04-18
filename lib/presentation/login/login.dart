import 'package:flutter/material.dart';

import '../../configuration/providers.dart';
import '../../configuration/text_constants.dart';
import '../../configuration/text_styles.dart';
import 'login_form.dart';
import '../top_stripe.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 67,
          ),
          const Center(child: TopStripe()),
          Container(
            padding: const EdgeInsets.only(
              top: 29,
              left: 30,
            ),
            height: 103,
            width: 256,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  TextConstants.hello,
                  style: TextStyles.helloLineTextStyle,
                ),
                Text(
                  TextConstants.welcomeBack,
                  style: TextStyles.welcomeBackTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const LogInForm(),
        ],
      ),
    );
  }
}
