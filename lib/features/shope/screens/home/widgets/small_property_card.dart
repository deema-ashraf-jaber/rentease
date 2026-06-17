
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class SmallPropertyCard extends StatelessWidget {
  const SmallPropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      margin: const EdgeInsets.fromLTRB(22, 0, 22, 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.13),
            blurRadius: 22,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'استوديو',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(
                    color: const Color(0xff6B7280),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),

                Text(
                  'حاصل مجهز بالكامل',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(
                    color: TColors.PrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: Color(0xff6B7280),
                    ),

                    Text(
                      'خانيونس، البلد',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(
                        color: const Color(0xff6B7280),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    Text(
                      '٧٠٠ ش.إ ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                        color: const Color(0xff4A6FA5),
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(width: 32.4),

                    Text(
                      "شهرياً",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(
                        color: const Color(0xff6B7280),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 14),

          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              TImages.gradient,
              width: 128,
              height: 128,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}