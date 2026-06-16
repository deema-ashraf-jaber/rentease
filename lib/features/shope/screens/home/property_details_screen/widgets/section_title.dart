import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 30,
          color: TColors.PrimaryColor,
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w700,
            color: TColors.PrimaryColor,
          ),
        ),
      ],
    );
  }
}