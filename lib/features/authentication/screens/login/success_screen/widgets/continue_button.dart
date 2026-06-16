import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 64,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.PrimaryColor,
          elevation: 10,
          shadowColor: TColors.PrimaryColor.withOpacity(0.35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.arrow_back,
              color: TColors.SecondaryColor,
              size: 24,
            ),

            const SizedBox(width: 12),

            Text(
              'متابعة',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: TColors.SecondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}