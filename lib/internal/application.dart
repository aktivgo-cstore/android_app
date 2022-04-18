import 'package:flutter/material.dart';

import '../configuration/app_routes.dart';
import '../presentation/cart/cart.dart';
import '../presentation/home.dart';
import '../presentation/login/login.dart';
import '../presentation/main_form/main_form.dart';
import '../presentation/main_form/settings_form.dart';
import '../presentation/setting_changing_form/setting_changing_form.dart';
import '../presentation/signup/signup.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen,
      routes: {
        AppRoutes.homeScreen: (_) => const Home(),
        AppRoutes.logInScreen: (_) => const LogIn(),
        AppRoutes.signUpScreen: (_) => const SignUp(),
        AppRoutes.shopScreen: (_) => const MainForm(),
        AppRoutes.settingsScreen: (_) => const SettingChangingForm(),
        AppRoutes.cartScreen: (_) => const Cart(),
      },
    );
  }
}
