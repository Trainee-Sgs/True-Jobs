import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CandidateProfile1 extends StatefulWidget {
  const CandidateProfile1({super.key});

  @override
  State<CandidateProfile1> createState() => _CandidateProfile1State();
}

class _CandidateProfile1State extends State<CandidateProfile1> {
  static const Color primaryColor = Color(0xFF7C329B);
  static const Color greenColor = Color(0xFF20A455);
  static const Color mutedColor = Color(0xFF707070);
  static const Color lightBorder = Color(0xFFE1E1E1);

  bool showAbout = true;
  bool _isEditingNote = false;
  final TextEditingController _noteController = TextEditingController();
  final FocusNode _noteFocusNode = FocusNode();

  @override
  void dispose() {
    _noteController.dispose();
    _noteFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final horizontalPadding = width * 0.055;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: height * 0.084,
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Saved Profile',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.028),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Avail:',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                  Text(
                    '9 credits',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          height: height * 0.074,
          color: primaryColor,
          child: TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
              size: width * 0.045,
            ),
            label: Text(
              'Chat With Applicant',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.014),
              _buildHeader(width, height),
              SizedBox(height: height * 0.012),
              _buildTabs(width, height),
              SizedBox(height: height * 0.0035),
              Container(height: 1, color: lightBorder),
              SizedBox(height: height * 0.012),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      showAbout
                          ? _buildAboutContent(width: width, height: height)
                          : _buildQualificationContent(width: width, height: height),
                      SizedBox(height: height * 0.03),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double width, double height) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width * 0.134,
          height: width * 0.134,
          decoration: BoxDecoration(
            color: const Color(0xFFF1E1B5),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFD7C28C)),
          ),
          alignment: Alignment.center,
          child: Text(
            'M',
            style: GoogleFonts.poppins(
              color: const Color(0xFF8A542C),
              fontWeight: FontWeight.w700,
              fontSize: width * 0.056,
              height: 1,
            ),
          ),
        ),
        SizedBox(width: width * 0.028),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Marvin McKinney',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  height: 1,
                ),
              ),
              SizedBox(height: height * 0.0025),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: width * 0.034,
                    color: mutedColor,
                  ),
                  SizedBox(width: width * 0.007),
                  Text(
                    'Coimbatore',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: mutedColor,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabs(double width, double height) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildTab(
          label: 'About me',
          selected: showAbout,
          width: width,
          underlineWidth: width * 0.145,
          onTap: () {
            setState(() {
              showAbout = true;
            });
          },
        ),
        SizedBox(width: width * 0.10),
        _buildTab(
          label: 'Qualifications',
          selected: !showAbout,
          width: width,
          underlineWidth: width * 0.215,
          onTap: () {
            setState(() {
              showAbout = false;
            });
          },
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(bottom: height * 0.004),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                Icon(
                  Icons.download_outlined,
                  color: primaryColor,
                  size: width * 0.038,
                ),
                SizedBox(width: width * 0.01),
                Text(
                  'Resume',
                  style: GoogleFonts.poppins(
                    color: primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTab({
    required String label,
    required bool selected,
    required double width,
    required double underlineWidth,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: selected ? greenColor : Colors.black54,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
          SizedBox(height: width * 0.012),
          Container(
            width: underlineWidth,
            height: 2.4,
            color: selected ? greenColor : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildAboutContent({
    required double width,
    required double height,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.016,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F2F9),
            borderRadius: BorderRadius.circular(width * 0.03),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.022,
                  vertical: height * 0.004,
                ),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(width * 0.02),
                ),
                child: Text(
                  'Job',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ),
              SizedBox(width: width * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: mutedColor,
                          height: 1,
                        ),
                        children: const [
                          TextSpan(text: 'Applied for: '),
                          TextSpan(
                            text: 'Flutter Developer',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.003),
                    Text(
                      'Applied on: 03/02/2025',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: mutedColor,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.018),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(
            width * 0.045,
            height * 0.014,
            width * 0.045,
            height * 0.012,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.03),
            border: Border.all(color: lightBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Note',
                style: GoogleFonts.poppins(
                  color: greenColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              SizedBox(height: height * 0.006),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isEditingNote = true;
                  });
                  _noteFocusNode.requestFocus();
                },
                child: AbsorbPointer(
                  absorbing: !_isEditingNote,
                  child: TextField(
                    controller: _noteController,
                    focusNode: _noteFocusNode,
                    minLines: 2,
                    maxLines: 3,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText:
                          'Leave a note (e.g. "Reviewed by Priya - shortlisted")',
                      hintStyle: GoogleFonts.poppins(
                        color: const Color(0xFF9B9B9B),
                        fontSize: 14,
                        height: 1,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
              if (_isEditingNote) ...[
                SizedBox(height: height * 0.008),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: height * 0.031,
                      child: OutlinedButton(
                        onPressed: () {
                          _noteController.clear();
                          _noteFocusNode.unfocus();
                          setState(() {
                            _isEditingNote = false;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.grey.shade300),
                          padding: EdgeInsets.symmetric(horizontal: width * 0.032),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.02),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.018),
                    SizedBox(
                      height: height * 0.031,
                      child: ElevatedButton(
                        onPressed: () {
                          _noteFocusNode.unfocus();
                          setState(() {
                            _isEditingNote = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(horizontal: width * 0.032),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.02),
                          ),
                        ),
                        child: Text(
                          'Submit',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
        SizedBox(height: height * 0.022),
        Text(
          'Personal Details',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            height: 1,
          ),
        ),
        SizedBox(height: height * 0.012),
        _buildSectionCard(
          width: width,
          height: height,
          children: [
            _detailRow(Icons.person_outline, 'Male, 25 yr', width),
            _detailRow(Icons.mail_outline, 'samples24@gmail.com', width),
            _detailRow(Icons.phone_android_outlined, '+91 9876543210', width),
            _detailRow(
              Icons.location_on_outlined,
              'Coimbatore, Tamil Nadu - 641103',
              width,
            ),
            _detailRow(Icons.access_time_outlined, '2 Yrs 5 Mos', width),
          ],
        ),
        SizedBox(height: height * 0.02),
        Text(
          'Job Preference',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            height: 1,
          ),
        ),
        SizedBox(height: height * 0.012),
        _buildSectionCard(
          width: width,
          height: height,
          children: [
            _preferenceBlock(
              title: 'Preferred job role',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _checkItem('Flutter Developer', width),
                  _checkItem('Android developer', width),
                  _checkItem('IOS developer', width),
                ],
              ),
              width: width,
              height: height,
            ),
            _preferenceBlock(
              title: 'Preferred Shift',
              child: Text(
                'Day & Night',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1,
                ),
              ),
              width: width,
              height: height,
            ),
            _preferenceBlock(
              title: 'Work Mode',
              child: Text(
                'In-Office | Hybrid | Field Work',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1,
                ),
              ),
              width: width,
              height: height,
            ),
            _preferenceBlock(
              title: 'Job Type',
              child: Text(
                'Full Time | Internship',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1,
                ),
              ),
              width: width,
              height: height,
            ),
            _preferenceBlock(
              title: 'Salary Expectation',
              child: Row(
                children: [
                  Icon(
                    Icons.currency_rupee,
                    size: width * 0.034,
                    color: primaryColor,
                  ),
                  Text(
                    '25,000',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1,
                    ),
                  ),
                  SizedBox(width: width * 0.01),
                  Text(
                    '/month',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: mutedColor,
                      height: 1,
                    ),
                  ),
                ],
              ),
              width: width,
              height: height,
            ),
            _preferenceBlock(
              title: 'Ql. Willing to Relocate',
              child: Text(
                'Anywhere in India',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1,
                ),
              ),
              width: width,
              height: height,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQualificationContent({
    required double width,
    required double height,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Qualification',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            height: 1,
          ),
        ),
        SizedBox(height: height * 0.012),
        _buildSectionCard(
          width: width,
          height: height,
          children: [
            _preferenceBlock(
              title: 'Education',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Highest Qualification: UG',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: height * 0.016),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.002),
                        child: Icon(
                          Icons.school_outlined,
                          size: width * 0.042,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(width: width * 0.022),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'B.E. Artificial Intelligence\nEngineering',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                height: 1.1,
                              ),
                            ),
                            SizedBox(height: height * 0.008),
                            Text(
                              'Batch: 2018',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: mutedColor,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              width: width,
              height: height,
            ),
          ],
        ),
        SizedBox(height: height * 0.016),
        _buildSectionCard(
          width: width,
          height: height,
          children: [
            _preferenceBlock(
              title: 'Skills',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _checkItem('Flutter Developer', width),
                  _checkItem('Android developer', width),
                  _checkItem('IOS developer', width),
                  _checkItem('Debugging & Testing', width),
                  _checkItem('Database Knowledge', width),
                  _checkItem('Cross-Platform Development', width),
                ],
              ),
              width: width,
              height: height,
            ),
          ],
        ),
        SizedBox(height: height * 0.016),
        _buildSectionCard(
          width: width,
          height: height,
          children: [
            _preferenceBlock(
              title: 'Certifications',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\u2022  IOS Development',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: height * 0.006),
                  Text(
                    '   Never expires',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: mutedColor,
                      height: 1,
                    ),
                  ),
                ],
              ),
              width: width,
              height: height,
            ),
          ],
        ),
        SizedBox(height: height * 0.016),
        _buildSectionCard(
          width: width,
          height: height,
          children: [
            _preferenceBlock(
              title: 'Previous Job Details',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _jobHistoryItem(
                    title: 'Snr. Flutter Developer',
                    subtitle: '1 Yr Exp & ABC 55 company',
                    location: 'Coimbatore',
                    tag: '2024-2025',
                    width: width,
                    height: height,
                  ),
                  SizedBox(height: height * 0.012),
                  _jobHistoryItem(
                    title: 'Jr. Flutter Developer',
                    subtitle: '2 Yr Exp @ ABC 56 company',
                    location: 'Coimbatore',
                    tag: '2022-2024',
                    width: width,
                    height: height,
                  ),
                ],
              ),
              width: width,
              height: height,
            ),
          ],
        ),
        SizedBox(height: height * 0.016),
        _buildSectionCard(
          width: width,
          height: height,
          children: [
            _preferenceBlock(
              title: 'Language Proficiency',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1,
                      ),
                      children: const [
                        TextSpan(text: 'English '),
                        TextSpan(
                          text: '(Advanced)',
                          style: TextStyle(color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.004),
                  Text(
                    'Tamil',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1,
                    ),
                  ),
                ],
              ),
              width: width,
              height: height,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionCard({
    required double width,
    required double height,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.045,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(width * 0.03),
        border: Border.all(color: lightBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _detailRow(IconData icon, String value, double width) {
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.028),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: width * 0.036, color: const Color(0xFF4A4A4A)),
          SizedBox(width: width * 0.024),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black87,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _preferenceBlock({
    required String title,
    required Widget child,
    required double width,
    required double height,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: primaryColor,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
          SizedBox(height: height * 0.004),
          child,
        ],
      ),
    );
  }

  Widget _jobHistoryItem({
    required String title,
    required String subtitle,
    required String location,
    required String tag,
    required double width,
    required double height,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: width * 0.012,
              height: width * 0.012,
              decoration: const BoxDecoration(
                color: Color(0xFFB3B3B3),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 1.1,
              height: height * 0.07,
              color: const Color(0xFFD5D5D5),
            ),
          ],
        ),
        SizedBox(width: width * 0.026),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              SizedBox(height: height * 0.004),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: primaryColor,
                  height: 1,
                ),
              ),
              SizedBox(height: height * 0.002),
              Text(
                location,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.025,
            vertical: height * 0.004,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(width * 0.03),
          ),
          child: Text(
            tag,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xFF6A6A6A),
              height: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _checkItem(String text, double width) {
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.01),
      child: Row(
        children: [
          Icon(
            Icons.check,
            size: width * 0.032,
            color: const Color(0xFF454545),
          ),
          SizedBox(width: width * 0.02),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black87,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
