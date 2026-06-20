import 'package:flutter/material.dart';
import 'package:rentease/features/shope/screens/chats/models/chat_model.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/one_chats.dart';
import '../../../../../../utils/constants/colors.dart';

class BottomContactBar extends StatelessWidget {
  const BottomContactBar({
    super.key,
    required this.ownerId,
    required this.ownerName,
    required this.ownerPhone,
    required this.propertyTitle,
  });

  final String ownerId;
  final String ownerName;
  final String ownerPhone;
  final String propertyTitle;

  void openChat(BuildContext context) {
    final chat = ChatModel(
      name: ownerName,
      lastMessage: 'مرحباً، أريد الاستفسار عن $propertyTitle',
      time: 'الآن',
      isOnline: true,
      isCompany: false,
      messages: [
        ChatMessageModel(
          text: 'مرحباً، أريد الاستفسار عن $propertyTitle',
          isSender: false,
          time: 'الآن',
        ),
      ],
    );

    // TODO Supabase:
    // لاحقاً هنا بدل إنشاء ChatModel محلي
    // نبحث أو ننشئ محادثة حسب:
    // currentUserId + ownerId + propertyId
    //
    // مثال:
    // final chat = await Supabase.instance.client
    //   .from('chats')
    //   .select()
    //   .eq('property_id', propertyId)
    //   .eq('owner_id', ownerId)
    //   .eq('tenant_id', currentUserId)
    //   .maybeSingle();
    //
    // إذا مش موجودة، نعمل insert لمحادثة جديدة.

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OneChatsScreen(chat: chat),
      ),
    );
  }

  void callOwner(BuildContext context) {
    // TODO Real Call:
    // لاحقاً لتفعيل الاتصال الحقيقي استخدمي url_launcher:
    //
    // final Uri phoneUri = Uri(scheme: 'tel', path: ownerPhone);
    // await launchUrl(phoneUri);
    //
    // ownerPhone قادم من جدول properties أو profiles في Supabase.

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'سيتم الاتصال بالمعلن على الرقم: $ownerPhone',
          textAlign: TextAlign.right,
        ),
        backgroundColor: TColors.PrimaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 12, 22, 18),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => openChat(context),
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
            onTap: () => callOwner(context),
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