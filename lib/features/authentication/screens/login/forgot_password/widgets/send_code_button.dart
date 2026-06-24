import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class SendCodeButton extends StatelessWidget {
  const SendCodeButton({
    super.key,
    required this.onPressed,
  });

  final Future<void> Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 67,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.send_outlined),
        label: const Text('إرسال الرمز'),
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.PrimaryColor,
          foregroundColor: const Color(0xffE2E2E2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}