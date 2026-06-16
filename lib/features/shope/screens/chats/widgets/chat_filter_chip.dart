import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';

class ChatFilterChip extends StatelessWidget {
  final String title;
  final bool isSelected;

  const ChatFilterChip({
    super.key,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? TColors.PrimaryColor : const Color(0xFFF4F3F8),
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w500,color: isSelected ? const Color(0xff8BA8E6): const Color(0xff434750)
          )
      ),
    );
  }
}
