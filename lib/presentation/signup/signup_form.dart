import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../configuration/app_routes.dart';
import '../../configuration/assets.dart';
import '../../configuration/colors.dart';
import '../../configuration/providers.dart';
import '../../configuration/shared_prefs_constants.dart';
import '../../configuration/text_constants.dart';
import '../../configuration/text_styles.dart';
import '../../data/api/exception/registration_exception.dart';
import '../../internal/repository_module.dart';
import '../../internal/shared_prefs_module.dart';
import '../form_field.dart';

class SignUpForm extends ConsumerWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  SignUpForm({Key? key}) : super(key: key);

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
            RegistrationFormField(
              label: TextConstants.name,
              textController: _nameController,
            ),
            const SizedBox(
              height: 35,
            ),
            RegistrationFormField(
              label: TextConstants.email,
              textController: _emailController,
            ),
            const SizedBox(
              height: 35,
            ),
            RegistrationFormField(
              textController: _passwordController,
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
              textController: _confirmPasswordController,
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
                  onPressed: () async {
                    try {
                      if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        throw RegistrationException('Пароли не совпадают');
                      }
                      var user =
                          await RepositoryModule.userRepository().register(
                        fullName: _nameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      );

                      SharedPrefsModule.sharedPrefs()
                          .setBool(SharedPrefsConstants.login, true);
                      SharedPrefsModule.sharedPrefs()
                          .setString(SharedPrefsConstants.token, user.token);
                      SharedPrefsModule.sharedPrefs()
                          .setInt(SharedPrefsConstants.id, user.id);
                      SharedPrefsModule.sharedPrefs().setString(
                        SharedPrefsConstants.name,
                        _nameController.text,
                      );
                      SharedPrefsModule.sharedPrefs().setString(
                        SharedPrefsConstants.email,
                        _emailController.text,
                      );
                      SharedPrefsModule.sharedPrefs().setString(
                        SharedPrefsConstants.password,
                        _passwordController.text,
                      );

                      Navigator.pop(context);
                      Navigator.pushNamed(
                        context,
                        AppRoutes.shopScreen,
                      );
                    } on RegistrationException catch (e) {
                      final alert = AlertDialog(
                        titleTextStyle: TextStyles.helloLineTextStyle,
                        title: const Text(
                          TextConstants.error,
                        ),
                        content: Text(e.cause),
                        contentTextStyle: TextStyles.formFieldTextStyle,
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }
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
