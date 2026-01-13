// import 'package:isar/isar.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:ui_chatbot/model/chat_query.dart';
//
// class QueryHistoryDB extends ChangeNotifier {
//   static late Isar isar;
//
//   // Initialize Isar database
//   static Future<void> initialize() async {
//     final dir = await getApplicationDocumentsDirectory();
//     isar = await Isar.open([ChatQuerySchema], directory: dir.path); // Open database with the schema
//   }
//
//   // List of ChatQuery objects representing user queries
//   final List<ChatQuery> currentInputList = [];
//
//   // Add a new query to the database
//   Future<void> addQuery(String query, String response) async {
//     // Create a new ChatQuery object
//     final currentQuery = ChatQuery()
//       ..queryText = query
//       ..responseText = response
//       ..timestamp = DateTime.now(); // Set current timestamp
//
//     // Save it to the database within a write transaction
//     await isar.writeTxn(() => isar.chatQuerys.put(currentQuery));
//
//     // Fetch the updated list of queries from the database
//     fetchUserQueries();
//   }
//
//   // Fetch all queries from the database
//   Future<void> fetchUserQueries() async {
//     // Fetch the list of all stored queries
//     List<ChatQuery> fetchedQueries = await isar.chatQuerys.where().findAll();
//
//     // Clear the existing list and update with fetched queries
//     currentInputList.clear();
//     currentInputList.addAll(fetchedQueries);
//     print("Below is the history");
//     print(currentInputList);
//
//     // Notify listeners to update the UI
//     notifyListeners();
//   }
// }
