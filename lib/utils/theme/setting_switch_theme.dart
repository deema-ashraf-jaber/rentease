import 'package:flutter/material.dart';
import 'package:rentease/utils/constants/colors.dart';

class TSettingsSwitchTheme {
  static ThemeData theme(BuildContext context) {
    return Theme.of(context).copyWith(
      switchTheme: SwitchThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TColors.PrimaryColor;
          }
          return Colors.grey.shade300;
        }),

        thumbColor: WidgetStateProperty.all(Colors.white),

        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TColors.PrimaryColor;
          }
          return Colors.transparent;
        }),

        trackOutlineWidth: const WidgetStatePropertyAll(1.2),
      ),
    );
  }
}
