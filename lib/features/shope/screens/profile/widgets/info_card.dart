import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';

class InfoCard extends StatelessWidget {
  final String value;
  final String label;

  const InfoCard({super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: TColors.PrimaryColor,
                fontWeight: FontWeight.w700
            ),
          ),
          Text(
               label,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500,color: const Color(0xff747781)
              )
          ),
        ],
      ),
    );
  }
}