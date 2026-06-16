import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.3),

    labelStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),

    selectedColor: const Color(0xFF0D9488),

    backgroundColor: Colors.grey.shade100,

    padding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 10,
    ),

    checkmarkColor: Colors.white,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey,

    labelStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),

    selectedColor: const Color(0xFF0D9488),

    backgroundColor: Colors.grey.shade800,

    padding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 10,
    ),

    checkmarkColor: Colors.white,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
}