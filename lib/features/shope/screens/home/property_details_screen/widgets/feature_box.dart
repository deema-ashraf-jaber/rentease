import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';

class FeatureBox extends StatelessWidget {
  const FeatureBox({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF3F3F3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: TColors.PrimaryColor, size: 25),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w700,
              color: TColors.PrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}