import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class FaqTile extends StatelessWidget {
  final String title;

  const FaqTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.26),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F3F8),
        borderRadius: BorderRadius.circular(12.2),
      ),
      child: Row(
        children: [
          Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700 ,
                  color: TColors.PrimaryColor
              )
          ),
          const Spacer(),
           const  Icon(Icons.keyboard_arrow_down, color: Color(0xff747781)),

        ],
      ),
    );
  }
}