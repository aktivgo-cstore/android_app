import 'package:flutter/material.dart';

import '../configuration/assets.dart';
import '../configuration/colors.dart';
import '../configuration/text_constants.dart';
import '../configuration/text_styles.dart';
import 'form_field.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LogInFormState();
  }
}

class _LogInFormState extends State<LogInForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 477,
      child: Card(
        margin: const EdgeInsets.only(right: 30),
        elevation: 20,
        shadowColor: Colors.white30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            RegistrationFormField(
              label: TextConstants.email,
            ),
            const SizedBox(
              height: 35,
            ),
            RegistrationFormField(
              label: TextConstants.password,
              button: IconButton(
                onPressed: () {},
                icon: Assets.eyeImage,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Align(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  TextConstants.forgotPassword,
                  style: TextStyles.textButtonForFormTextStyle,
                ),
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(AppColors.tapButtonColor),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              child: SizedBox(
                height: 50,
                width: 285,
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
                    TextConstants.login,
                    style: TextStyles.elevatedButtonForFormTextStyle,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(AppColors.tapButtonColor),
                ),
                child: Text(
                  TextConstants.signUp,
                  style: TextStyles.textButtonForFormTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
