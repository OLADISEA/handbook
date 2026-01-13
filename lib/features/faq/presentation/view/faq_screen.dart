import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/core/widgets/texts/app_text.dart';

const primaryColor = Color(0xFF6C63FF);

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> with SingleTickerProviderStateMixin {
  String _searchQuery = "";
  String _selectedCategory = "All";
  late AnimationController _animationController;

  final List<String> _categories = const ["All", "Admission", "Academics", "Exams", "Conduct"];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  // Comprehensive FAQ list based on actual Handbook content
  final List<Map<String, String>> _allFaqs = const [
    {
      "q": "How long is the course registration window?",
      "a": "Students can add or delete courses within six weeks of the commencement of lectures[cite: 472].",
      "cat": "Admission"
    },
    {
      "q": "Can I transfer from another department?",
      "a": "Yes, transfer is possible only at 200 level if you meet UTME requirements and have passed MAT 111, MAT 121, Physics, and Statistics at 100 level.",
      "cat": "Admission"
    },
    {
      "q": "What is the pass mark for compulsory courses?",
      "a": "A student must take and pass compulsory departmental courses with a minimum mark of 45%.",
      "cat": "Academics"
    },
    {
      "q": "What qualifies a student for the Dean's Honours List?",
      "a": "Students whose individual CGPA at the end of any session is 3.5 or greater are placed on the Dean’s honours list.",
      "cat": "Academics"
    },
    {
      "q": "How is the CGPA calculated?",
      "a": "CGPA is obtained by dividing the Total Weighted Grade Point (TWGP) by the Total Number of Units (TNU) registered, whether passed or failed[cite: 512].",
      "cat": "Academics"
    },
    {
      "q": "What are the CGPA ranges for each Class of Degree?",
      "a": "First Class: 3.5-4.00; 2.1: 3.0-3.49; 2.2: 2.0-2.99; Third Class: 1.0-1.99; Fail: <1.0[cite: 530].",
      "cat": "Academics"
    },
    {
      "q": "What is the minimum attendance to write an exam?",
      "a": "A candidate must have a minimum of 75% attendance in a course to be eligible to sit for its examination[cite: 486, 488].",
      "cat": "Exams"
    },
    {
      "q": "What is the rule for late arrival to an exam?",
      "a": "Candidates must arrive 30 minutes before the exam[cite: 490]. You will not be allowed entry 30 minutes after the exam has started.",
      "cat": "Exams"
    },
    {
      "q": "What items are forbidden in the examination hall?",
      "a": "Calculators, mobile phones, digital wrist-watches, and ear pieces are strictly prohibited[cite: 492].",
      "cat": "Exams"
    },
    {
      "q": "What constitutes student misconduct?",
      "a": "Misconduct includes exam malpractice, vandalism, pilfering, insubordination, and unauthorized displacement of University property[cite: 410, 413, 416, 417].",
      "cat": "Conduct"
    }
  ];

  List<Map<String, String>> _getFilteredFaqs() {
    return _allFaqs.where((faq) {
      final matchesSearch = faq['q']!.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCat = _selectedCategory == "All" || faq['cat'] == _selectedCategory;
      return matchesSearch && matchesCat;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredFaqs = _getFilteredFaqs();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(child: _buildHeaderSection()),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            sliver: filteredFaqs.isEmpty
                ? SliverFillRemaining(child: _buildEmptyState())
                : SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => _buildFaqCard(filteredFaqs[index]),
                childCount: filteredFaqs.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 120.h,
      floating: false,
      pinned: true,
      backgroundColor: primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        title: AppText(text: 'Help & FAQs', color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
        centerTitle: true,
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryColor, Color(0xFF3F3D56)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.r)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        children: [
          _buildSearchBar(),
          SizedBox(height: 16.h),
          _buildCategoryFilter(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onChanged: (val) => setState(() => _searchQuery = val),
      decoration: InputDecoration(
        hintText: "How can we help you today?",
        prefixIcon: const Icon(Icons.search_rounded, color: primaryColor),
        filled: true,
        fillColor: const Color(0xFFF1F4FF),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final cat = _categories[index];
          final isSelected = _selectedCategory == cat;
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: GestureDetector(
              onTap: () => setState(() => _selectedCategory = cat),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: isSelected ? primaryColor : Colors.grey.shade300),
                ),
                child: AppText(
                  text: cat,
                  color: isSelected ? Colors.white : Colors.grey.shade700,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFaqCard(Map<String, String> faq) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        childrenPadding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
        iconColor: primaryColor,
        title: AppText(text: faq['q']!, fontWeight: FontWeight.w600, fontSize: 15.sp),
        subtitle: AppText(text: faq['cat']!, color: primaryColor.withOpacity(0.6), fontSize: 12.sp),
        children: [
          const Divider(height: 1),
          SizedBox(height: 12.h),
          AppText(
              text: faq['a']!, color: Colors.black87, fontSize: 14.sp, ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.help_outline_rounded, size: 80.sp, color: Colors.grey.shade300),
          SizedBox(height: 16.h),
          AppText(text: "No matches found", color: Colors.grey, fontSize: 16.sp),
          AppText(text: "Try different keywords", color: Colors.grey.shade400, fontSize: 14.sp),
        ],
      ),
    );
  }
}