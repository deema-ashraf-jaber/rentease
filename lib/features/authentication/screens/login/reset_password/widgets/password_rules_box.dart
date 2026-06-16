import 'package:flutter/material.dart';

import 'validation_rule.dart';

class PasswordRulesBox extends StatelessWidget {
  const PasswordRulesBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xffF3F3F3),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border(
          right: BorderSide(
            color: Color(0x33000000),
            width: 4,
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValidationRule(
              text: 'يجب أن تكون من 8 أحرف على الأقل',
            ),
            SizedBox(height: 8),
            ValidationRule(
              text: 'يجب أن تحتوي على رقم وحرف خاص واحد على الأقل',
            ),
          ],
        ),
      ),
    );
  }
}