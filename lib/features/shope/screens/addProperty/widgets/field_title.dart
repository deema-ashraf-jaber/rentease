import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';

class FieldTitle extends StatelessWidget {
  final String title;

  const FieldTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          title,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: TColors.PrimaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}