import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../configuration/app_routes.dart';
import '../../configuration/assets.dart';
import '../../configuration/colors.dart';
import '../../configuration/providers.dart';
import '../../configuration/text_constants.dart';
import '../../configuration/text_styles.dart';
import '../form_field.dart';

class SignUpForm extends ConsumerWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 587,
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
            const RegistrationFormField(
              label: TextConstants.name,
            ),
            const SizedBox(
              height: 35,
            ),
            const RegistrationFormField(
              label: TextConstants.email,
            ),
            const SizedBox(
              height: 35,
            ),
            RegistrationFormField(
              label: TextConstants.password,
              button: IconButton(
                onPressed: () {
                  var obscureText = ref
                      .watch(AppProviders.passwordObscureTextProvider.state)
                      .state;
                  ref
                      .read(AppProviders.passwordObscureTextProvider.state)
                      .state = !obscureText;
                },
                icon: Assets.eyeImage,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            RegistrationFormField(
              label: TextConstants.confirmPassword,
              button: IconButton(
                onPressed: () {
                  var obscureText = ref
                      .watch(AppProviders.passwordObscureTextProvider.state)
                      .state;
                  ref
                      .read(AppProviders.passwordObscureTextProvider.state)
                      .state = !obscureText;
                },
                icon: Assets.eyeImage,
              ),
            ),
            const SizedBox(
              height: 50,
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
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      AppRoutes.shopScreen,
                    );
                  },
                  child: Text(
                    TextConstants.signUp,
                    style: TextStyles.elevatedButtonForFormTextStyle,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TextConstants.alreadyHaveAccount,
                  style: TextStyles.alreadyHaveAnAccauntTextStyle,
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(AppColors.tapButtonColor),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      AppRoutes.logInScreen,
                    );
                  },
                  child: Text(
                    TextConstants.signIn,
                    style: TextStyles.signInTextStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
