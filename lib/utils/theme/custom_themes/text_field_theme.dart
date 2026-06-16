import 'package:rentease/utils/constants/colors.dart';
import 'package:rentease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: const Color(0xFFC4C4C4),
    suffixIconColor: const Color(0xFFC4C4C4),

    labelStyle: const TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),

    hintStyle: const TextStyle(
      fontSize: 14,
      color: Color(0xFFC4C4C4),
      fontWeight: FontWeight.w400,
    ),

    errorStyle: const TextStyle(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      color: Colors.red,
    ),

    floatingLabelStyle: const TextStyle(
      fontSize: 14,
      color: TColors.PrimaryColor,
      fontWeight: FontWeight.w500,
    ),

    filled: true,
    fillColor: Colors.white,

    contentPadding: const EdgeInsets.symmetric(
      horizontal: TSizes.md,
      vertical: 14,
    ),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(width: 1, color: Color(0xFFC4C4C4)),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(width: 1, color: Color(0xFFC4C4C4)),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(width: 1, color: TColors.PrimaryColor),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: const Color(0xFFC4C4C4),
    suffixIconColor: const Color(0xFFC4C4C4),

    labelStyle: const TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),

    hintStyle: const TextStyle(
      fontSize: 14,
      color: Color(0xFFC4C4C4),
      fontWeight: FontWeight.w400,
    ),

    errorStyle: const TextStyle(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      color: Colors.red,
    ),

    floatingLabelStyle: const TextStyle(
      fontSize: 14,
      color: TColors.PrimaryColor,
      fontWeight: FontWeight.w500,
    ),

    filled: true,
    fillColor: Colors.black,

    contentPadding: const EdgeInsets.symmetric(
      horizontal: TSizes.md,
      vertical: 14,
    ),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(width: 1, color: Color(0xFFC4C4C4)),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(width: 1, color: Color(0xFFC4C4C4)),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(width: 1, color: TColors.PrimaryColor),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
  );
}
