import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class TLoginDivider extends StatelessWidget {
  const TLoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300)),
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "أو المتابعة عبر",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: TColors.PrimaryColor.withOpacity(0.70),
              fontWeight: FontWeight.w700
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade300)),
      ],
    );
  }
}