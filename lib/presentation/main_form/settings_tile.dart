import 'package:flutter/material.dart';

import '../../configuration/text_styles.dart';

class SettingsTile extends StatefulWidget {
  String label, value;

  SettingsTile({required this.label, required this.value, Key? key})
      : super(key: key);

  @override
  State<SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 78,
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
              child: Text(
                widget.value,
                style: TextStyles.valueSettingsTileTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
