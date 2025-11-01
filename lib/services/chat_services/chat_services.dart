//
// import '../../model/message.dart';
//
// //AIzaSyAYbUu5q8ySpCDOrl5yR1G7cwMQpyMWdCI
//
// class ChatServices{
//
//   // get an instance of the firestore and firebase auth
//
//   //get the user stream
//   Stream<List<Map<String, dynamic>>> getUserStream(){
//     return _firestore.collection("Users").snapshots().map((snapshot) {
//       return snapshot.docs.map((doc) {
//         //go through each individual user
//         final user = doc.data();
//
//         // return user
//         return user;
//       }).toList();
//     });
//   }
//   //send message
// Future<void> sendMessage(String receiverId, String message) async{
//     //get current user info
//     final String currentUserId = _auth.currentUser!.uid;
//     final String currentUserEmail = _auth.currentUser!.email!;
//     final Timestamp timestamp = Timestamp.now();
//
//     //create a new message
//   Message newMessage = Message(
//       senderId: currentUserId,
//       senderEmail: currentUserEmail,
//       receiverId: receiverId,
//       message: message,
//       timestamp: timestamp
//   );
//
//
//     //create a chat room ID for the two users
//   List<String> ids = [currentUserId, receiverId];
//   ids.sort(); //This ensures that the id is the same for any 2 people
//   String chatRoomId = ids.join('_');
//
//
//     //add the messages to the database
//   await _firestore.collection("chat_rooms").doc(chatRoomId).collection("messages").add(newMessage.toMap());
//
//
//
// }
//   //get messages
//   Stream<QuerySnapshot> getMessages(String userId, otherUserId){
//     //construct a chat room for the two users
//     List<String> id = [userId, otherUserId];
//     id.sort();
//     String chatRoomId = id.join('_');
//
//     return _firestore.collection("chat_rooms")
//         .doc(chatRoomId).collection("messages")
//         .orderBy("timestamp", descending: false)
//         .snapshots();
//   }
//
// }