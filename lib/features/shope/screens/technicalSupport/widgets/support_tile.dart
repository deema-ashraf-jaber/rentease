import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class SupportTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onPressed;

  const SupportTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12.2),
      child: Container(
        padding: const EdgeInsets.all(16.26),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.2),
          border: Border.all(
            color: const Color(0xffE3E2E7),
            width: 1.02,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: TColors.PrimaryColor.withOpacity(0.05),
              child: Icon(
                icon,
                color: TColors.PrimaryColor,
              ),
            ),

            const SizedBox(width: 16.26),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(
                      fontWeight: FontWeight.w700,
                      color: TColors.PrimaryColor,
                      fontSize: 18,
                    ),
                  ),

                  Text(
                    subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff434750),
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xff747781),
            ),
          ],
        ),
      ),
    );
  }
}