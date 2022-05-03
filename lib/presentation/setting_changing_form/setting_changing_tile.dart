import 'package:flutter/material.dart';

import '../../configuration/colors.dart';
import '../../configuration/text_styles.dart';

class SettingChangingTile extends StatefulWidget {
  String label, value;

  SettingChangingTile({required this.label, required this.value, Key? key})
      : super(key: key);

  @override
  State<SettingChangingTile> createState() => _SettingChangingTileState();
}

class _SettingChangingTileState extends State<SettingChangingTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 91,
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                widget.label,
                style: TextStyles.labelSettingsTileTextStyle,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextField(
                controller: TextEditingController()..text = widget.value,
                style: TextStyles.valueSettingsTileTextStyle,
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
            ),
          ],
        ),
      ),
    );
  }
}
