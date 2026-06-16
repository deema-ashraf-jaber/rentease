import 'package:flutter/material.dart';

class SignupDivider extends StatelessWidget {
  const SignupDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "أو التسجيل بواسطة",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade300)),
      ],
    );
  }
}