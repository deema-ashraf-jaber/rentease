import 'package:flutter/material.dart';
import 'package:rentease/features/shope/screens/chats/models/chat_model.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/widgets/apartment_chat_card.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/widgets/app_bar_one_chats.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/widgets/chat_date_label.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/widgets/chat_message_bubble.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/widgets/message_input.dart';

class OneChatsScreen extends StatefulWidget {
  final ChatModel chat;

  const OneChatsScreen({
    super.key,
    required this.chat,
  });

  @override
  State<OneChatsScreen> createState() => _OneChatsScreenState();
}

class _OneChatsScreenState extends State<OneChatsScreen> {
  late List<ChatMessageModel> messages;

  @override
  void initState() {
    super.initState();
    messages = List<ChatMessageModel>.from(widget.chat.messages);
  }

  String getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'م' : 'ص';
    return '$period $hour:$minute';
  }

  void addMessage(String text) {
    setState(() {
      messages.add(
        ChatMessageModel(
          text: text,
          isSender: true,
          time: getCurrentTime(),
          isSeen: false,
        ),
      );
    });

    // TODO Supabase:
    // لاحقاً هنا الرسالة لازم تنحفظ في جدول messages داخل Supabase
    // مثال الأعمدة:
    // id
    // chat_id
    // sender_id
    // receiver_id
    // message_text
    // created_at
    // is_seen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF9FE),
      appBar: TAppBarOneChats(chat: widget.chat),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              itemCount: messages.length + 2,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const ChatDateLabel(text: 'اليوم');
                }

                if (index == messages.length + 1) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: ApartmentChatCard(),
                  );
                }

                final message = messages[index - 1];

                return ChatMessageBubble(
                  text: message.text,
                  isSender: message.isSender,
                  time: message.time,
                  isSeen: message.isSeen,
                );
              },
            ),
          ),

          MessageInput(
            onSend: addMessage,
          ),
        ],
      ),
    );
  }
}