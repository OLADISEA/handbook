import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:equatable/equatable.dart';

import '../../../history/chat_conversation.dart';

abstract class ChatbotState extends Equatable {
  const ChatbotState();
  @override
  List<Object?> get props => [];
}


class ChatbotInitial extends ChatbotState {}

class ChatbotLoading extends ChatbotState {}

class ChatbotSuccess extends ChatbotState {
  final String question;
  final String answer;
  final String conversationId; // <--- Add this

  const ChatbotSuccess({
    required this.question,
    required this.answer,
    required this.conversationId, // <--- Add this
  });

  @override
  List<Object?> get props => [question, answer, conversationId]; // Update props
}

class ChatbotFailure extends ChatbotState {
  final String message;

  const ChatbotFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// Add this state to your file
class ChatbotHistoryLoaded extends ChatbotState {
  final List<ChatMessage> historyMessages;
  final String conversationId;

  const ChatbotHistoryLoaded({
    required this.historyMessages,
    required this.conversationId
  });

  @override
  List<Object?> get props => [historyMessages, conversationId];
}

class ChatbotHistoryPreviewLoaded extends ChatbotState {
  final List<ChatConversation> conversations;
  const ChatbotHistoryPreviewLoaded(this.conversations);

  @override
  List<Object?> get props => [conversations];
}