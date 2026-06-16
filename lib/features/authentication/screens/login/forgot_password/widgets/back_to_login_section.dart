import 'package:flutter/material.dart';
import 'package:rentease/features/authentication/screens/login/login.dart';

import '../../../../../../utils/constants/colors.dart';

class BackToLoginSection extends StatelessWidget {
  const BackToLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 1,
          color: TColors.SecondaryColor,
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const LoginScreen(),
                  ),
                );
              },
              child: Text(
                'العودة لتسجيل الدخول',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: TColors.PrimaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Text(
              'تذكرت كلمة المرور؟',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: const Color(0xff474747),
              ),
            ),
          ],
        ),
      ],
    );
  }
}