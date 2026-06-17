import 'package:flutter/material.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/widgets/apartment_chat_card.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/widgets/app_bar_one_chats.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/widgets/chat_date_label.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/widgets/chat_message_bubble.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/widgets/message_input.dart';

class OneChatsScreen extends StatelessWidget {
  const OneChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF9FE),
      appBar: const TAppBarOneChats(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              children: const [
                ChatDateLabel(text: 'اليوم'),

                SizedBox(height: 24),

                 ChatMessageBubble(
                  text: 'أهلاً رغدة، هل الشقة في حي الرمال لا تزال متاحة؟',
                  isSender: false,
                  time: 'ص 9:45 ',
                ),
                SizedBox(height: 12),

                 ChatMessageBubble(
                  text: 'أهلاً بك أحمد، نعم الشقة لا تزال متاحة للمعاينة.',
                  isSender: true,
                  time: 'ص 9:46 ',
                  isSeen: true,
                ),
                SizedBox(height: 12),

                 ChatMessageBubble(
                  text: 'ممتاز، هل يمكننا تحديد موعد للمعاينة غداً مساءً؟',
                  isSender: false,
                  time: 'ص 9:47 ',
                ),
                SizedBox(height: 16),

                ApartmentChatCard(),

                SizedBox(height: 16),
              ],
            ),
          ),

          const MessageInput(),
        ],
      ),
    );
  }
}