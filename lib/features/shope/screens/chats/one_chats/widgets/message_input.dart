import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({
    super.key,
    required this.onSend,
  });

  final void Function(String message) onSend;

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController messageController = TextEditingController();

  void sendMessage() {
    final text = messageController.text.trim();

    if (text.isEmpty) return;

    widget.onSend(text);
    messageController.clear();

    // TODO Supabase:
    // لاحقاً هنا بدل الإرسال المحلي فقط
    // نعمل insert في جدول messages
    // ونحفظ:
    // chatId, senderId, messageText, createdAt, isSeen
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

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
          GestureDetector(
            onTap: sendMessage,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: TColors.PrimaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: TextField(
              controller: messageController,
              textAlign: TextAlign.right,
              onSubmitted: (_) => sendMessage(),
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