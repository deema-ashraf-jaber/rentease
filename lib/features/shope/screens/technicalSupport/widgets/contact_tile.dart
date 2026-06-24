import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class ContactTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onPressed;

  const ContactTile({
    super.key,
    required this.title,
    required this.icon,
    this.isSelected = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? TColors.PrimaryColor.withOpacity(0.10)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? TColors.PrimaryColor.withOpacity(0.20)
                : const Color(0xffE3E2E7),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.65430450439453,
              height: 40.65430450439453,
              decoration: BoxDecoration(
                color: isSelected
                    ? TColors.PrimaryColor
                    : TColors.PrimaryColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(8.13),
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? const Color(0xff8BA8E6)
                    : const Color(0xff395F94),
              ),
            ),

            const SizedBox(width: 16.26),

            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: TColors.PrimaryColor,
                fontSize: 18,
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}