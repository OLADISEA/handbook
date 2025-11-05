import 'package:google_generative_ai/google_generative_ai.dart';

class ChatBotRepo{
  final String apiKey2 = 'AIzaSyAYbUu5q8ySpCDOrl5yR1G7cwMQpyMWdCI';


  Future<String?> generateResponse() async{
    final model = GenerativeModel(
      model: "gemini-1.5-flash",
      apiKey: apiKey2
    );

    const prompt = 'This chat is based on advising student based on their career'
        'What you need to do is to welcome student to the platform';


    final response = await model.generateContent([Content.text(prompt)]);
    print(response.text);
    return response.text;
  }

}