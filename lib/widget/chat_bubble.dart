import 'package:flutter/material.dart';


class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble({Key? key,
    required this.message,
    required this.isCurrentUser
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //dark mode vs light mode for the chat bubble text colors
    bool isDarkMode = false;
    //bool isDarkMode = Provider.of<ThemeProvider>(context,listen: false).isDarkMode;
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isCurrentUser
            ? (isDarkMode ?Colors.green.shade600:Colors.grey.shade500)
            :(isDarkMode?Colors.grey.shade800:Colors.grey.shade200)
      ),
      child: Text(message,
      style: TextStyle(
        color: isCurrentUser
            ?Colors.white
            :isDarkMode? Colors.white: Colors.black
      ),),
    );
  }
}
