import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black12,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 48,
            decoration: BoxDecoration(
              color: TColors.PrimaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: '...اكتب رسالة',
                prefixIcon: const Icon(
                  Icons.emoji_emotions_outlined,
                  color: Color(0xff434750),
                ),
                suffixIcon: const Icon(
                  Icons.attachment,
                  color: Color(0xff434750),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(99),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xffE8E7ED),
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Icon(
            Icons.mic_none,
            color: Color(0xff747781),
          ),
        ],
      ),
    );
  }
}