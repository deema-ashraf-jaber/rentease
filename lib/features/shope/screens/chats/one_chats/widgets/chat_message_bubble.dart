import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';

class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({
    super.key,
    required this.text,
    required this.isSender,
    required this.time,
    this.isSeen = false,
  });

  final String text;
  final bool isSender;
  final String time;
  final bool isSeen;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        crossAxisAlignment:
        isSender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 300),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isSender ? TColors.PrimaryColor : const Color(0xffE3E2E7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: isSender ? Colors.white : const Color(0xff222222),
                fontSize: 15,
              ),
            ),
          ),

          const SizedBox(height: 4),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                time,
                style: const TextStyle(
                  color: Color(0xffC0C0C0),
                  fontSize: 11,
                ),
              ),
              if (isSender && isSeen) ...[
                const Icon(
                  Icons.done_all,
                  size: 14,
                  color: TColors.PrimaryColor,
                ),
                const SizedBox(width: 3),
              ],

            ],
          ),
        ],
      ),
    );
  }
}