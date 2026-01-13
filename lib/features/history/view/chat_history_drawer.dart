import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/core/widgets/buttons/primary_button.dart';
import 'package:ui_chatbot/core/widgets/texts/app_text.dart';
import 'package:ui_chatbot/core/constants/app_colors.dart';

import '../../chat/presentation/bloc/chatbot_bloc.dart';
import '../../chat/presentation/bloc/chatbot_event.dart';
import '../../chat/presentation/bloc/chatbot_state.dart';

class ChatHistoryDrawer extends StatefulWidget {
  const ChatHistoryDrawer({super.key});

  @override
  State<ChatHistoryDrawer> createState() => _ChatHistoryDrawerState();
}

class _ChatHistoryDrawerState extends State<ChatHistoryDrawer> {


  @override
  void initState() {
    // TODO: implement initState
    context.read<ChatbotBloc>().add(FetchHistoryPreview());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF6C63FF);

    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            _buildDrawerHeader(context, primaryColor),
            const Divider(height: 1),

            Expanded(
              child: BlocBuilder<ChatbotBloc, ChatbotState>(
                builder: (context, state) {
                  if (state is ChatbotLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ChatbotHistoryPreviewLoaded) {
                    if (state.conversations.isEmpty) {
                      return const Center(child: Text("No history yet"));
                    }

                    return ListView.builder(
                      padding: EdgeInsets.all(12.w),
                      itemCount: state.conversations.length,
                      itemBuilder: (context, index) {
                        final chat = state.conversations[index];
                        return _buildHistoryItem(
                            context,
                            chat.lastMessage ?? "New Chat",
                            chat.conversationId ?? ""
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
            _buildFooter(context),
          ],
        ),
      ),
    );

    // return Drawer(
    //   backgroundColor: Colors.white,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //       topRight: Radius.circular(20),
    //       bottomRight: Radius.circular(20),
    //     ),
    //   ),
    //   child: SafeArea(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         // 1. Header with "New Chat" button
    //         _buildDrawerHeader(context, primaryColor),
    //
    //         const Divider(height: 1, color: Color(0xFFEEEEEE)),
    //
    //         // 2. Chat List Grouped by Time
    //         Expanded(
    //           child: ListView(
    //             padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
    //             children: [
    //               _buildTimeSection("Today"),
    //               _buildHistoryItem(context, "Admission Requirements Info", "2 mins ago"),
    //               _buildHistoryItem(context, "How to calculate CGPA", "1 hour ago"),
    //
    //               SizedBox(height: 20.h),
    //               _buildTimeSection("Yesterday"),
    //               _buildHistoryItem(context, "CSC 213 Course Materials", "2:30 PM"),
    //               _buildHistoryItem(context, "Exam Regulations for 100L", "10:15 AM"),
    //
    //               SizedBox(height: 20.h),
    //               _buildTimeSection("Previous 7 Days"),
    //               _buildHistoryItem(context, "Direct Entry Application", "Oct 24"),
    //             ],
    //           ),
    //         ),
    //
    //         // 3. Refined Footer with Action Buttons
    //         _buildFooter(context),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget _buildDrawerHeader(BuildContext context, Color primaryColor) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        children: [
          Row(
            children: [
              // Your Logo or App Icon
              Container(
                padding: EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(Icons.auto_awesome, color: primaryColor, size: 20.sp),
              ),
              SizedBox(width: 12.w),
              AppText(text: "Chat History", fontSize: 18.sp, fontWeight: FontWeight.bold),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          SizedBox(height: 12.h),
          // "New Chat" Action
          InkWell(
            onTap: () {
              // TODO: Logic to reset chat
              Navigator.pop(context);
              // Add an event to your Bloc to reset the 'activeConversationId'
              context.read<ChatbotBloc>().add(const LoadConversation(''));
            },
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.add_comment_outlined, size: 18.sp, color: primaryColor),
                  SizedBox(width: 12.w),
                  AppText(text: "Start New Chat", fontWeight: FontWeight.w600, color: primaryColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSection(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, bottom: 8.h, top: 10.h),
      child: AppText(
        text: title,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade500,
      ),
    );
  }

  Widget _buildHistoryItem(BuildContext context, String title, String time) {
    return Container(
      margin: EdgeInsets.only(bottom: 4.h),
      child: ListTile(
        onTap: () {
          // TODO: Load chat logic
          context.read<ChatbotBloc>().add(LoadConversation(''));
          Navigator.pop(context);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        hoverColor: Colors.grey.shade100,
        leading: Icon(Icons.chat_bubble_outline_rounded, size: 20.sp, color: Colors.blueGrey),
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        subtitle: AppText(text: time, fontSize: 11.sp, color: Colors.grey),
        trailing: Icon(Icons.chevron_right, size: 16.sp, color: Colors.grey.shade300),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: () {
                    // TODO: Clear history logic
                  },
                  icon: const Icon(Icons.delete_sweep_outlined, color: Colors.redAccent),
                  label: const Text("Clear All", style: TextStyle(color: Colors.redAccent)),
                ),
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.archive_outlined, color: Colors.blueGrey),
                  label: const Text("Archive", style: TextStyle(color: Colors.blueGrey)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}