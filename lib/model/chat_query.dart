import 'package:isar/isar.dart';

part 'chat_query.g.dart'; // Required for Isar code generation

@Collection()
class ChatQuery {
  Id id = Isar.autoIncrement;  // Automatically incremented ID

  late String queryText;  // The user's query

  late String responseText;  // The chatbot's response

  late DateTime timestamp;  // The timestamp for when the query and response were made

// You can also add other fields if necessary, like user ID or query category
}
