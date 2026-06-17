import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class ResendCodeSection extends StatelessWidget {
  const ResendCodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'لم تستلم الرمز؟',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: const Color(0xff474747),
          ),
        ),

        const SizedBox(height: 8),

        GestureDetector(
          onTap: () {},
          child: Text(
            'إعادة إرسال الرمز',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: TColors.PrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}