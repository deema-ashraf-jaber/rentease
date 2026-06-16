import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';

class PropertyMainCard extends StatelessWidget {
  const PropertyMainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 32,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'فيلا مودرن في دير البلح',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: TColors.PrimaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'غزة، دير البلح',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: const Color(0xff6B7280),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Text(
                '٤,٠٠٠ ش.إ',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 24,
                  letterSpacing: -1.2,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff4A6FA5),
                  fontFamily: 'Noto Sans Arabic',
                ),
              ),
              Text(
                'شهرياً',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}