import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'إعادة تعيين كلمة المرور',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: TColors.PrimaryColor,
            fontSize: 24,
          ),
        ),

        const SizedBox(height: 75),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              'يرجى إدخال كلمة المرور الجديدة الخاصة بك أدناه لتأمين\nحسابك والوصول إلى خدمات RentEase.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xff474747),
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}