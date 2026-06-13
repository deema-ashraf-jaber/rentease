import 'package:flutter/material.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          TImages.logo, // غيريها حسب اسم اللوجو عندك
          height: 90,
        ),
        const SizedBox(height: 20),

        Text(
          "تسجيل الدخول",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1D3D7C),
          ),
        ),
        const SizedBox(height: 8),

        Text(
          "أدخل بياناتك للوصول إلى حسابك",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}