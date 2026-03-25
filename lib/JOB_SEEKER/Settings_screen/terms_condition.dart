// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/Settings_screen/setting_page.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // Responsive font sizes
    final double appBarTitleFontSize = screenWidth * 0.05;
    final double mainTitleFontSize = screenWidth * 0.055;
    final double subtitleFontSize = screenWidth * 0.035;
    final double headingFontSize = screenWidth * 0.045;
    final double bodyFontSize = screenWidth * 0.038;

    final double horizontalPadding = screenWidth * 0.05;
    final Color purpleColor = const Color(0xFF7C329B);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SettingPage()),
            );
          },
        ),
        title: Text(
          "Terms & Conditions",
          style: GoogleFonts.poppins(
            fontSize: appBarTitleFontSize,
            fontWeight: FontWeight.bold,
            color: purpleColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Welcome to True Jobs.",
                style: GoogleFonts.poppins(
                  fontSize: mainTitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "These Terms & Conditions govern your use of our job searching and posting mobile application. By downloading, installing, or using the app, you agree to comply with these terms. If you do not agree, please do not use the app.",
                style: GoogleFonts.poppins(
                  fontSize: bodyFontSize,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              _buildSectionWithBullets(
                heading: "Definitions",
                items: [
                  "App: Refers to the [App Name] mobile application.",
                  "User: Refers to both job seekers and job posters (employers or recruiters).",
                  "Job Seeker: Individuals seeking employment through the app.",
                  "Job Poster: Employers or recruiters posting job listings.",
                ],
                headingFontSize: headingFontSize,
                bodyFontSize: bodyFontSize,
              ),
              _buildSection(
                heading: "User Registration & Accounts",
                body:
                    "You must create an account to access job posting or application features. You agree to provide accurate, current, and complete information. You are responsible for maintaining the confidentiality of your account and password. The app reserves the right to suspend or terminate accounts with inaccurate or misleading information.",
                headingFontSize: headingFontSize,
                bodyFontSize: bodyFontSize,
              ),
              _buildSectionWithSubheadings(
                heading: "Services Provided",
                subheadings: {
                  "For Job Seekers:": [
                    "Browse and apply for jobs.",
                    "Save and track applications.",
                    "Communicate with job posters.",
                  ],
                  "For Job Posters:": [
                    "Create and manage job listings.",
                    "View and filter applicants.",
                    "Communicate with job seekers.",
                  ],
                },
                headingFontSize: headingFontSize,
                bodyFontSize: bodyFontSize,
              ),
              _buildSectionWithBullets(
                heading: "User Responsibilities",
                items: [
                  "Job Seekers must ensure the accuracy of their profiles and resumes.",
                  "Job Posters must provide genuine, accurate, and lawful job listings.",
                  "Users agree not to engage in fraudulent or misleading activities, including false job postings or fake applications.",
                  "Users must not use the app for spam, harassment, or illegal activities.",
                ],
                headingFontSize: headingFontSize,
                bodyFontSize: bodyFontSize,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String heading,
    required String body,
    required double headingFontSize,
    required double bodyFontSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: GoogleFonts.poppins(
            fontSize: headingFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          body,
          style: GoogleFonts.poppins(
            fontSize: bodyFontSize,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSectionWithBullets({
    required String heading,
    required List<String> items,
    required double headingFontSize,
    required double bodyFontSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: GoogleFonts.poppins(
            fontSize: headingFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "•  ",
                    style: GoogleFonts.poppins(
                      fontSize: bodyFontSize,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: GoogleFonts.poppins(
                        fontSize: bodyFontSize,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSectionWithSubheadings({
    required String heading,
    required Map<String, List<String>> subheadings,
    required double headingFontSize,
    required double bodyFontSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: GoogleFonts.poppins(
            fontSize: headingFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: subheadings.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key,
                  style: GoogleFonts.poppins(
                    fontSize: bodyFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: entry.value.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "•  ",
                            style: GoogleFonts.poppins(
                              fontSize: bodyFontSize,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item,
                              style: GoogleFonts.poppins(
                                fontSize: bodyFontSize,
                                color: Colors.black87,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 15),
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
