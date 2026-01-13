import 'package:isar/isar.dart';

part 'chat_conversation.g.dart';

@collection
class ChatConversation {
  Id id = Isar.autoIncrement;

  @Index()
  String? conversationId; // Unique UUID or timestamp

  String? lastMessage;

  DateTime? lastUpdatedAt;

  // We store messages as a list of embedded objects
  List<LocalMessage> messages = [];
}

@embedded
class LocalMessage {
  String? text;
  String? senderId; // '0' for User, '1' for Bot
  DateTime? createdAt;
}



// // Note: This is an example for chatbot_repository.dart
// // You need to implement the actual repository with Isar.
// // Assume Isar is initialized globally or injected.
//
// // Add these schemas in a separate file, e.g., models/isar_models.dart
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:isar/isar.dart';
//
// part 'isar_models.g.dart'; // Run build_runner for this
//
// @collection
// class Conversation {
//   Id id = Isar.autoIncrement;
//
//   @Index()
//   late String convId; // UUID or string id
//
//   final messages = IsarLinks<ChatMsg>();
//
//   late DateTime createdAt;
// }
//
// @collection
// class ChatMsg {
//   Id id = Isar.autoIncrement;
//
//   late String text;
//
//   late String userId; // '0' user, '1' bot
//
//   late DateTime createdAt;
// }
//
// // In repository:
// import 'dart:math';
// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';
// import 'isar_models.dart';
// // ... other imports
//
// class ChatbotRepository {
//   late Isar _isar;
//
//   ChatbotRepository() {
//     _initIsar();
//   }
//
//   Future<void> _initIsar() async {
//     final dir = await getApplicationDocumentsDirectory();
//     _isar = await Isar.open(
//       [ConversationSchema, ChatMsgSchema],
//       directory: dir.path,
//     );
//   }
//
//   // Assume fetchAnswer is already implemented, e.g., API call
//   Future<{String question, String answer}> fetchAnswer(String question) async {
//   // Your API logic here
//   return {'question': question, 'answer': 'Mock answer'};
// }
//
// Future<String> createNewConversation() async {
//   final convId = _generateId();
//   final conv = Conversation()
//     ..convId = convId
//     ..createdAt = DateTime.now();
//   await _isar.writeTxn(() async {
//     await _isar.conversations.put(conv);
//   });
//   return convId;
// }
//
// Future<void> saveMessage(String convId, ChatMessage message) async {
//   final conv = await _isar.conversations.where().convIdEqualTo(convId).findFirst();
//   if (conv != null) {
//     final msg = ChatMsg()
//       ..text = message.text
//       ..userId = message.user.id
//       ..createdAt = message.createdAt;
//     await _isar.writeTxn(() async {
//       await _isar.chatMsgs.put(msg);
//       conv.messages.add(msg);
//       await conv.messages.save();
//     });
//   }
// }
//
// Future<List<ChatMessage>> loadMessages(String convId) async {
//   final conv = await _isar.conversations.where().convIdEqualTo(convId).findFirst();
//   if (conv != null) {
//     await conv.messages.load();
//     return conv.messages.map((m) => ChatMessage(
//       text: m.text,
//       user: ChatUser(id: m.userId),
//       createdAt: m.createdAt,
//     )).toList();
//   }
//   return [];
// }
//
// Future<String?> getLastConversation() async {
//   final last = await _isar.conversations.where().sortByCreatedAtDesc().findFirst();
//   return last?.convId;
// }
//
// Future<List<ConversationSummary>> getConversationSummaries() async {
//   final convs = await _isar.conversations.where().findAll();
//   List<ConversationSummary> summaries = [];
//   for (var conv in convs) {
//     await conv.messages.load();
//     String title = conv.messages.isNotEmpty ? conv.messages.first.text.substring(0, min(30, conv.messages.first.text.length)) : 'Untitled';
//     DateTime lastTime = conv.messages.isNotEmpty ? conv.messages.last.createdAt : conv.createdAt;
//     summaries.add(ConversationSummary(id: conv.convId, title: title, lastMessageTime: lastTime));
//   }
//   return summaries;
// }
//
// Future<void> clearAllConversations() async {
//   await _isar.writeTxn(() async {
//     await _isar.conversations.clear();
//     await _isar.chatMsgs.clear();
//   });
// }
//
// String _generateId() {
//   return DateTime.now().millisecondsSinceEpoch.toString(); // or use uuid
// }
// }