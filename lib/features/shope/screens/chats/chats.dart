import 'package:flutter/material.dart';
import 'package:rentease/common/widgets/appbar/appbar.dart';
import 'package:rentease/features/shope/screens/chats/widgets/chat_card.dart';
import 'package:rentease/features/shope/screens/chats/widgets/chat_filter_chip.dart';
import '../../../../utils/constants/image_strings.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: const TAppBar(
        title: 'المحادثات',
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 14),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ChatFilterChip(title: 'الكل', isSelected: true),
                  SizedBox(width: 8),
                  ChatFilterChip(title: 'غير مقروء'),
                  SizedBox(width: 8),
                  ChatFilterChip(title: 'عقاراتي'),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(
                  children: const [
                    ChatCard(
                      name: 'أحمد العقاد',
                      message: 'هل الشقة لا تزال متاحة؟ أحتاج لمعاينتها',
                      time: 'منذ ساعتين',
                      unreadCount: 3,
                      imagePath: TImages.user1,
                      isOnline: true,
                    ),
                    ChatCard(
                      name: 'منى محمود',
                      message: 'شكراً لك، سأقوم بإرسال العقد قريباً.',
                      time: 'أمس',
                      imagePath: TImages.user2,
                    ),
                    ChatCard(
                      name: 'شركة العقارات الحديثة',
                      message: 'تمت الموافقة على طلب الصيانة الخاص بكم',
                      time: 'الإثنين',
                      isCompany: true,
                      isOnline: true,
                    ),
                    ChatCard(
                      name: 'ياسر يوسف',
                      message: 'متى يمكنني استلام المفاتيح؟',
                      time: '12 مايو',
                      imagePath: TImages.user4,
                    ),
                    ChatCard(
                      name: 'سارة خالد',
                      message: 'تم تحديث تفاصيل الموقع الجغرافي.',
                      time: 'منذ دقيقة',
                      unreadCount: 1,
                      imagePath: TImages.user5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


