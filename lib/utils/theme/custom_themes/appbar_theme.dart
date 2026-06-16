import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white60,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: TColors.PrimaryColor, size: 24),
    actionsIconTheme: IconThemeData(color: TColors.PrimaryColor, size: 24),
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: TColors.PrimaryColor,
    ),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: TColors.PrimaryColor,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: TColors.PrimaryColor, size: 24),
    actionsIconTheme: IconThemeData(color: TColors.PrimaryColor, size: 24),
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: TColors.PrimaryColor,
    ),
  );
}
