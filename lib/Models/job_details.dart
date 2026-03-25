import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/Apply_screens/loading.dart';
import 'package:true_jobs/Models/company_details.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({super.key, required Map<String, dynamic> job});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  final Color primaryColor = const Color(0xFF7C329B);
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutCompanyKey = GlobalKey();
  int _selectedSection = 0;

  void _scrollToAboutCompany() {
    setState(() {
      _selectedSection = 1;
    });

    final context = _aboutCompanyKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToJobDetails() {
    setState(() {
      _selectedSection = 0;
    });

    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    double textScale = screenWidth < 400
        ? 0.9
        : (screenWidth > 800 ? 1.2 : 1.0);
    double paddingScale = screenWidth < 400
        ? 0.8
        : (screenWidth > 800 ? 1.3 : 1.0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const [
          Icon(Icons.share, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.bookmark_border, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16 * paddingScale),
            child: Row(
              children: [
                CircleAvatar(
                    radius: screenWidth * 0.08,
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: AssetImage("assets/demo.png"),
                  ),
                SizedBox(width: 12 * paddingScale),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Flutter Developer",
                        style: GoogleFonts.poppins(
                          fontSize: 18 * textScale,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Smart Global Solutions",
                        style: GoogleFonts.poppins(
                          fontSize: 14 * textScale,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "Job posted on: 25/02/2025",
                        style: GoogleFonts.poppins(
                          fontSize: 12 * textScale,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _scrollToJobDetails,
                  child: Text(
                    "Job details",
                    style: GoogleFonts.poppins(
                      fontSize: 14 * textScale,
                      fontWeight: FontWeight.w600,
                      color: _selectedSection == 0
                          ? Colors.green
                          : primaryColor,
                    ),
                  ),
                ),
                SizedBox(width: 10 * paddingScale),
                TextButton(
                  onPressed: _scrollToAboutCompany,
                  child: Text(
                    "About company",
                    style: GoogleFonts.poppins(
                      fontSize: 14 * textScale,
                      fontWeight: FontWeight.w600,
                      color: _selectedSection == 1
                          ? Colors.green
                          : primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: EdgeInsets.all(16 * paddingScale),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16 * paddingScale),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12 * paddingScale),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About the Job",
                          style: GoogleFonts.poppins(
                            fontSize: 16 * textScale,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 12 * paddingScale),
                        _jobDetail(
                          Icons.monetization_on,
                          "8,000 - 10,000 monthly",
                          textScale,
                          extra: "Fixed salary",
                          extraColor: Colors.green,
                        ),
                        _jobDetail(Icons.work_history, "1-2 yr Exp", textScale),
                        _jobDetail(
                          Icons.apartment,
                          "Work from office",
                          textScale,
                        ),
                        _jobDetail(Icons.access_time, "Day shift", textScale),
                        _jobDetail(Icons.schedule, "Full time", textScale),
                        _jobDetail(Icons.school, "UG", textScale),
                        SizedBox(height: 8 * paddingScale),
                        Text(
                          "Looking For: Male & Female",
                          style: GoogleFonts.poppins(fontSize: 14 * textScale),
                        ),
                        Text(
                          "Should Speak: English (Intermediate), Tamil",
                          style: GoogleFonts.poppins(
                            fontSize: 14 * textScale,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20 * paddingScale),

                  _walkInInterview(textScale, paddingScale),
                  SizedBox(height: 20 * paddingScale),

                  _sectionTitle("Skills required", textScale),
                  SizedBox(height: 8 * paddingScale),
                  _skillsRequiredSection(textScale, paddingScale),
                  SizedBox(height: 20 * paddingScale),

                  _sectionTitle("Job description", textScale),
                  SizedBox(height: 8 * paddingScale),
                  _jobDescriptionSection(textScale, paddingScale),
                  SizedBox(height: 20 * paddingScale),

                  _sectionTitle("Benefits", textScale),
                  SizedBox(height: 8 * paddingScale),
                  _benefitsSection(textScale, paddingScale),
                  SizedBox(height: 20 * paddingScale),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Loading()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 150 * paddingScale,
                          vertical: 20 * paddingScale,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12 * paddingScale,
                          ),
                        ),
                      ),
                      child: Text(
                        "Apply Job",
                        style: GoogleFonts.poppins(
                          fontSize: 14 * textScale,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20 * paddingScale),
                  Container(
                    key: _aboutCompanyKey,
                    padding: EdgeInsets.all(16 * paddingScale),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12 * paddingScale),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "About company",
                              style: GoogleFonts.poppins(
                                fontSize: 16 * textScale,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            IconButton(onPressed: (){
                            
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SeekerCompanyDetails()));
                            
                            }, icon: Icon(
                              Icons.open_in_full,
                              color: const Color(0xFF7C329B),
                              size: isTablet ? 24 : 20,)
                            ),
                          ],
                        ),

                        SizedBox(height: 12 * paddingScale),
                        Text(
                          "Smart Global Solutions",
                          style: GoogleFonts.poppins(fontSize: 14 * textScale),
                        ),
                        SizedBox(height: 8 * paddingScale),
                        _infoRow(
                          Icons.email,
                          "smartglobalsolutions@gmail.com",
                          textScale,
                        ),
                        SizedBox(height: 6 * paddingScale),
                        _infoRow(Icons.phone, "+91 9876543210", textScale),
                        SizedBox(height: 6 * paddingScale),
                        _infoRow(
                          Icons.language,
                          "www.smartglobalsolutions.com",
                          textScale,
                        ),
                        SizedBox(height: 6 * paddingScale),
                        _infoRow(Icons.calendar_today, "Since 2017", textScale),
                        SizedBox(height: 6 * paddingScale),
                        _infoRow(
                          Icons.credit_card,
                          "GST No.: 53ADWF52H6D128",
                          textScale,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30 * paddingScale),
                  _sectionTitle("Similar jobs", textScale),
                  SizedBox(height: 10 * paddingScale),
                  _similarJobTile(
                    "UI/UX Designer",
                    "Smart Global Solutions",
                    "8,000 - 10,000 monthly",
                    "Tiruppur",
                    "Posted: 5 days ago",
                    textScale,
                    paddingScale,
                  ),
                  _similarJobTile(
                    "Flutter Developer",
                    "Smart Global Solutions",
                    "8,000 - 10,000 monthly",
                    "Tiruppur",
                    "Posted: 5 days ago",
                    textScale,
                    paddingScale,
                  ),
                  _similarJobTile(
                    "UI/UX Designer",
                    "Smart Global Solutions",
                    "8,000 - 10,000 monthly",
                    "Tiruppur",
                    "Posted: 5 days ago",
                    textScale,
                    paddingScale,
                  ),

                  SizedBox(height: 80 * paddingScale),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _walkInInterview(double textScale, double paddingScale) {
    return Container(
      padding: EdgeInsets.all(16 * paddingScale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12 * paddingScale),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Walk-In Interview",
            style: GoogleFonts.poppins(
              fontSize: 15 * textScale,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8 * paddingScale),
          Text(
            "25/02/2025 To 15/03/2025",
            style: GoogleFonts.poppins(fontSize: 14 * textScale),
          ),
          Text(
            "Timing: 10:00 AM To 04:00 PM",
            style: GoogleFonts.poppins(fontSize: 14 * textScale),
          ),
          SizedBox(height: 8 * paddingScale),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                size: 20 * textScale,
                color: Colors.black54,
              ),
              SizedBox(width: 6 * paddingScale),
              Expanded(
                child: Text(
                  "9th Street, Sri Krishna Nagar, Tiruppur, Tamil Nadu 641 103",
                  style: GoogleFonts.poppins(fontSize: 14 * textScale),
                ),
              ),
            ],
          ),
          SizedBox(height: 12 * paddingScale),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10 * paddingScale),
                ),
              ),
              child: Text(
                "Show on map",
                style: GoogleFonts.poppins(
                  fontSize: 14 * textScale,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, double textScale) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 16 * textScale,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _skillsRequiredSection(double textScale, double paddingScale) {
    return Container(
      padding: EdgeInsets.all(16 * paddingScale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12 * paddingScale),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _skillItem("Flutter & Dart", true, textScale, paddingScale),
          _skillItem("API Integration", true, textScale, paddingScale),
          _skillItem("Version Control", true, textScale, paddingScale),
          _skillItem("Debugging & Testing", true, textScale, paddingScale),
          _skillItem("Database Management", true, textScale, paddingScale),
          _skillItem(
            "Cross-Platform Development",
            true,
            textScale,
            paddingScale,
          ),
        ],
      ),
    );
  }

  Widget _skillItem(
      String skill,
      bool hasSkill,
      double textScale,
      double paddingScale,
      ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6 * paddingScale),
      child: Row(
        children: [
          Icon(
            hasSkill ? Icons.check_circle : Icons.circle_outlined,
            color: hasSkill ? Colors.green : Colors.grey,
            size: 18 * textScale,
          ),
          SizedBox(width: 8 * paddingScale),
          Text(skill, style: GoogleFonts.poppins(fontSize: 14 * textScale)),
        ],
      ),
    );
  }

  Widget _jobDescriptionSection(double textScale, double paddingScale) {
    return Container(
      padding: EdgeInsets.all(16 * paddingScale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12 * paddingScale),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "We are seeking a skilled Flutter Developer to play an alternative, scalable, and energy-efficient mobile application. The ideal candidate should be to a strong understanding of flutter, Dart, and mobile app development practices.",
            style: GoogleFonts.poppins(fontSize: 14 * textScale, height: 1.5),
          ),
          SizedBox(height: 12 * paddingScale),
          Text(
            "Responsibilities:",
            style: GoogleFonts.poppins(
              fontSize: 14 * textScale,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6 * paddingScale),
          _bulletItem(
            "Develop and maintain cross-platform mobile applications using Flutter",
            textScale,
          ),
          _bulletItem("Write clean, efficient, and reusable code", textScale),
          _bulletItem(
            "Implement responsive UIs and ensure smooth performance on both Android and iOS",
            textScale,
          ),
          _bulletItem(
            "Integrate RESTful APIs, third-party services, and libraries",
            textScale,
          ),
          _bulletItem(
            "Use state management tools (Provider, BLoC, Riverpod, or GetX)",
            textScale,
          ),
          _bulletItem(
            "Collaborate with designers and backend developers to enhance functionality",
            textScale,
          ),
          _bulletItem(
            "Debug and optimize applications for performance and stability",
            textScale,
          ),
        ],
      ),
    );
  }

  Widget _bulletItem(String text, double textScale) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 16 * textScale)),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(fontSize: 14 * textScale),
            ),
          ),
        ],
      ),
    );
  }

  Widget _benefitsSection(double textScale, double paddingScale) {
    return Container(
      padding: EdgeInsets.all(16 * paddingScale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12 * paddingScale),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _benefitItem(
            "1. High Demand: Flutter developers are highly sought after",
            textScale,
            paddingScale,
          ),
          _benefitItem(
            "2. Cross Platform: Build iOS & Android apps with single codebase",
            textScale,
            paddingScale,
          ),
          _benefitItem(
            "3. Competitive Salary: Attractive packages from IT industry",
            textScale,
            paddingScale,
          ),
          _benefitItem(
            "4. Creative Freedom: Design dynamic UI and custom widgets",
            textScale,
            paddingScale,
          ),
          _benefitItem(
            "5. Work Flexibility: Remote/hybrid options available",
            textScale,
            paddingScale,
          ),
          _benefitItem(
            "6. Future-Proof: Growing demand ensures career stability",
            textScale,
            paddingScale,
          ),
          SizedBox(height: 12 * paddingScale),
          Text(
            "Your role will ensure business is delivered to real-time employees and the customer needs of our clients are met. We plan to improve this standard for a long range.",
            style: GoogleFonts.poppins(
              fontSize: 14 * textScale,
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _benefitItem(String text, double textScale, double paddingScale) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6 * paddingScale),
      child: Text(text, style: GoogleFonts.poppins(fontSize: 14 * textScale)),
    );
  }

  Widget _similarJobTile(
      String title,
      String company,
      String salary,
      String location,
      String posted,
      double textScale,
      double paddingScale,
      ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6 * paddingScale),
      padding: EdgeInsets.all(12 * paddingScale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12 * paddingScale),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22 * paddingScale,
            backgroundColor: Colors.grey[200],
            child: Icon(
              Icons.work,
              size: 24 * textScale,
              color: Colors.black54,
            ),
          ),
          SizedBox(width: 12 * paddingScale),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 15 * textScale,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  company,
                  style: GoogleFonts.poppins(
                    fontSize: 13 * textScale,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 4 * paddingScale),
                Row(
                  children: [
                    Icon(
                      Icons.monetization_on,
                      size: 16 * textScale,
                      color: Colors.purple,
                    ),
                    SizedBox(width: 4 * paddingScale),
                    Text(
                      salary,
                      style: GoogleFonts.poppins(
                        fontSize: 13 * textScale,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16 * textScale,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 4 * paddingScale),
                    Text(
                      location,
                      style: GoogleFonts.poppins(
                        fontSize: 13 * textScale,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Text(
                  posted,
                  style: GoogleFonts.poppins(
                    fontSize: 12 * textScale,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _jobDetail(
      IconData icon,
      String text,
      double textScale, {
        String? extra,
        Color? extraColor,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20 * textScale, color: Colors.black54),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(fontSize: 14 * textScale),
            ),
          ),
          if (extra != null)
            Text(
              extra,
              style: GoogleFonts.poppins(
                fontSize: 12 * textScale,
                color: extraColor ?? Colors.black,
              ),
            ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text, double textScale) {
    return Row(
      children: [
        Icon(icon, size: 18 * textScale, color: Colors.black54),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(fontSize: 14 * textScale),
          ),
        ),
      ],
    );
  }
}