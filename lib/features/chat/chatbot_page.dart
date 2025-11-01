import 'dart:io';
import 'dart:typed_data';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';

import '../../config/app_colors.dart';
import '../../widget/my_drawer.dart';
import '../history/bloc/query_history_event.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: 'User');
  ChatUser geminiUser = ChatUser(
    id: '1',
    firstName: 'Gemini',
    profileImage: 'https://seeklogo.com/images/G/google-gemini-logo-A5787B2669-seeklogo.com.png',
  );



  @override
  void initState() {
    super.initState();
    _sendInitialGeminiMessage();
  }


  // Method to send the initial response from Gemini without showing the initial user message
  void _sendInitialGeminiMessage() {
    String initialPrompt =
        "Welcome to the University of Ibadan ChatBot platform for career advising. "
        "This chat is for students seeking university admission guidance.";

    gemini.streamGenerateContent(initialPrompt).listen((event) {
      String response = event.content?.parts?.fold("", (previous, current) => "$previous${current.text}") ?? "";

      // Add the Gemini response to the chat
      ChatMessage geminiMessage = ChatMessage(
        text: response,
        user: geminiUser,
        createdAt: DateTime.now(),
      );
      setState(() {
        messages = [geminiMessage, ...messages];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Career ChatBot'),
      ),
      drawer: MyDrawer(),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      inputOptions: InputOptions(
        trailing: [
          IconButton(onPressed: _sendMediaMessage, icon: const Icon(Icons.image))
        ],
      ),
      messages: messages,
      currentUser: currentUser,
      onSend: _sendMessage,
    );
  }

  // Send a message and store it with Isar
  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });

    try {
      String? question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [File(chatMessage.medias!.first.url).readAsBytesSync()];
      }

      // Process query with Gemini
      gemini.streamGenerateContent(question, images: images).listen((event) async {
        String response = event.content?.parts?.fold("", (previous, current) => "$previous${current.text}") ?? "";

        // Create ChatMessage for the response
        ChatMessage responseMessage = ChatMessage(
          text: response,
          user: geminiUser,
          createdAt: DateTime.now(),
        );

        // Add response to the message list
        setState(() {
          messages = [responseMessage, ...messages];
        });

        // Save query and response to Isar database
        //context.read<QueryHistoryBloc>().add(StoreInputEvents(question: question, response: response));
        print("saved");
        // final chatQuery = ChatQuery()
        //   ..queryText = question ?? ''
        //   ..responseText = response
        //   ..timestamp = DateTime.now();
        //
        // await isar.writeTxn(() async {
        //   await isar.chatQuerys.put(chatQuery);  // Save to Isar
        // });
      });
    } catch (e) {
      print(e);
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Describe this picture?",
        medias: [ChatMedia(url: file.path, fileName: "", type: MediaType.image)],
      );

      _sendMessage(chatMessage);
    }
  }
}




























