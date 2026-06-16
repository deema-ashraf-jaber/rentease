import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.PrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'تحقق الآن',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: TColors.SecondaryColor,
          ),
        ),
      ),
    );
  }
}