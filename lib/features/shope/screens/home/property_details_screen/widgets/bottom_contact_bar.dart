import 'package:flutter/material.dart';
import 'package:rentease/features/shope/screens/chats/models/chat_model.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/one_chats.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../../utils/constants/colors.dart';

class BottomContactBar extends StatelessWidget {
  const BottomContactBar({
    super.key,
    required this.ownerId,
    required this.ownerName,
    required this.ownerPhone,
    required this.propertyTitle,
    required this.propertyId,
  });

  final String ownerId;
  final String ownerName;
  final String ownerPhone;
  final String propertyTitle;
  final String propertyId;

  Future<void> openChat(BuildContext context) async {
    final currentUser = Supabase.instance.client.auth.currentUser;

    if (currentUser == null) {
      showMessage(context, 'يجب تسجيل الدخول أولاً');
      return;
    }

    // TODO Graduation Demo:
    // مؤقتاً نسمح بمراسلة نفس الحساب لأن البيانات تجريبية.
    // لاحقاً نرجع هذا الشرط لمنع المستخدم من مراسلة نفسه.
    //
    // if (currentUser.id == ownerId) {
    //   showMessage(context, 'لا يمكنك مراسلة نفسك');
    //   return;
    // }

    try {
      final firstMessage = 'مرحباً، أريد الاستفسار عن $propertyTitle';

      final currentProfile = await Supabase.instance.client
          .from('profiles')
          .select('email')
          .eq('id', currentUser.id)
          .single();

      final currentEmail = currentProfile['email'].toString();

      final existingChats = await Supabase.instance.client
          .from('chats')
          .select()
          .or(
        'and(tenant_email.eq.$currentEmail,owner_email.eq.$ownerName),and(tenant_email.eq.$ownerName,owner_email.eq.$currentEmail)',
      )
          .limit(1);

      final existingChat =
      (existingChats as List).isEmpty ? null : existingChats.first;

      Map<String, dynamic> chatData;

      if (existingChat == null) {
        chatData = await Supabase.instance.client
            .from('chats')
            .insert({
          'property_id': propertyId,
          'tenant_id': currentUser.id,
          'owner_id': ownerId,
          'last_message': firstMessage,
          'last_message_at': DateTime.now().toIso8601String(),
          'tenant_email': currentEmail,
          'owner_email': ownerName,
        })
            .select()
            .single();

        await Supabase.instance.client.from('messages').insert({
          'chat_id': chatData['id'],
          'sender_id': currentUser.id,
          'receiver_id': ownerId,
          'message': firstMessage,
          'is_read': false,
        });
      } else {
        chatData = existingChat;
      }

      final chat = ChatModel(
        id: chatData['id'].toString(),
        ownerId: chatData['owner_id']?.toString(),
        tenantId: chatData['tenant_id']?.toString(),
        propertyId: chatData['property_id']?.toString(),
        name: ownerName,
        lastMessage: (chatData['last_message'] ?? firstMessage).toString(),
        time: 'الآن',
        isOnline: true,
        isCompany: false,
        messages: const [],
      );

      if (!context.mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OneChatsScreen(chat: chat),
        ),
      );
    } on PostgrestException catch (e) {
      showMessage(context, 'خطأ في فتح المحادثة: ${e.message}');
    } catch (e) {
      showMessage(context, 'حدث خطأ أثناء فتح المحادثة');
    }
  }

  void callOwner(BuildContext context) {
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

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.right),
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