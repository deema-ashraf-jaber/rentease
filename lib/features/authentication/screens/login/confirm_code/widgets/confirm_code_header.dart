import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class ConfirmCodeHeader extends StatelessWidget {
  const ConfirmCodeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'تحقق من حسابك',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: TColors.PrimaryColor,
            fontSize: 24,
          ),
        ),

        const SizedBox(height: 11),

        Text(
          'لقد أرسلنا رمز التحقق إلى البريد الإلكتروني',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: const Color(0xff474747),
          ),
        ),

        const SizedBox(height: 4),

        Padding(
          padding: const EdgeInsets.only(right: 13),
          child: Text(
            'us**@gmail.com',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: TColors.PrimaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}