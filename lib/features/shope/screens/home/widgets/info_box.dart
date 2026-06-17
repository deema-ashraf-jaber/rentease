
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF3F3F3),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: TColors.PrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 6),
          Icon(icon, size: 18, color: TColors.PrimaryColor),
        ],
      ),
    );
  }
}