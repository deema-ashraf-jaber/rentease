class ChatModel {
  final String name;
  final String lastMessage;
  final String time;
  final int? unreadCount;
  final String? imagePath;
  final bool isOnline;
  final bool isCompany;
  final bool isMyProperty;
  final List<ChatMessageModel> messages;

  const ChatModel({
    required this.name,
    required this.lastMessage,
    required this.time,
    this.unreadCount,
    this.imagePath,
    this.isOnline = false,
    this.isCompany = false,
    this.isMyProperty = false,
    required this.messages,
  });
}

class ChatMessageModel {
  final String text;
  final bool isSender;
  final String time;
  final bool isSeen;

  const ChatMessageModel({
    required this.text,
    required this.isSender,
    required this.time,
    this.isSeen = false,
  });
}