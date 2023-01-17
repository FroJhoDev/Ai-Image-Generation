class ChatMessageModel {

  final String avatar;
  final bool recieved;
  final String message;
  final String time;

  ChatMessageModel({this.avatar = '', required this.recieved, required this.message, required this.time});
}