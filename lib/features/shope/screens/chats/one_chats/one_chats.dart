import 'package:flutter/material.dart';
import 'package:rentease/features/shope/screens/chats/models/chat_model.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/widgets/app_bar_one_chats.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/widgets/chat_date_label.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/widgets/chat_message_bubble.dart';
import 'package:rentease/features/shope/screens/chats/one_chats/widgets/message_input.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  List<ChatMessageModel> messages = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMessages();
  }

  String formatTime(String? dateText) {
    final date = DateTime.tryParse(dateText ?? '');
    if (date == null) return 'الآن';

    final localDate = date.toLocal();
    int hour = localDate.hour;
    final minute = localDate.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'م' : 'ص';

    if (hour == 0) {
      hour = 12;
    } else if (hour > 12) {
      hour -= 12;
    }

    return '$period $hour:$minute';
  }

  String getCurrentTime() {
    final now = DateTime.now();
    int hour = now.hour;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'م' : 'ص';

    if (hour == 0) {
      hour = 12;
    } else if (hour > 12) {
      hour -= 12;
    }

    return '$period $hour:$minute';
  }

  String getSupportBotReply(String message) {
    final text = message.trim();

    if (text.contains('السلام') ||
        text.contains('مرحبا') ||
        text.contains('أهلا')) {
      return 'وعليكم السلام، أهلاً بك في دعم RentEase. كيف يمكننا مساعدتك؟';
    }

    if (text.contains('حساب') ||
        text.contains('تسجيل') ||
        text.contains('كلمة المرور')) {
      return 'يمكنك إدارة حسابك من صفحة الملف الشخصي. وإذا واجهت مشكلة في تسجيل الدخول، جرّب إعادة تعيين كلمة المرور.';
    }

    if (text.contains('دفع') ||
        text.contains('رسوم') ||
        text.contains('محفظة')) {
      return 'للاستفسارات المتعلقة بالدفع، يرجى اختيار طريقة الدفع ثم التواصل مع مالك العقار عبر المحادثة لإرسال إشعار الدفع.';
    }

    if (text.contains('عقار') ||
        text.contains('شقة') ||
        text.contains('إعلان')) {
      return 'يمكنك إضافة عقار من زر الإضافة في الصفحة الرئيسية، وسيتم إرسال الطلب للمراجعة قبل ظهوره للمستخدمين.';
    }

    return 'شكراً لتواصلك مع دعم RentEase. تم استلام رسالتك، وسنساعدك في أقرب وقت ممكن.';
  }

  Future<void> fetchMessages() async {
    final user = Supabase.instance.client.auth.currentUser;

    if (user == null || widget.chat.id.isEmpty) {
      setState(() => isLoading = false);
      return;
    }

    try {
      final response = await Supabase.instance.client
          .from('messages')
          .select()
          .eq('chat_id', widget.chat.id)
          .order('created_at', ascending: true);

      final loadedMessages = (response as List).map((item) {
        final map = item as Map<String, dynamic>;

        final isSupportBot = map['sender_type'] == 'support_bot';
        final isSender = !isSupportBot && map['sender_id'] == user.id;

        return ChatMessageModel(
          text: (map['message'] ?? '').toString(),
          isSender: isSender,
          time: formatTime(map['created_at']?.toString()),
          isSeen: isSender ? map['is_read'] == true : true,
        );
      }).toList();

      await Supabase.instance.client
          .from('messages')
          .update({'is_read': true})
          .eq('chat_id', widget.chat.id)
          .eq('receiver_id', user.id);

      if (!mounted) return;

      setState(() {
        messages = loadedMessages;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);
    }
  }

  Future<void> addMessage(String text) async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    final isSupportChat = widget.chat.chatType == 'support';

    final receiverId = isSupportChat
        ? user.id
        : user.id == widget.chat.ownerId
        ? widget.chat.tenantId
        : widget.chat.ownerId;

    if (receiverId == null || receiverId.isEmpty) return;

    try {
      await Supabase.instance.client.from('messages').insert({
        'chat_id': widget.chat.id,
        'sender_id': user.id,
        'receiver_id': receiverId,
        'sender_type': 'user',
        'message': text,
        'is_read': isSupportChat,
      });

      await Supabase.instance.client.from('chats').update({
        'last_message': text,
        'last_message_at': DateTime.now().toIso8601String(),
      }).eq('id', widget.chat.id);

      if (!mounted) return;

      setState(() {
        messages.add(
          ChatMessageModel(
            text: text,
            isSender: true,
            time: getCurrentTime(),
            isSeen: isSupportChat,
          ),
        );
      });

      if (isSupportChat) {
        await Future.delayed(const Duration(milliseconds: 600));

        final botReply = getSupportBotReply(text);

        await Supabase.instance.client.from('messages').insert({
          'chat_id': widget.chat.id,
          'sender_id': user.id,
          'receiver_id': user.id,
          'sender_type': 'support_bot',
          'message': botReply,
          'is_read': true,
        });

        await Supabase.instance.client.from('chats').update({
          'last_message': botReply,
          'last_message_at': DateTime.now().toIso8601String(),
        }).eq('id', widget.chat.id);

        if (!mounted) return;

        setState(() {
          messages.add(
            ChatMessageModel(
              text: botReply,
              isSender: false,
              time: getCurrentTime(),
              isSeen: true,
            ),
          );
        });
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'حدث خطأ أثناء إرسال الرسالة: $e',
            textAlign: TextAlign.right,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF9FE),
      appBar: TAppBarOneChats(chat: widget.chat),
      body: Column(
        children: [
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              itemCount: messages.length + 2,
              separatorBuilder: (context, index) =>
              const SizedBox(height: 12),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const ChatDateLabel(text: 'اليوم');
                }

                if (index == messages.length + 1) {
                  return const SizedBox.shrink();
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