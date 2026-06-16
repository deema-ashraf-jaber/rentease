import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class SuccessTextSection extends StatelessWidget {
  const SuccessTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '!تم بنجاح',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: TColors.PrimaryColor,
            fontSize: 44,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 16),

        Text(
          'تمت العملية بنجاح، يمكنك الآن الاستمرار في\n.استخدام التطبيق',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: const Color(0xff666666),
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}