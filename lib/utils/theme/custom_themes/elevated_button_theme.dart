import 'package:rentease/utils/constants/colors.dart';
import 'package:rentease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: TColors.PrimaryColor,
      disabledForegroundColor: Colors.white,
      disabledBackgroundColor: Colors.grey.shade400,
      side: const BorderSide(color: TColors.PrimaryColor),

      minimumSize: const Size(double.infinity, TSizes.buttonHeight),

      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),

      textStyle: const TextStyle(
        fontSize: TSizes.fontSizeMd,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.cardRadiusXs),
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: TColors.PrimaryColor,
      disabledForegroundColor: Colors.white,
      disabledBackgroundColor: Colors.grey.shade600,
      side: const BorderSide(color: TColors.PrimaryColor),

      minimumSize: const Size(double.infinity, TSizes.buttonHeight),
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),

      textStyle: const TextStyle(
        fontSize: TSizes.fontSizeMd,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.cardRadiusXs),
      ),
    ),
  );
}
