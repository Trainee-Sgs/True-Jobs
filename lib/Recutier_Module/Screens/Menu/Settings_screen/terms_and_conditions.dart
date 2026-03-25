import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  static const Color primaryColor = Color(0xFF7C329B);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: screenHeight * 0.065,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: screenWidth * 0.052,
          ),
        ),
        titleSpacing: 0,
        title: Text(
          'Terms & Conditions',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to True Jobs.',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF4F4F4F),
                height: 1.2,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'These Terms & Conditions govern your use of our job searching and posting mobile application. By downloading, installing, or using the app, you agree to comply with these terms. If you do not agree, please do not use the app.',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF4F4F4F),
                height: 1.35,
              ),
            ),
            SizedBox(height: screenHeight * 0.024),
            Text(
              'Definitions',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4F4F4F),
                height: 1,
              ),
            ),
            SizedBox(height: screenHeight * 0.012),
            _buildBulletText(
              screenWidth,
              'App: Refers to the [App Name] mobile application.',
            ),
            _buildBulletText(
              screenWidth,
              'User: Refers to both job seekers and job posters (employers or recruiters).',
            ),
            _buildBulletText(
              screenWidth,
              'Job Seeker: Individuals seeking employment through the app.',
            ),
            _buildBulletText(
              screenWidth,
              'Job Poster: Employers or recruiters posting job listings.',
            ),
            SizedBox(height: screenHeight * 0.024),
            Text(
              'User Registration & Accounts',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4F4F4F),
                height: 1,
              ),
            ),
            SizedBox(height: screenHeight * 0.012),
            _buildBulletText(
              screenWidth,
              'You must create an account to access job posting or application features.',
            ),
            _buildBulletText(
              screenWidth,
              'You agree to provide accurate, current, and complete information.',
            ),
            _buildBulletText(
              screenWidth,
              'You are responsible for maintaining the confidentiality of your account and password.',
            ),
            _buildBulletText(
              screenWidth,
              'The app reserves the right to suspend or terminate accounts with inaccurate or misleading information.',
            ),
            SizedBox(height: screenHeight * 0.024),
            Text(
              'Services Provided',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4F4F4F),
                height: 1,
              ),
            ),
            SizedBox(height: screenHeight * 0.012),
            _buildBulletText(
              screenWidth,
              'For Job Seekers:',
            ),
            _buildIndentedBulletText(
              screenWidth,
              'Browse and apply for jobs.',
            ),
            _buildIndentedBulletText(
              screenWidth,
              'Save and track applications.',
            ),
            _buildIndentedBulletText(
              screenWidth,
              'Communicate with job posters.',
            ),
            _buildBulletText(
              screenWidth,
              'For Job Posters:',
            ),
            _buildIndentedBulletText(
              screenWidth,
              'Create and manage job listings.',
            ),
            _buildIndentedBulletText(
              screenWidth,
              'View and filter applicants.',
            ),
            _buildIndentedBulletText(
              screenWidth,
              'Communicate with job seekers.',
            ),
            SizedBox(height: screenHeight * 0.024),
            Text(
              'User Responsibilities',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4F4F4F),
                height: 1,
              ),
            ),
            SizedBox(height: screenHeight * 0.012),
            _buildBulletText(
              screenWidth,
              'Job Seekers must ensure the accuracy of their profiles and resumes.',
            ),
            _buildBulletText(
              screenWidth,
              'Job Posters must provide genuine, accurate, and lawful job listings.',
            ),
            _buildBulletText(
              screenWidth,
              'Users agree not to engage in fraudulent or misleading activities, including false job postings or fake applications.',
            ),
            _buildBulletText(
              screenWidth,
              'Users must not use the app for spam, harassment, or illegal activities.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletText(double screenWidth, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 6, right: 10),
            child: Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Color(0xFF4F4F4F),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF4F4F4F),
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndentedBulletText(double screenWidth, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 7, right: 10),
            child: Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Color(0xFF4F4F4F),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF4F4F4F),
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
