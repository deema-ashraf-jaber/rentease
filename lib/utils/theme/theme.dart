import 'package:rentease/utils/constants/colors.dart';
import 'package:rentease/utils/theme/custom_themes/appbar_theme.dart';
import 'package:rentease/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:rentease/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:rentease/utils/theme/custom_themes/chip_theme.dart';
import 'package:rentease/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:rentease/utils/theme/custom_themes/outlined_botton_theme.dart';
import 'package:rentease/utils/theme/custom_themes/text_field_theme.dart';
import 'package:rentease/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "RobotoCondensed",
    brightness: Brightness.light,
    primaryColor: TColors.PrimaryColor,
    scaffoldBackgroundColor: const Color(0xFFF8FDFD),
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "RobotoCondensed",
    brightness: Brightness.dark,
    primaryColor: TColors.PrimaryColor,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
