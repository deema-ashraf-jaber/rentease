import 'package:flutter/material.dart';
import 'package:rentease/features/shope/screens/chats/models/chat_model.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/one_chats.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupportChatHelper {
  static Future<void> openSupportChat(BuildContext context) async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    final existing = await Supabase.instance.client
        .from('chats')
        .select()
        .eq('tenant_id', user.id)
        .eq('chat_type', 'support')
        .maybeSingle();

    Map<String, dynamic> chatData;

    if (existing == null) {
      chatData = await Supabase.instance.client
          .from('chats')
          .insert({
        'tenant_id': user.id,
        'owner_id': user.id,
        'tenant_email': user.email,
        'owner_email': 'support@rentease.com',
        'chat_type': 'support',
        'support_owner': 'RentEase Support',
        'last_message': 'مرحباً بك في دعم RentEase، كيف يمكننا مساعدتك اليوم؟',
        'last_message_at': DateTime.now().toIso8601String(),
      })
          .select()
          .single();

      await Supabase.instance.client.from('messages').insert({
        'chat_id': chatData['id'],
        'sender_id': user.id,
        'receiver_id': user.id,
        'sender_type': 'support_bot',
        'message': 'مرحباً بك في دعم RentEase، كيف يمكننا مساعدتك اليوم؟',
        'is_read': true,
      });
    } else {
      chatData = existing;
    }

    final supportChat = ChatModel(
      id: chatData['id'].toString(),
      name: 'الدعم الفني RentEase',
      lastMessage: (chatData['last_message'] ?? '').toString(),
      time: 'الآن',
      chatType: 'support',
      ownerId: user.id,
      tenantId: user.id,
      propertyId: chatData['property_id']?.toString(),
      isCompany: true,
      isOnline: true,
      messages: const [],
    );

    if (!context.mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OneChatsScreen(chat: supportChat),
      ),
    );
  }
}