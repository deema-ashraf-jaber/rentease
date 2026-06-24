class ChatModel {
  final String id,name,lastMessage,time,chatType;
  final String? ownerId,tenantId,propertyId,imagePath;
  final int? unreadCount;
  final bool isOnline,isCompany,isMyProperty;
  final List<ChatMessageModel> messages;
  const ChatModel({
    this.id = '',
    this.ownerId,
    this.tenantId,
    this.propertyId,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.unreadCount,
    this.imagePath,
    this.chatType='property',
    this.isOnline = false,
    this.isCompany = false,
    this.isMyProperty = false,
    required this.messages,});}
class ChatMessageModel {
  final String text ,time;
  final bool isSender,isSeen;
  const ChatMessageModel({
    required this.text,
    required this.isSender,
    required this.time,
    this.isSeen = false,
  });
}