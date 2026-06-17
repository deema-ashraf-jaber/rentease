import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          TImages.logo, // غيّريه حسب اسم اللوغو عندك
          height: 105,
        ),
        const SizedBox(height: 30),
        const Text(
          "تسجيل الدخول",
          style: TextStyle(
            color: TColors.PrimaryColor,
            fontSize: 44,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "أدخل بياناتك للوصول إلى حسابك",
          style: TextStyle(
            color: Color(0xff8A8A8A),
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}