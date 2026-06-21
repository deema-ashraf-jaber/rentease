import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class UpdatePasswordButton extends StatelessWidget {
  const UpdatePasswordButton({
    super.key,
    required this.onPressed,
  });

  final Future<void> Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(
          Icons.lock_reset,
          color: Color(0xffE2E2E2),
        ),
        label: const Text(
          'تحديث كلمة المرور',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.PrimaryColor,
          foregroundColor: const Color(0xffE2E2E2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}