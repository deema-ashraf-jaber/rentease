import 'package:flutter/material.dart';

class TLoginDivider extends StatelessWidget {
  const TLoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "أو المتابعة عبر",
        style: TextStyle(
          color: Color(0xff7A7A7A),
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}