import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';

class StepItem extends StatelessWidget {
  final String number;
  final String title;
  final bool active;

  const StepItem({
    super.key,
    required this.number,
    required this.title,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: active ? TColors.PrimaryColor : const Color(0xffE2E2E2),
          ),
          child: Center(
            child: Text(
              number,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: active ? Colors.white : const Color(0xff4A6FA5),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: active ? const Color(0xff1A1C1C) : const Color(0xff474747),
          ),
        ),
      ],
    );
  }
}