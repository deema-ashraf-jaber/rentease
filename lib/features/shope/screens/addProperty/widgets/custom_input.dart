import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hint;
  final IconData? icon;

  const CustomInput({
    super.key,
    required this.hint,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xffE8E8E8),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: const Color(0xff6D7280),
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              hint,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: const Color(0xff6B728080).withOpacity(0.50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}