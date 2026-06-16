import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 82,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              Icons.receipt_long_outlined,
              color: TColors.PrimaryColor,
              size: 22,
            ),
          ),

          const Spacer(),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'رقم المعاملة',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: const Color(0xff777777),
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '# RE-99281',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: TColors.PrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}