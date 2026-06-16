import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'نسيت كلمة المرور',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: TColors.PrimaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),

        const SizedBox(height: 26),

        SizedBox(
          width: 334,
          height: 48,
          child: Text(
            'لا تقلق، أدخل بريدك الإلكتروني المسجل وسنرسل لك\nرمزاً لإعادة تعيين كلمة المرور الخاصة بك.',
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontFamily: 'Cairo',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: const Color(0xff474747),
            ),
          ),
        ),
      ],
    );
  }
}