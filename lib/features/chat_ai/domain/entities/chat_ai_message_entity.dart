class ChatAiMessageEntity {
  final String avatar;
  final bool isReceived;
  final String message;
  final String time; 
  ChatAiMessageEntity({
    this.avatar = '',
    required this.isReceived,
    required this.message,
    required this.time,
  });
}
