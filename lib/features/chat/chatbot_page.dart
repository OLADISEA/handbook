import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_chatbot/features/chat/presentation/bloc/chatbot_bloc.dart';
import 'package:ui_chatbot/features/chat/presentation/bloc/chatbot_event.dart';
import 'package:ui_chatbot/features/chat/presentation/bloc/chatbot_state.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/texts/app_text.dart';
import '../auth/presentation/view/login_page.dart';
import '../cgpa_calculator/presentation/view/cgpa_calculator_screen.dart';
import '../faq/presentation/view/faq_screen.dart';
import '../feedback/feedback_page.dart';
import '../handbook_reader/presentation/view/handbook_reader_screen.dart';
import '../history/view/chat_history_drawer.dart';
import '../profile/presentation/view/profile_screen.dart';
import '../settings/settings_page.dart';
import 'data/repository/chatbot_repository.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  List<ChatMessage> messages = [];
  final ChatUser currentUser = ChatUser(id: '0', firstName: 'User');
  final ChatUser botUser = ChatUser(
    id: '1',
    firstName: 'HandbookBot',
    profileImage:
    'assets/images/csc_logo.jpg',
  );

  @override
  void initState() {
    super.initState();
    _showWelcomeMessage();

// Send a welcome message from the bot without showing the user message
    //final welcome = "Welcome to the University of Ibadan ChatBot platform for career advising. This chat is for students seeking university admission guidance.";

//     WidgetsBinding.instance.addPostFrameCallback((_) {
// // Add bot welcome shown in chat
//       final botMsg = ChatMessage(text: welcome, user: botUser, createdAt: DateTime.now());
//       setState(() => messages = [botMsg, ...messages]);
//     });
  }
  @override
  void dispose() {
    super.dispose();
  }

  void _startNewChat() {
    setState(() {
      messages = [];
      activeConversationId = null;
    });
    _showWelcomeMessage(); // Optional: add the first bot greeting
  }

  void _showWelcomeMessage() {
    final welcome = ChatMessage(
      text: "Hello! I am your University of Ibadan CS Handbook Assistant. How can I help you with your academic queries today?",
      user: botUser,
      createdAt: DateTime.now(),
    );
    setState(() => messages = [welcome]);
  }

  void _loadExistingChat(String conversationId) {
    // 1. Close the drawer
    Navigator.pop(context);

    // 2. Dispatch event to Bloc to fetch old messages
    // _bloc.add(LoadConversation(conversationId));

    // 3. Optional: Show a loading indicator while messages fetch
  }

  void _openMoreMenu() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Allows custom rounded container
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle Bar for UX
              Container(
                width: 40.w,
                height: 4.h,
                margin: EdgeInsets.only(bottom: 20.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),

              AppText(text: "Academic Tools", fontSize: 18.sp, fontWeight: FontWeight.bold),
              SizedBox(height: 20.h),

              // Grid of Actions
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3, // 3 columns for a balanced look
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 15.w,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildGridItem(
                    icon: Icons.calculate_rounded,
                    label: "CGPA",
                    color: Colors.blue,
                    onTap: () => _navigateTo(const CgpaCalculatorScreen()),
                  ),
                  _buildGridItem(
                    icon: Icons.question_answer_rounded,
                    label: "FAQs",
                    color: Colors.orange,
                    onTap: () => _navigateTo(const FaqScreen()),
                  ),
                  _buildGridItem(
                    icon: Icons.menu_book_rounded,
                    label: "Handbook",
                    color: Colors.green,
                    onTap: () => _navigateTo(const HandbookReaderScreen()),
                  ),
                  _buildGridItem(
                    icon: Icons.person_rounded,
                    label: "Profile",
                    color: Colors.purple,
                    onTap: () => _navigateTo(const ProfileScreen()),
                  ),
                  _buildGridItem(
                    icon: Icons.settings_suggest_rounded,
                    label: "Settings",
                    color: Colors.blueGrey,
                    onTap: () => _navigateTo(const SettingsPage()),
                  ),
                  _buildGridItem(
                    icon: Icons.rate_review_rounded,
                    label: "Feedback",
                    color: const Color(0xFF6C63FF),
                    onTap: () => _navigateTo(const FeedbackScreen()),
                  ),
                ],
              ),

              const Divider(height: 40),

              // Sign Out as a distinct action
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: const Icon(Icons.logout_rounded, color: Colors.red),
                ),
                title: AppText(
                    text: "Log Out",
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.red),
                onTap: () {
                  Navigator.pop(context);
                  _signOut();
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }

// Helper to handle navigation and pop the sheet
  void _navigateTo(Widget screen) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

// Widget builder for the Grid Items
  Widget _buildGridItem({required IconData icon, required String label, required Color color, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(icon, color: color, size: 28.sp),
          ),
          SizedBox(height: 8.h),
          AppText(text: label, fontSize: 12.sp, fontWeight: FontWeight.w600),
        ],
      ),
    );
  }


  void _signOut() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
    // TODO: call auth.signOut() if you use Firebase/Auth
  }

  String? activeConversationId;

  void _onLocalSend(ChatMessage chatMessage) {
    setState(() => messages = [chatMessage, ...messages]);

    final question = chatMessage.text ?? '';
    context.read<ChatbotBloc>().add(SendQuestion(question, activeConversationId));
  }


  @override
  Widget build(BuildContext context) {

    const primaryColor = Color(0xFF6C63FF);

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const ChatHistoryDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Column(
          children: [
            AppText(text: 'Handbook Bot', fontSize: 16.sp, fontWeight: FontWeight.bold),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8.w,
                  height: 8.w,
                  decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                ),
                SizedBox(width: 4.w),
                AppText(text: 'Always Online', fontSize: 10.sp, color: Colors.grey),
              ],
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: _openMoreMenu,
          )
        ],
      ),
      body: BlocConsumer<ChatbotBloc, ChatbotState>(
        listener: (context, state) {
          if (state is ChatbotHistoryLoaded) {
            setState(() {
              messages = state.historyMessages;
              activeConversationId = state.conversationId;
            });
          }
          if (state is ChatbotSuccess) {
            final botMsg = ChatMessage(text: state.answer, user: botUser, createdAt: DateTime.now());
            setState(() => messages = [botMsg, ...messages]);
          }
          if (state is ChatbotFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.message}")),
            );
          }
        },
        builder: (context, state) {
          return DashChat(
            currentUser: currentUser,
            onSend: _onLocalSend,
            messages: messages,
            // 2. Typing Indicator Logic
            typingUsers: state is ChatbotLoading ? [botUser] : [],

            // 3. Perfecting the Look (Theming)
            messageOptions: MessageOptions(
              showOtherUsersAvatar: true,
              showTime: true,
              containerColor: primaryColor, // User bubble
              textColor: Colors.white,
              onLongPressMessage: (msg) {
                // Feature: Copy to clipboard mentioned in UI design
              },
              currentUserContainerColor: Colors.grey.shade100, // Bot bubble
              currentUserTextColor: Colors.black87,
              messagePadding: EdgeInsets.all(12.r),
              borderRadius: 16.r,
            ),

            inputOptions: InputOptions(
              inputDecoration: InputDecoration(
                hintText: "Ask about courses, units, or CGPA...",
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade50,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide.none,
                ),
              ),
              // trailing: [
              //   IconButton(
              //     onPressed: _sendMediaMessage,
              //     icon: const Icon(Icons.image_search_rounded, color: primaryColor),
              //   ),
              // ],
            ),
          );
        },
      ),
    );
  }




  void _sendMediaMessage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      final chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: 'Describe this picture?',
        medias: [ChatMedia(url: file.path, fileName: '', type: MediaType.image)],
      );

      _onLocalSend(chatMessage);

    }
  }
}



