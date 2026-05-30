import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';

class BottomContactBar extends StatelessWidget {
  const BottomContactBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 12, 22, 18),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: TColors.PrimaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.chat_bubble_outline, color: Colors.white, size: 22),
                    SizedBox(width: 10),
                    Text(
                      'تواصل مع المعلن',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          InkWell(
            onTap: () {},
            child: Container(
              width: 58,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xffE0E0E0)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.call_outlined, color: TColors.PrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}