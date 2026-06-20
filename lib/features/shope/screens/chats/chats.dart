import 'package:flutter/material.dart';
import 'package:rentease/common/widgets/appbar/appbar.dart';
import 'package:rentease/features/shope/screens/chats/models/chat_model.dart';
import 'package:rentease/features/shope/screens/chats/widgets/chat_card.dart';
import 'package:rentease/features/shope/screens/chats/widgets/chat_filter_chip.dart';
import '../../../../utils/constants/image_strings.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int selectedFilter = 0;

  final List<ChatModel> chats = const [
    ChatModel(
      name: 'أحمد العقاد',
      lastMessage: 'هل الشقة لا تزال متاحة؟ أحتاج لمعاينتها',
      time: 'منذ ساعتين',
      unreadCount: 3,
      imagePath: TImages.user1,
      isOnline: true,
      isMyProperty: true,
      messages: [
        ChatMessageModel(
          text: 'أهلاً، هل الشقة في حي الرمال لا تزال متاحة؟',
          isSender: false,
          time: 'ص 9:45',
        ),
        ChatMessageModel(
          text: 'أهلاً بك أحمد، نعم الشقة لا تزال متاحة للمعاينة.',
          isSender: true,
          time: 'ص 9:46',
          isSeen: true,
        ),
        ChatMessageModel(
          text: 'ممتاز، هل يمكننا تحديد موعد للمعاينة غداً مساءً؟',
          isSender: false,
          time: 'ص 9:47',
        ),
      ],
    ),
    ChatModel(
      name: 'منى محمود',
      lastMessage: 'شكراً لك، سأقوم بإرسال العقد قريباً.',
      time: 'أمس',
      imagePath: TImages.user2,
      messages: [
        ChatMessageModel(
          text: 'السلام عليكم، بخصوص العقد متى سيتم إرساله؟',
          isSender: false,
          time: 'م 6:20',
        ),
        ChatMessageModel(
          text: 'شكراً لك، سأقوم بإرسال العقد قريباً.',
          isSender: true,
          time: 'م 6:25',
          isSeen: true,
        ),
      ],
    ),
    ChatModel(
      name: 'شركة العقارات الحديثة',
      lastMessage: 'تمت الموافقة على طلب الصيانة الخاص بكم',
      time: 'الإثنين',
      isCompany: true,
      isOnline: true,
      isMyProperty: true,
      messages: [
        ChatMessageModel(
          text: 'مرحباً، هل تم متابعة طلب الصيانة؟',
          isSender: false,
          time: 'ص 10:15',
        ),
        ChatMessageModel(
          text: 'تمت الموافقة على طلب الصيانة الخاص بكم.',
          isSender: true,
          time: 'ص 10:18',
          isSeen: true,
        ),
      ],
    ),
    ChatModel(
      name: 'ياسر يوسف',
      lastMessage: 'متى يمكنني استلام المفاتيح؟',
      time: '12 مايو',
      imagePath: TImages.user4,
      messages: [
        ChatMessageModel(
          text: 'متى يمكنني استلام المفاتيح؟',
          isSender: false,
          time: 'م 4:10',
        ),
        ChatMessageModel(
          text: 'يمكنك استلامها غداً بعد الساعة الخامسة مساءً.',
          isSender: true,
          time: 'م 4:15',
          isSeen: true,
        ),
      ],
    ),
    ChatModel(
      name: 'سارة خالد',
      lastMessage: 'تم تحديث تفاصيل الموقع الجغرافي.',
      time: 'منذ دقيقة',
      unreadCount: 1,
      imagePath: TImages.user5,
      messages: [
        ChatMessageModel(
          text: 'تم تحديث تفاصيل الموقع الجغرافي.',
          isSender: false,
          time: 'الآن',
        ),
      ],
    ),
  ];

  List<ChatModel> get filteredChats {
    if (selectedFilter == 1) {
      return chats.where((chat) => chat.unreadCount != null).toList();
    }

    if (selectedFilter == 2) {
      return chats.where((chat) => chat.isMyProperty).toList();
    }

    return chats;
  }

  @override
  Widget build(BuildContext context) {
    final shownChats = filteredChats;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: const TAppBar(title: 'المحادثات'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => selectedFilter = 0),
                    child: ChatFilterChip(
                      title: 'الكل',
                      isSelected: selectedFilter == 0,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => setState(() => selectedFilter = 1),
                    child: ChatFilterChip(
                      title: 'غير مقروء',
                      isSelected: selectedFilter == 1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => setState(() => selectedFilter = 2),
                    child: ChatFilterChip(
                      title: 'عقاراتي',
                      isSelected: selectedFilter == 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: shownChats.isEmpty
                    ? const Center(
                  child: Text('لا توجد محادثات هنا'),
                )
                    : ListView.builder(
                  itemCount: shownChats.length,
                  itemBuilder: (context, index) {
                    return ChatCard(chat: shownChats[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}