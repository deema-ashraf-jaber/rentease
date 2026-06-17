import 'package:flutter/material.dart';

class TDivider extends StatelessWidget {
  const TDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 0.6,
      color: Colors.grey.shade200,
    );
  }
}