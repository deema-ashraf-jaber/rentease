import 'package:flutter/material.dart';

class TLoginDivider extends StatelessWidget {
  const TLoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "أو المتابعة عبر",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade300)),
      ],
    );
  }
}