import 'package:flutter/material.dart';

import '../../widget/my_textfield.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverId;
  ChatPage({Key? key,
    required this.receiverEmail,
    required this.receiverId}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //text controller
  TextEditingController messageController = TextEditingController();

  //GET THE CHAT AND AUTH SERVICES
  //final ChatServices chatServices = ChatServices();


  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        Future.delayed(Duration(milliseconds: 500), () => scrollDown());
      }
    });

    //wait a bit for listview to be built, then scroll down
    Future.delayed(Duration(milliseconds: 500), ()=> scrollDown());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }

  final ScrollController scrollController = ScrollController();

  void scrollDown(){
    scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn);
  }

  //function to send message
  void sendMessage() async{
    //if the message to send is not empty, then we will send the message

    if(messageController.text.isNotEmpty){
      //await chatServices.sendMessage(widget.receiverId, messageController.text);

      //clear the controller
      messageController.clear();

    }
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        title: Text(widget.receiverEmail),
      ),
      body: Column(
        children: [
          //display all the messages
          Expanded(
            child: _buildMessagesList(),
          ),
          _buildUserInput()
        ],
      ),
    );
  }

  Widget _buildMessagesList(){
    //String senderId = authService.getCurrentUser()!.uid;
    return Container();
    // return StreamBuilder(
    //     stream: chatServices.getMessages(senderId, widget.receiverId),
    //     builder: (context, snapshot){
    //       if(snapshot.hasError){
    //         Text("An Error has occurred while trying to fetch messages");
    //       }
    //
    //       if(snapshot.connectionState == ConnectionState.waiting){
    //         Text("Loading Messages");
    //
    //       }
    //
    //       //return List View
    //       return ListView(
    //         controller: scrollController,
    //         children:
    //             snapshot.data!.docs.map((doc) => _buildMessagesItem(doc)).toList(),
    //
    //       );
    //
    // });
  }

  // Widget _buildMessagesItem(DocumentSnapshot doc){
  //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //
  //   //is current user
  //   bool isCurrentUser = data["senderId"] == authService.getCurrentUser()!.uid;
  //
  //   //align the messages to the right if sender is the current user, otherwise to the left
  //   var alignment = isCurrentUser? Alignment.centerRight: Alignment.centerLeft;
  //
  //   return Container(
  //       alignment: alignment,
  //       child: Column(
  //         crossAxisAlignment: isCurrentUser? CrossAxisAlignment.end: CrossAxisAlignment.start,
  //         children: [
  //           ChatBubble(
  //               message: data["message"],
  //               isCurrentUser: isCurrentUser
  //           )
  //         ],
  //       ));
  // }

  Widget _buildUserInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Row(
        children: [
          Expanded(
              child: AppTextField(
                controller: messageController,
                hintText: "Type a message",
                obscureText: false,
                focusNode: focusNode,
              )
          ),

          //send button
          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(Icons.send,color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }
}
