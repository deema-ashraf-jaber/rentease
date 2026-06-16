import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class SuccessIconBox extends StatelessWidget {
  const SuccessIconBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 48,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Center(
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: TColors.PrimaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.check,
                color: TColors.SecondaryColor,
                size: 58,
              ),
            ),
          ),
        ),

        Positioned(
          top: -14,
          right: -14,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xffF4F4F4),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
            ),
            child: const Icon(
              Icons.celebration_outlined,
              color: TColors.PrimaryColor,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}