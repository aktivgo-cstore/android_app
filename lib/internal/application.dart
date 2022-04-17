import 'package:flutter/material.dart';

import '../presentation/home.dart';
import '../presentation/login/login.dart';
import '../presentation/main_form/main_form.dart';
import '../presentation/signup/signup.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainForm(),
    );
  }
}
