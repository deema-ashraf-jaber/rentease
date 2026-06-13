import 'package:flutter/material.dart';
import 'package:rentease/utils/constants/colors.dart';

class TSettingsSwitchTheme {
  static ThemeData theme(BuildContext context) {
    return Theme.of(context).copyWith(
      switchTheme: SwitchThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return TColors.PrimaryColor;
          }
          return Colors.grey.shade300;
        }),

        thumbColor: MaterialStateProperty.all(Colors.white),

        trackOutlineColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return TColors.PrimaryColor;
          }
          return Colors.transparent;
        }),

        trackOutlineWidth: const MaterialStatePropertyAll(1.2),
      ),
    );
  }
}
