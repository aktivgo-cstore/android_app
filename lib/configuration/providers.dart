import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppProviders {
  static final passwordObscureTextProvider = StateProvider((ref) => false);

  static final updateCartProvider = StateProvider((ref) => false);
}
