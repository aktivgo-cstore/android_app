import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../configuration/colors.dart';
import '../configuration/providers.dart';
import '../configuration/text_styles.dart';

class RegistrationFormField extends ConsumerWidget {
  final String _label;
  final IconButton? _button;
  final TextEditingController _textController;

  const RegistrationFormField({
    Key? key,
    required String label,
    required textController,
    IconButton? button,
  })  : _label = label,
        _button = button,
        _textController = textController,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (_button == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              _label,
              style: TextStyles.formFieldTextStyle,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30),
            height: 42,
            child: Stack(
              children: [
                TextField(
                  controller: _textController,
                  cursorColor: AppColors.cursorColor,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.textFieldLineColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.textFieldLineColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            _label,
            style: TextStyles.formFieldTextStyle,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 30),
          height: 42,
          child: Stack(
            children: [
              TextField(
                obscureText: ref
                    .watch(AppProviders.passwordObscureTextProvider.state)
                    .state,
                controller: _textController,
                cursorColor: AppColors.cursorColor,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.textFieldLineColor,
                      width: 4.5,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.textFieldLineColor,
                      width: 4.5,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 19,
                bottom: 4,
                child: _button!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
