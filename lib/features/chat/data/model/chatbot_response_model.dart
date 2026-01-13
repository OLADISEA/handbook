class ChatResponseModel {
  final String question;
  final String answer;

  ChatResponseModel({required this.question, required this.answer});

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      question: json['question'] as String? ?? '',
      answer: json['answer'] as String? ?? '',
    );
  }
}