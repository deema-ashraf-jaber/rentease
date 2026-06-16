import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool today;

  const SectionTitle(
      this.title, {
        this.today = true,
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w700,
            color: today
                ? TColors.PrimaryColor
                : TColors.PrimaryColor.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}