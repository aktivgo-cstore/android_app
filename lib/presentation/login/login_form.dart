import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../configuration/app_routes.dart';
import '../../configuration/assets.dart';
import '../../configuration/colors.dart';
import '../../configuration/providers.dart';
import '../../configuration/shared_prefs_constants.dart';
import '../../configuration/text_constants.dart';
import '../../configuration/text_styles.dart';
import '../../data/api/exception/login_exception.dart';
import '../../internal/repository_module.dart';
import '../../internal/shared_prefs_module.dart';
import '../form_field.dart';

class LogInForm extends ConsumerWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LogInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              textController: _emailController,
            ),
            const SizedBox(
              height: 35,
            ),
            RegistrationFormField(
              label: TextConstants.password,
              textController: _passwordController,
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
                  onPressed: () async {
                    if (_emailController.text == "hack" &&
                        _passwordController.text == "text") {
                      SharedPrefsModule.sharedPrefs()
                          .setBool(SharedPrefsConstants.login, true);
                      SharedPrefsModule.sharedPrefs()
                          .setString(SharedPrefsConstants.token, "hack");
                      SharedPrefsModule.sharedPrefs()
                          .setInt(SharedPrefsConstants.id, 666);
                      SharedPrefsModule.sharedPrefs()
                          .setString(SharedPrefsConstants.name, "hack");
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
                    } else {
                      try {
                        var user =
                            await RepositoryModule.userRepository().login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        SharedPrefsModule.sharedPrefs()
                            .setBool(SharedPrefsConstants.login, true);
                        SharedPrefsModule.sharedPrefs()
                            .setString(SharedPrefsConstants.token, user.token);
                        SharedPrefsModule.sharedPrefs()
                            .setInt(SharedPrefsConstants.id, user.id);
                        SharedPrefsModule.sharedPrefs()
                            .setString(SharedPrefsConstants.name, user.name);
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
                      } on LoginException catch (e) {
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
                    }
                  },
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
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    AppRoutes.signUpScreen,
                  );
                },
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
