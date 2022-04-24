import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'internal/application.dart';
import 'internal/shared_prefs_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefsModule.sharedPrefs().init();

  runApp(
    const ProviderScope(
      child: Application(),
    ),
  );
}
