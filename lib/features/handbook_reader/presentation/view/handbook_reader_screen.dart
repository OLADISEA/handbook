import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/core/widgets/texts/app_text.dart';

const primaryColor = Color(0xFF6C63FF);

class HandbookReaderScreen extends StatefulWidget {
  const HandbookReaderScreen({super.key});

  @override
  State<HandbookReaderScreen> createState() => _HandbookReaderScreenState();
}

class _HandbookReaderScreenState extends State<HandbookReaderScreen> {
  String _searchQuery = "";
  final TextEditingController _searchController = TextEditingController();

  void _resetSearch() {
    setState(() {
      _searchQuery = "";
      _searchController.clear();
    });
  }

  // Comprehensive Structured Content extracted and organized from the Departmental Handbook
  final List<Map<String, dynamic>> _handbookSections = [
    {
      "category": "About the Department",
      "icon": Icons.info_outline,
      "items": [
        {
          "title": "Brief History",
          "content": "The proposal for the Department of Computer Science was written in 1973, and the Department was established in 1974. The first set of 21 Computer Science graduates finished in 1976. The Department was conceived as a means of training manpower to meet the demand for increasing computerizations in Nigeria. The Department started with two academic staff, Professor Olu Longe and Dr. J.O. Adeniyi and six non-academic staff."
        },
        {
          "title": "Vision",
          "content": "To be a foremost Department of Computer Science where facilities are excellent, curriculum is proactive and research is in the forefront in innovation."
        },
        {
          "title": "Mission",
          "content": "To expand both the theory and practice of Computer Science.\nTo produce graduates who are sound in the application of the knowledge of Information Technology to transform the community.\nTo promote the use of Information Technology to solve problems.\nTo promote more cross-disciplinary collaboration."
        },
        {
          "title": "Philosophy",
          "content": "The Department of Computer Science is set out from its early days to produce graduates that would create Information Technology Solutions to meet the needs of the Information Technology (IT) Industry. As such our programme has its vision set on peddling the creativity of Information technology tools, that is backed up with a deep and rigorous understanding of Computer Science theory as opposed to a routine and context specific creativity. Apart from solid theory being the key to good designs, a good understanding of Computer Science theory will also enhance adaptability across platforms and products. It is expected that the programme will provide the needed foundation for many of the students who will like to advance to graduate-level studies after graduation. These selected courses are intended to provide sufficient breadth and depth for immediate productivity in Computer Science and any related field."
        },
        {
          "title": "Objectives",
          "content": "To reflect continuing developments in Computer Science and related fields.\nTo provide students with a thorough understanding of fundamental concepts of Computer Science, to enable them to adapt to the dynamic nature of the discipline.\nTo expose students to current topics and techniques in Computer Science, particularly in areas whose relevance and importance are likely to increase in future."
        },
        {
          "title": "Programmes in the Department",
          "content": "The B.Sc. degree in Computer Science Programme has been in existence since 1974. Under the leadership of Professor Adenike Osofisan the Department began postgraduate programmes in the year 2000 in the Department. The first PhD graduate (Professor B. A. Oluwade) of the programme graduated in November 2004. In 2007 the first PhD graduate (Dr. A.B.C. Robert) of the University of Ibadan-University of Nancy (France) exchange completed his PhD research at the University of Nancy in France. In 2010, the first PhD graduate (Dr O.F.W. Onifade) of the double PhD agreement between the University of Ibadan and the University of Nancy successfully defended his thesis at the University of Nancy and the University of Ibadan. The Department also runs a Professional Masters named Master of Computer System (MCS). The name has since been changed to Master of Business Computing (MBC) in 2016.\n\nSummarily the following programmes are currently run in the Department:\nBachelor of Science (B.Sc.) Degree in Computer Science\nMaster of Science (M.Sc.) Degree in Computer Science\nMaster of Philosophy (MPhil.) Degree in Computer Science\nDoctor of Philosophy (PhD) Degree in Computer Science\nProfessional Master in Business Computing (MBC).\n\nThe Department is in the process of starting more programmes in the areas of Information System, Data Science and Cyber Security."
        },
        {
          "title": "Staff in the Department",
          "content": "The Department of Computer Science is endowed with seasoned academic members of staff who are specialized in diverse areas of Computing. As at September 2019, the following table shows the academic staff structure in the Department.\n\n[Note: Academic Staff, Technical Staff, and Administrative Staff lists are available in the handbook, but detailed names and roles are not fully extracted here due to brevity. Refer to the full handbook for specifics.]"
        },
      ]
    },
    {
      "category": "Student General Conducts and Discipline",
      "icon": Icons.gavel_rounded,
      "items": [
        {
          "title": "Misconducts to Refrain From",
          "content": "All students are expected to comport themselves in a good manner in the Department. Students are to refrain from the following misconducts while in the University:\nAll examination misconducts (See regulations on examinations later)\nUnruly behaviour\nIndecent behaviour\nVandalism\nMiscellaneous Hall offences\nUnauthorized use/displacement/damage to University property\nPilfering\nInsubordination\nDirect sale of bed spaces/squatting in Halls of Residence\nIllegal participation in the National Youth Service programme\nIllegal registration as full time student\nInfringements of other University regulations.\n\nIn addition, students must also refrain from the following criminal offences:\nFraud\nTheft\nBurglary\nPhysical assaults on or fighting with fellow students\nMurder\nMembership of a secret cult inside or outside the campus\nPossession of fire arms\nArson\nRape\nPossession and/or use of hard drug and drug trafficking\nOther criminal offences\n\nStudents caught with any of these offences or misconducts will be sent to the Student Disciplinary Committee without any hesitation for appropriate sanction(s)."
        },
      ]
    },
    {
      "category": "Undergraduate B.Sc. Degree Curriculum",
      "icon": Icons.menu_book_rounded,
      "items": [
        {
          "title": "Introduction",
          "content": "The ACM Computing Curricula develops the most widely used curricular models. The proposed curriculum conforms to the latest recommendations of the ACM for the Bachelors’ degree in Computer Science. It covers the spectrum of courses prescribed in the ACM 2013 recommendation. The ACM 2013 Computer Science curriculum’s body of knowledge is organised into a set of 18 Knowledge Areas (KAs), corresponding to topical areas of study in computing. While many of these Knowledge Areas are derived directly from previous curricula, some are however new and represent new areas that have grown in significance and are now integral to studies in computing. The five-year B.Sc. degree Computer Science curriculum includes all these knowledge areas."
        },
        {
          "title": "Admission Requirements",
          "content": "U.T.M.E. Entry Mode:\nAll candidates for the programme must attempt the University Tertiary Matriculation Examination in English, Mathematics, Physics and Chemistry. Candidates must also satisfy the WASCE/GCE/NECO O’ Level subjects required for the Department. These are English, Mathematics, Physics, Chemistry and one other Science subject.\n\nDirect Entry Mode:\nFor Direct Entry admission, candidates must pass two ‘A’ Level subjects including Mathematics (Pure or applied) and Physics and must satisfy the minimum O’ level requirements. Candidates with: ND or HND in Computer Science with upper credit, NCE Computer Science including Mathematics and UI Professional Diploma in Statistics who also satisfy the minimum O’ Level requirements are eligible to apply.\n\nTransfer Candidates:\nA candidate may be accepted on transfer from other Departments into the Department of Computer Science only at 200 level if he/she has satisfied the U.T.M.E. entry requirements into the programme and has not been withdrawn from the University. Such candidates must have passed MAT 111, MAT 121, two Physics Courses and one Statistics Course in 100 Level."
        },
        {
          "title": "Course Requirements",
          "content": "The full-time programme of study leading to the award of a Bachelor of Science degree in Computer Science (B.Sc. Computer Science) which is awarded with honours shall be by courses. Students will be required to take an approved combination of such courses as Senate, on the recommendation of the Faculty Board, may from time to time determine. Courses may also be audited. Audited courses are courses meant for enrichment which may be taken with the permission of the Department offering the courses but for which no credit is earned."
        },
        {
          "title": "Standard Terminologies",
          "content": "For the operation of the course system in the department, the following terminologies apply:\nCompulsory course: A course specified by the department which a student must take and pass with 45% and above.\nRequired course: A course specified by the department which a student must take but not necessarily pass. Where there is a group of such courses, the department specifies the minimum number of units to be passed.\nElective course: A course specified by the department which a student can take in order to increase the total number of his/her units.\nPre-requisite: A course which essentially must be taken prior to taking another specified course.\nConcurrent: A course which a student must take during the same semester as another specified course.\nIt is to be noted that all courses registered for would be used in computation of the final result of a student."
        },
        {
          "title": "Registration",
          "content": "Students are required to register for a prescribed minimum number of units in each academic year. The number of such units shall be approved by Senate on the recommendation of the Faculty Board. Students are expected to complete their studies within the period prescribed by the Faculty. After registration, students can add or delete courses provided this is done within six weeks of commencement of lectures."
        },
        {
          "title": "Unit Definition",
          "content": "Courses are evaluated in terms of course units. A course unit is defined as one lecture/tutorial contact hour per week or three hours of laboratory and/or practical class per week throughout a semester or an equivalent amount of other assigned study or practical experience or any combination of these. Appropriate prerequisite and/or concurrent requirements may be prescribed for courses. A prerequisite requirement is fulfilled by completing and passing the prerequisite, except that a student who fails a course will be credited only with the grade point assigned for the purpose. Pre-requisite courses may also be waived for suitably qualified candidates by the Faculty Board on the recommendation of the Department. A concurrent requirement will be satisfied if the student has either taken the course on a previous occasion in this University or registered for the course and is offering it within the same semester."
        },
        {
          "title": "Continuous Assessment",
          "content": "Continuous assessment are conducted for the course by means of tests, quizzes, tutorials, assignments and reports or by other appropriate means which are consistent with the objectives and conduct of the course as determined by the Department. However, as approved by the Senate, marks scored through continuous assessment shall not constitute more than 40% of the full marks for the course."
        },
        {
          "title": "Examinations",
          "content": "All courses taught during each semester are examined at the end of that semester. Candidates are credited with the number of course units assigned to the course which they passed. The duration of each paper is determined by the Department based on the unit of each course. A candidate is eligible to sit for an examination he or she has duly registered for and must have had a minimum of 75% attendance in the course."
        },
        {
          "title": "Regulations on Examinations",
          "content": "Candidates must have 75% attendance in a course before being allowed to take part in the examination of the course.\nOnly candidates that have registered and submitted their course registration forms to the Department are eligible to write examinations.\nCandidates must arrive venue of examination 30 minutes before the take-off of an examination.\nCandidates must come into the examination hall with their Identity Cards.\nNo calculator, mobile phones, digital wrist-watch, earpiece inside the examination hall.\nCandidates are to bring along their pens, pencils, erasers and rulers into the examination hall as borrowing of any material will not be tolerated.\nCandidates should not bring anything that can implicate them into the examination hall (e.g. papers with pre-written answers or some jottings relating to the examination paper).\nCandidates should check their surroundings for any implicating materials immediately they get to their seats for examinations. Such materials found should be got rid of before papers are distributed.\nCandidates will no more be allowed into the examination hall 30 minutes after the take-off of an examination unless the reason given by the student is reasonable, cogent and sufficiently convincing.\nCandidates will not be allowed to stand up or go out 30 minutes to the end of an examination.\nCandidates going out to ease his/her self during examination periods will be accompanied with an appropriate invigilator.\nTalking, laughing, eating, smoking or discussion among candidates in the examination may warrant the invigilator(s) to send such candidates out of the examination hall.\nA candidate who is sick on the day of an examination should notify the Level Adviser/Examination Officer at least one hour before the examination if he/she is admitted at the University Health Centre and willing to write the paper.\nCandidates must adhere strictly to the sitting arrangement made by the invigilators.\nCandidates must write their matriculation numbers legibly with all other information, sign the answer scripts they use, write out the questions’ numbers they answer at the front cover of the scripts and submit the scripts to the invigilators at the end of the examination.\nExamination answer scripts/sheets whether used or unused should not be taken out of the examination hall by students.\nFailure to abide with these rules may lead a candidate to Student Disciplinary Committee (SDC)."
        },
        {
          "title": "Grading of Courses",
          "content": "Grading of courses is done by means of percentage marks translated into a graduated system of Grade Point as shown in Table 1.\n\nTable 1: Grade Point\nMarks | Grade | Grade Point\n70-100 | A | 4.0\n60-69 | B | 3.0\n50-59 | C | 2.0\n45-49 | D | 1.0\n0-44 | E | 0.0"
        },
        {
          "title": "Computation of Cumulative Grade Point Average (CGPA)",
          "content": "In order to obtain the Cumulative Grade Point Average (CGPA) of a student, the appropriate index (Grade Point) assigned to each range of numerical marks is multiplied by the course unit and the product is added up to give the Total Weighted Grade Point (TWGP). Then CGPA is obtained by dividing TWGP by the Total Number of Units (TNU) registered (whether pass or fail). The value of CGPA shall be expressed correct to two decimal places. An example of CGPA computation is shown in Table 2.\n\n[Note: Table 2 example is available in the handbook.]"
        },
        {
          "title": "Academic Standing",
          "content": "A student is given a written warning or be required to withdraw from the Computer Science Department and in fact from the University if he/she fails to achieve the minimum standard which Senate, on the recommendation of the Faculty Board of Science, prescribes. Other regulations stipulated in the General Regulations and Guidelines leading to First Degree are prerequisite to graduation. Students whose individual CGPA at the end of any session is equal to or greater than 3.5 shall be on the Dean’s honours list."
        },
        {
          "title": "Graduation Requirements",
          "content": "General Requirements:\nTo be eligible for a B.Sc. Degree in Computer Science, the following conditions are to be satisfied:\nA candidate must have passed all the compulsory courses and approved number of required courses by the Department.\nIn addition the candidate must have passed the minimum number of course units for the award of a degree prescribed as the minimum standard which Senate, on the recommendation of the Faculty Board of Science has approved for both UTME and Direct Entry students."
        },
        {
          "title": "Degree with Honours Classifications",
          "content": "The degree shall be awarded with honours, provided a student obtains a Cumulative Grade Point Average (CGPA) that is not less than 1.0 and satisfied other minimum honours requirements.\n\nClass of Degree:\nThe class of the degree of a student who has satisfactorily completed his or her course of studies shall be determined as shown in Table 3.\n\nTable 3: Class of Degree\nCGPA | Class of Degree\n3.50 – 4.00 | First Class Honours\n3.00 – 3.49 | Second Class Honours (Upper Division)\n2.00 – 2.99 | Second Class Honours (Lower Division)\n1.00 – 1.99 | Third Class Honours\nBelow 1.00 | Pass (Not Honours)"
        },
        {
          "title": "Course Advisers",
          "content": "The Department allocates students to course/level advisers from 100 level. The student is expected to consult with the course/level adviser before registration of courses for guidance and counseling on his/her academic performance. Normally student registration is not complete until after approval by the course/level adviser."
        },
        {
          "title": "List of Courses",
          "content": "LH/T: Lecture Hour/Tutorial\nPH: Practical Hour\nC: Compulsory\nR: Required\nE: Elective\n\n[Note: Detailed list of courses per level is available in the handbook, including minimum units to be passed at each level.]"
        },
        {
          "title": "Minimum Number of Units to be Passed at Each Level",
          "content": "[Note: Specific minimum units per level are detailed in the handbook.]"
        },
        {
          "title": "Courses and Their Descriptions",
          "content": "[Note: Detailed course descriptions are provided in the full handbook.]"
        },
      ]
    },
  ];

  List<Map<String, dynamic>> _getFilteredSections() {
    if (_searchQuery.isEmpty) return _handbookSections;

    List<Map<String, dynamic>> filtered = [];
    for (var section in _handbookSections) {
      List<Map<String, String>> filteredItems = [];
      for (var item in section['items']) {
        if (item['title'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
            item['content'].toLowerCase().contains(_searchQuery.toLowerCase())) {
          filteredItems.add(item);
        }
      }
      if (filteredItems.isNotEmpty) {
        filtered.add({
          "category": section['category'],
          "icon": section['icon'],
          "items": filteredItems,
        });
      }
    }
    return filtered;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredSections = _getFilteredSections();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFF),
      appBar: AppBar(
        title: AppText(text: 'Departmental Handbook', fontSize: 18.sp, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetSearch,
            tooltip: 'Reset Search',
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: filteredSections.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
              padding: EdgeInsets.all(16.sp),
              itemCount: filteredSections.length,
              itemBuilder: (context, index) {
                final section = filteredSections[index];
                return _buildCategoryGroup(section);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (val) => setState(() => _searchQuery = val),
        decoration: InputDecoration(
          hintText: "Search handbook topics...",
          prefixIcon: const Icon(Icons.search, color: primaryColor),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
            icon: const Icon(Icons.clear, color: primaryColor),
            onPressed: _resetSearch,
          )
              : null,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: primaryColor, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryGroup(Map<String, dynamic> section) {
    return Card(
      margin: EdgeInsets.only(bottom: 20.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      elevation: 4,
      child: ExpansionTile(
        leading: Icon(section['icon'], color: primaryColor, size: 24.sp),
        title: AppText(text: section['category'], fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black87),
        iconColor: primaryColor,
        collapsedIconColor: Colors.grey,
        childrenPadding: EdgeInsets.all(8.sp),
        children: section['items'].map<Widget>((item) => _buildChapterCard(item['title'], item['content'])).toList(),
      ),
    );
  }

  Widget _buildChapterCard(String title, String content) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      title: AppText(text: title, fontWeight: FontWeight.w600, fontSize: 14.sp),
      trailing: Icon(Icons.arrow_forward_ios, size: 14.sp, color: Colors.grey),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HandbookDetailScreen(title: title, content: content))),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off_rounded, size: 80.sp, color: Colors.grey),
          SizedBox(height: 10.h),
          AppText(text: "No results found", color: Colors.grey, fontSize: 16.sp),
          SizedBox(height: 4.h),
          AppText(text: "Try adjusting your search", color: Colors.grey, fontSize: 14.sp),
        ],
      ),
    );
  }
}

class HandbookDetailScreen extends StatelessWidget {
  final String title;
  final String content;

  const HandbookDetailScreen({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: title, fontSize: 22.sp, fontWeight: FontWeight.bold, color: primaryColor),
            SizedBox(height: 16.h),
            const Divider(color: primaryColor),
            SizedBox(height: 16.h),
            AppText(
              text: content,
              fontSize: 15.sp,
              color: Colors.black87,
              //height: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}