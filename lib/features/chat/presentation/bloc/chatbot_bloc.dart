
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import '../../../history/chat_conversation.dart';
import '../../data/repository/chatbot_repository.dart';
import 'chatbot_event.dart';
import 'chatbot_state.dart';
class ChatbotBloc extends Bloc<ChatbotEvent, ChatbotState> {
  final ChatbotRepository repository;
  final Isar isar; // Inject Isar instance

  ChatbotBloc({required this.repository, required this.isar}) : super(ChatbotInitial()) {
    on<SendQuestion>(_onSendQuestion);
    on<LoadConversation>(_onLoadConversation);
    on<FetchHistoryPreview>((event, emit) async {
      // Fetch conversations sorted by newest first
      final conversations = await isar.chatConversations
          .where()
          .sortByLastUpdatedAtDesc()
          .findAll();
      emit(ChatbotHistoryPreviewLoaded(conversations));
    });
  }

  Future<void> _onSendQuestion(SendQuestion event, Emitter<ChatbotState> emit) async {
    // 1. Determine Conversation ID (New or Existing)
    final String currentId = event.conversationId ?? DateTime.now().millisecondsSinceEpoch.toString();

    // 2. Save User Message Locally First
    await _saveMessageLocally(currentId, event.question, '0');

    emit(ChatbotLoading());

    try {
      final response = await repository.fetchAnswer(event.question);

      // 3. Save Bot Response Locally
      await _saveMessageLocally(currentId, response.answer, '1');

      emit(ChatbotSuccess(
        question: response.question,
        answer: response.answer,
        conversationId: currentId,
      ));
    } catch (e) {
      emit(ChatbotFailure(e.toString()));
    }
  }

  Future<void> _saveMessageLocally(String convoId, String text, String senderId) async {
    await isar.writeTxn(() async {
      var existing = await isar.chatConversations.filter().conversationIdEqualTo(convoId).findFirst();
      print('messages runtimeType: ${existing?.messages.runtimeType}');
      print('messages length: ${existing?.messages.length}');

      final newMessage = LocalMessage()
        ..text = text
        ..senderId = senderId
        ..createdAt = DateTime.now();


      if (existing == null) {
        existing = ChatConversation()
          ..conversationId = convoId
          ..lastMessage = text
          ..lastUpdatedAt = DateTime.now()
          ..messages = [newMessage];
      } else {
        final updatedMessages = List<LocalMessage>.from(existing.messages ?? <LocalMessage>[])
          ..add(newMessage);
        existing.messages = updatedMessages;
        existing.lastMessage = text;
        existing.lastUpdatedAt = DateTime.now();
      }
      await isar.chatConversations.put(existing);
    });
  }

  Future<void> _onLoadConversation(LoadConversation event, Emitter<ChatbotState> emit) async {
    emit(ChatbotLoading());
    final conversation = await isar.chatConversations
        .filter()
        .conversationIdEqualTo(event.conversationId)
        .findFirst();

    if (conversation != null) {
      // Map LocalMessage back to DashChat ChatMessage
      final history = conversation.messages.map((m) => ChatMessage(
        text: m.text!,
        user: ChatUser(id: m.senderId!),
        createdAt: m.createdAt!,
      )).toList().reversed.toList(); // DashChat usually expects newest first

      emit(ChatbotHistoryLoaded(
        historyMessages: history,
        conversationId: event.conversationId,
      ));
    }
  }
}
// class ChatbotBloc extends Bloc<ChatbotEvent, ChatbotState> {
//   final ChatbotRepository repository;
//
//   ChatbotBloc({required this.repository}) : super(ChatbotInitial()) {
//     on<SendQuestion>(_onSendQuestion);
//     on<LoadConversation>(_onLoadConversation);
//   }
//
//   Future<void> _onSendQuestion(SendQuestion event, Emitter<ChatbotState> emit) async {
//     emit(ChatbotLoading());
//     try {
//       final response = await repository.fetchAnswer(event.question);
//
//       print("Bloc: Success emitting state");
//       emit(
//           ChatbotSuccess(
//               question: response.question,
//               answer: response.answer
//           ));
//     } catch (e) {
//       print("Bloc Error: $e");
//       emit(ChatbotFailure(e.toString()));
//     }
//   }
//
//   Future<void> _onLoadConversation(LoadConversation event, Emitter<ChatbotState> emit) async {
//     emit(ChatbotLoading());
//     try {
//       // TODO: Fetch messages from your local DB (Isar/SQLite) using event.conversationId
//       // For now, we simulate a fetch:
//       final List<ChatMessage> mockHistory = [];
//
//       emit(ChatbotHistoryLoaded(
//           historyMessages: mockHistory,
//           conversationId: event.conversationId
//       ));
//     } catch (e) {
//       emit(ChatbotFailure("Failed to load history: $e"));
//     }
//   }
// }