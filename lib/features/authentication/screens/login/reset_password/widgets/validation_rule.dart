import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class ValidationRule extends StatelessWidget {
  const ValidationRule({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: const Color(0xff474747),
          ),
        ),

        const SizedBox(width: 8),

        const Icon(
          Icons.check_circle_outline,
          color: TColors.PrimaryColor,
          size: 20,
        ),
      ],
    );
  }
}