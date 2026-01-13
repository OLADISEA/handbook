import 'package:equatable/equatable.dart';

abstract class ChatbotEvent extends Equatable {
  const ChatbotEvent();

  @override
  List<Object?> get props => [];
}

class SendQuestion extends ChatbotEvent {
  final String question;
  final String? conversationId;
  const SendQuestion(this.question, this.conversationId);

  @override
  List<Object?> get props => [question];

}

// Add this to your ChatbotEvent
class LoadConversation extends ChatbotEvent {
  final String conversationId;
  const LoadConversation(this.conversationId);
}

class FetchHistoryPreview extends ChatbotEvent {}