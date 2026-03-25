// ignore_for_file: unused_element_parameter
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker
import 'package:true_jobs/JOB_SEEKER/Chat_screens/chatpage.dart';
import 'package:true_jobs/JOB_SEEKER/Home_screens/home.dart'; // Import Home for navigation
import 'package:true_jobs/JOB_SEEKER/Job_screens/saved_job.dart';
import 'package:true_jobs/JOB_SEEKER/Settings_screen/setting_page.dart';
import 'package:true_jobs/JOB_SEEKER/payment_screen/pricing_plans.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/job_preference.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/Qualification/qualification.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/personal_details.dart'; // Import Chatpage for navigation

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage; // To store the selected image file
  final ImagePicker _picker = ImagePicker(); // Image picker instance
  final Color purpleColor = const Color(0xFF7C329B);

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Responsive font sizes
    final double appBarTitleFontSize = screenWidth * 0.05;
    final double nameFontSize = screenWidth * 0.055;
    final double emailPhoneFontSize = screenWidth * 0.038;
    final double chipFontSize = screenWidth * 0.032;
    final double cardTitleFontSize = screenWidth * 0.0318;
    final double cardValueFontSize = screenWidth * 0.08;
    final double sectionHeaderFontSize = screenWidth * 0.045;
    final double subSectionFontSize = screenWidth * 0.035;
    final double resumeFileNameFontSize = screenWidth * 0.035;
    final double socialLinkFontSize = screenWidth * 0.035;
    final double navIconFontSize = screenWidth * 0.03;

    // Responsive spacing
    final double verticalSpacingSmall = screenHeight * 0.01;
    final double verticalSpacingMedium = screenHeight * 0.02;
    final double horizontalPadding = screenWidth * 0.04;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: purpleColor,
        elevation: 0,
        automaticallyImplyLeading: false, // No back button on app bar
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            fontSize: appBarTitleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push (
                context,
                MaterialPageRoute(builder: (context) => const SettingPage()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalSpacingMedium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture and Name Section
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.15, // Responsive avatar size
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!) as ImageProvider<Object>?
                        : const AssetImage(
                            'assets/contact.png',
                          ), // Default image asset
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: _pickImage, // Call image picker on tap
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: purpleColor, width: 1.5),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: purpleColor,
                          size: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: verticalSpacingMedium),
              Text(
                "Balahariharan B",
                style: GoogleFonts.poppins(
                  fontSize: nameFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: verticalSpacingSmall),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "samples24@gmail.com",
                    style: GoogleFonts.poppins(
                      fontSize: emailPhoneFontSize,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  GestureDetector(
                    onTap: () {
                      Navigator.push (
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PersonalDetails(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: screenWidth * 0.03,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Text(
                "9876543210",
                style: GoogleFonts.poppins(
                  fontSize: emailPhoneFontSize,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: verticalSpacingMedium * 2),

              // Status Chips
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push (
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PricingPlansScreen(),
                        ),
                      );
                    },
                    child: _StatusChip(
                      label: "No Plan Activated",
                      selected: false,
                      purpleColor: purpleColor,
                      fontSize: chipFontSize,
                    ),
                  ),
                  SizedBox(width: horizontalPadding / 2),
                  _StatusChip(
                    label: "Actively job hunting",
                    selected: true,
                    purpleColor: purpleColor,
                    fontSize: chipFontSize,
                  ),
                ],
              ),
              SizedBox(height: verticalSpacingMedium * 2),

              // Profile Completion and Visibility Cards
              Row(
                children: [
                  Expanded(
                    child: _InfoCard(
                      title: "Profile Completion",
                      value: "85 %",
                      subtitle: "   \n  ",
                      icon: Icons.check_circle_outline,
                      cardTitleFontSize: cardTitleFontSize,
                      cardValueFontSize: cardValueFontSize,
                      purpleColor: purpleColor,
                    ),
                  ),
                  SizedBox(width: horizontalPadding),
                  Expanded(
                    child: _InfoCard(
                      title: "Visibility in search",
                      value: "26",
                      subtitle: "Recruiters\nnoticed you",
                      icon: Icons.person_search_outlined,
                      cardTitleFontSize: cardTitleFontSize,
                      cardValueFontSize: cardValueFontSize,
                      purpleColor: purpleColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: verticalSpacingMedium * 2),

              // Qualifications
              GestureDetector(
                onTap: () {
                  Navigator.push (
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Qualification(),
                    ),
                  );
                },
                child: _ProfileSection(
                  title: "Qualifications",
                  subtitle: "Your Skills & Achievements",
                  showArrow: true,
                  sectionHeaderFontSize: sectionHeaderFontSize,
                  subSectionFontSize: subSectionFontSize,
                  purpleColor: purpleColor,
                ),
              ),
              SizedBox(height: verticalSpacingMedium),

              // Job preferences
              GestureDetector(
                onTap: () {
                  Navigator.push (
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JobPreference(),
                    ),
                  );
                },

                child: _ProfileSection(
                  title: "Job preferences",
                  subtitle: "Tailor your job search",
                  showArrow: true,
                  sectionHeaderFontSize: sectionHeaderFontSize,
                  subSectionFontSize: subSectionFontSize,
                  purpleColor: purpleColor,
                ),
              ),
              SizedBox(height: verticalSpacingMedium),

              // Resume
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Resume",
                  style: GoogleFonts.poppins(
                    fontSize: sectionHeaderFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "pdf, docx, jpg or png only\n(10 MB maximum file size)",
                  style: GoogleFonts.poppins(
                    fontSize: subSectionFontSize,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              SizedBox(height: verticalSpacingSmall),
              _ResumeUploadCard(
                fileName: "RK new resume",
                fileSize: "1.2 MB",
                resumeFileNameFontSize: resumeFileNameFontSize,
                purpleColor: purpleColor,
              ),
              SizedBox(height: verticalSpacingMedium),

              // Social links
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Social links",
                  style: GoogleFonts.poppins(
                    fontSize: sectionHeaderFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: verticalSpacingSmall),
              _SocialLinkCard(
                label: "LinkedIn",
                hint: "(optional)",
                link: "https://linked-in/adclsamples5_2025",
                socialLinkFontSize: socialLinkFontSize,
                purpleColor: purpleColor,
              ),
              SizedBox(height: verticalSpacingSmall),
              _SocialLinkCard(
                label: "Portfolio",
                hint: "(optional)\n(For Tech/Design Roles)",
                link: "https://portfolio/adclsamples5_12",
                socialLinkFontSize: socialLinkFontSize,
                purpleColor: purpleColor,
              ),
              SizedBox(
                height: verticalSpacingMedium * 3,
              ), // Extra space above bottom nav
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.25))),
          color: Colors.white,
        ),
        height: screenHeight * 0.08, // Responsive height for bottom nav
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push (
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              child: _NavIcon(
                icon: Icons.home,
                label: "Home",
                selected: false,
                fontSize: navIconFontSize,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push (
                  context,
                  MaterialPageRoute(builder: (context) => const SavedJob(savedJobs: [], allJobs: [],)),
                );
              },
              child: _NavIcon(
                icon: Icons.work_outline,
                label: "Jobs",
                selected: false,
                fontSize: navIconFontSize,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push (
                  context,
                  MaterialPageRoute(builder: (context) => const Chatpage()),
                );
              },
              child: _NavIcon(
                icon: Icons.chat_outlined,
                label: "Chats",
                selected: false,
                fontSize: navIconFontSize,
              ),
            ),
            _NavIcon(
              icon: Icons.person_outline,
              label: "Profile",
              selected: true,
              fontSize: navIconFontSize,
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for status chips (e.g., "No Plan Activated")
class _StatusChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Color purpleColor;
  final double fontSize;

  const _StatusChip({
    required this.label,
    required this.selected,
    required this.purpleColor,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? purpleColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected ? purpleColor : Colors.grey.shade400,
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// Custom widget for information cards (e.g., Profile Completion)
class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData icon;
  final double cardTitleFontSize;
  final double cardValueFontSize;
  final Color purpleColor;

  const _InfoCard({
    required this.title,
    required this.value,
    this.subtitle,
    required this.icon,
    required this.cardTitleFontSize,
    required this.cardValueFontSize,
    required this.purpleColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double verticalPadding = MediaQuery.of(context).size.height * 0.015;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: purpleColor, size: screenWidth * 0.05),
              SizedBox(width: screenWidth * 0.015),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: cardTitleFontSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: verticalPadding / 2),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: cardValueFontSize,
              fontWeight: FontWeight.bold,
              color: purpleColor,
            ),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: GoogleFonts.poppins(
                fontSize: cardTitleFontSize * 0.8,
                color: Colors.grey.shade600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}

// Custom widget for sections like Qualifications and Job Preferences
class _ProfileSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showArrow;
  final double sectionHeaderFontSize;
  final double subSectionFontSize;
  final Color purpleColor;

  const _ProfileSection({
    required this.title,
    required this.subtitle,
    this.showArrow = true,
    required this.sectionHeaderFontSize,
    required this.subSectionFontSize,
    required this.purpleColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: sectionHeaderFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: subSectionFontSize,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          if (showArrow)
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: sectionHeaderFontSize,
            ),
        ],
      ),
    );
  }
}

// Custom widget for Resume Upload Card
class _ResumeUploadCard extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final double resumeFileNameFontSize;
  final Color purpleColor;

  const _ResumeUploadCard({
    required this.fileName,
    required this.fileSize,
    required this.resumeFileNameFontSize,
    required this.purpleColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: purpleColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Pdf",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: resumeFileNameFontSize,
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Text(
              fileName,
              style: GoogleFonts.poppins(
                fontSize: resumeFileNameFontSize,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            fileSize,
            style: GoogleFonts.poppins(
              fontSize: resumeFileNameFontSize,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Icon(Icons.close, color: Colors.grey, size: screenWidth * 0.04),
        ],
      ),
    );
  }
}

// Custom widget for Social Link Cards
class _SocialLinkCard extends StatelessWidget {
  final String label;
  final String hint;
  final String link;
  final double socialLinkFontSize;
  final Color purpleColor;

  const _SocialLinkCard({
    required this.label,
    required this.hint,
    required this.link,
    required this.socialLinkFontSize,
    required this.purpleColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: socialLinkFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  hint,
                  style: GoogleFonts.poppins(
                    fontSize: socialLinkFontSize * 0.8,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  link,
                  style: GoogleFonts.poppins(
                    fontSize: socialLinkFontSize,
                    color: Colors.blue.shade700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Icon(Icons.edit, color: purpleColor, size: screenWidth * 0.05),
        ],
      ),
    );
  }
}

// Bottom nav icon widget (reused for consistency)
class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final double fontSize;

  const _NavIcon({
    required this.icon,
    required this.label,
    required this.selected,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final purpleColor = const Color(0xFF7C329B);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: selected ? purpleColor : Colors.grey, size: 26),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            color: selected ? purpleColor : Colors.grey,
            fontWeight: selected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
