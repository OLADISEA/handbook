import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ui_chatbot/features/chat/data/model/chatbot_response_model.dart';
class ChatbotRepository {
  final http.Client client;
  final Uri endpoint;

  ChatbotRepository({http.Client? client, Uri? endpoint})
      : client = client ?? http.Client(),
        //https://8f31c21a9bc2.ngrok-free.app/bot/lecture-chatbot/
        endpoint = endpoint ?? Uri.parse(
            // 'https://b8f00d7c3589.ngrok-free.app/bot/lecture-chatbot/'
            'https://jerold-unsuperior-fonda.ngrok-free.dev/bot/lecture-chatbot/'
        );

  Future<ChatResponseModel> fetchAnswer(String question) async {
    final payload = jsonEncode(
        {
          'question': question,
          "lecture_id": "81bc1ae4-c930-4be8-a9a8-850cc9a4a5df"
        }
    );

    final response = await client.post(
      endpoint,
      headers: {'Content-Type': 'application/json'},
      body: payload,
    );
    print(response);

    if (response.statusCode == 200) {
      print('object');
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return ChatResponseModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch chatbot answer: ${response.statusCode}');
    }
  }
}