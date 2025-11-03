class ErrorMessage {
  final String message;

  ErrorMessage({required this.message});

  factory ErrorMessage.fromJson(Map<String, dynamic> json) {
    return ErrorMessage(
      message: json['message'] ?? 'Unknown error occurred',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
