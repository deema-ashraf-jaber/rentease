import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../models/chat_model.dart';

class TAppBarOneChats extends StatelessWidget implements PreferredSizeWidget {
  final ChatModel chat;

  const TAppBarOneChats({
    super.key,
    required this.chat,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: TColors.PrimaryColor,
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                chat.name,
                style: const TextStyle(
                  color: TColors.PrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                chat.isOnline ? 'نشط الآن' : 'غير متصل',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: chat.isCompany
                    ? const Color(0xFF9EC2FE)
                    : const Color(0xFFE9EEF5),
                backgroundImage:
                chat.imagePath != null ? AssetImage(chat.imagePath!) : null,
                child: chat.isCompany
                    ? const Icon(
                  Icons.business,
                  color: TColors.PrimaryColor,
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
                  bottom: 1,
                  right: 1,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: const Color(0xFF22C55E),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}