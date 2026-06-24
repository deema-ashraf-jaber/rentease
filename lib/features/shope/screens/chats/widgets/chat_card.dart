import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../models/chat_model.dart';
import '../one_chats/one_chats.dart';

class ChatCard extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback? onChatClosed;
  const ChatCard({
    super.key,
    required this.chat,
    this.onChatClosed
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OneChatsScreen(chat: chat),
          ),
        ).then((_) {
          onChatClosed?.call();
        },);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: TColors.PrimaryColor.withOpacity(0.04),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundColor: chat.isCompany
                      ? const Color(0xFF9EC2FE)
                      : const Color(0xFFE9EEF5),
                  backgroundImage:
                  chat.imagePath != null ? AssetImage(chat.imagePath!) : null,
                  child: chat.isCompany
                      ? const Icon(
                    Icons.business,
                    color: TColors.PrimaryColor,
                    size: 28,
                  )
                      : chat.imagePath == null
                      ? const Icon(
                    Icons.person,
                    color: TColors.PrimaryColor,
                  )
                      : null,
                ),
                if (chat.isOnline)
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4ADE80),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2B2B2B),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        chat.time,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: chat.unreadCount != null
                              ? FontWeight.w700
                              : FontWeight.w400,
                          color: chat.unreadCount != null
                              ? TColors.PrimaryColor
                              : const Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat.lastMessage,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF5F6368),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (chat.unreadCount != null)
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: TColors.PrimaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            chat.unreadCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}