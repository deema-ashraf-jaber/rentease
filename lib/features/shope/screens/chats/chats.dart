import 'package:flutter/material.dart';
import 'package:rentease/common/widgets/appbar/appbar.dart';
import 'package:rentease/features/shope/screens/chats/models/chat_model.dart';
import 'package:rentease/features/shope/screens/chats/widgets/chat_card.dart';
import 'package:rentease/features/shope/screens/chats/widgets/chat_filter_chip.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int selectedFilter = 0;
  bool isLoading = true;
  List<ChatModel> chats = [];

  @override
  void initState() {
    super.initState();
    fetchChats();
  }
  String formatChatTime(String? dateText) {
    final date = DateTime.tryParse(dateText ?? '');
    if (date == null) return '';

    final now = DateTime.now();
    final localDate = date.toLocal();
    final difference = now.difference(localDate);

    if (difference.inMinutes < 1) return 'الآن';
    if (difference.inMinutes < 60) return 'منذ ${difference.inMinutes} دقيقة';
    if (difference.inHours < 24) return 'منذ ${difference.inHours} ساعة';

    if (difference.inDays == 1) return 'أمس';

    return '${localDate.day}/${localDate.month}/${localDate.year}';
  }

  bool isRecentlyActive(String? dateText) {
    final date = DateTime.tryParse(dateText ?? '');
    if (date == null) return false;

    final difference = DateTime.now().difference(date.toLocal());
    return difference.inMinutes <= 5;
  }

  Future<void> fetchChats() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    try {
      final response = await Supabase.instance.client
          .from('chats')
          .select()
          .or('tenant_id.eq.${user.id},owner_id.eq.${user.id}')
          .order('last_message_at', ascending: false);

      final List<ChatModel> loadedChats = [];

      for (final item in response as List) {
        final chat = item as Map<String, dynamic>;

        final isOwner = chat['owner_id'] == user.id;
        final otherUserId = isOwner ? chat['tenant_id'] : chat['owner_id'];

        final isSupportChat = chat['chat_type'] == 'support';

        Map<String, dynamic>? property;
        Map<String, dynamic>? profile;

        String displayName;

        if (isSupportChat) {
          displayName = 'الدعم الفني RentEase';
        } else {
          property = await Supabase.instance.client
              .from('properties')
              .select('title, owner_email, owner_phone')
              .eq('id', chat['property_id'])
              .maybeSingle();

          profile = await Supabase.instance.client
              .from('profiles')
              .select('full_name, profile_image')
              .eq('id', otherUserId)
              .maybeSingle();

          displayName = isOwner
              ? (profile?['full_name'] ?? 'مستخدم RentEase').toString()
              : (property?['owner_email'] ?? profile?['full_name'] ?? 'معلن العقار').toString();
        }

        final unreadMessages = await Supabase.instance.client
            .from('messages')
            .select('id')
            .eq('chat_id', chat['id'])
            .eq('receiver_id', user.id)
            .eq('is_read', false);
        final latestMessage = await Supabase.instance.client
            .from('messages')
            .select('message, created_at')
            .eq('chat_id', chat['id'])
            .order('created_at', ascending: false)
            .limit(1)
            .maybeSingle();

        final lastMessageText =
        (latestMessage?['message'] ?? chat['last_message'] ?? '').toString();

        loadedChats.add(
          ChatModel(
            id: chat['id'].toString(),
            ownerId: chat['owner_id']?.toString(),
            tenantId: chat['tenant_id']?.toString(),
            propertyId: chat['property_id']?.toString(),
            name: displayName,
            imagePath: profile?['profile_image']?.toString(),
            chatType: isSupportChat ? 'support' : 'property',
            isCompany: isSupportChat,
            lastMessage: lastMessageText,
            unreadCount: (unreadMessages as List).isEmpty
                ? null
                : unreadMessages.length,
            isMyProperty: isOwner,
            messages: const [],
            time: formatChatTime(
              latestMessage?['created_at']?.toString() ??
                  chat['last_message_at']?.toString(),
            ),
            isOnline: isRecentlyActive(
              latestMessage?['created_at']?.toString() ??
                  chat['last_message_at']?.toString(),
            ),
          ),
        );
      }

      if (!mounted) return;

      setState(() {
        chats = loadedChats;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);
    }
  }

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
        child: RefreshIndicator(
          onRefresh: fetchChats,
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
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : shownChats.isEmpty
                      ? ListView(
                    children: const [
                      SizedBox(height: 180),
                      Center(child: Text('لا توجد محادثات هنا')),
                    ],
                  )
                      : ListView.builder(
                    itemCount: shownChats.length,
                    itemBuilder: (context, index) {
                      return ChatCard(chat: shownChats[index],onChatClosed: fetchChats,);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}