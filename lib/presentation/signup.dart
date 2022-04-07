import 'package:flutter/material.dart';

import '../configuration/text_constants.dart';
import '../configuration/text_styles.dart';
import 'signup_form.dart';
import 'top_stripe.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.only(
              top: 31,
              left: 30,
            ),
            child: Text(
              TextConstants.welcome,
              style: TextStyles.welcomeBackTextStyle,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const SignUpForm(),
        ],
      ),
    );
  }
}
