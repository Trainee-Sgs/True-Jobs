// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/Home_screens/home.dart';
import 'package:true_jobs/JOB_SEEKER/Home_screens/notification.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile_setting_page.dart';
import 'package:true_jobs/JOB_SEEKER/Job_screens/saved_job.dart'; // Assuming Home screen exists

class Chatpage extends StatelessWidget {
  const Chatpage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Responsive font sizes
    final double appBarTitleFontSize = screenWidth * 0.05;
    final double dropdownFontSize = screenWidth * 0.04;
    final double chatItemTitleFontSize = screenWidth * 0.042;
    final double chatItemSubtitleFontSize = screenWidth * 0.035;
    final double chatItemDateFontSize = screenWidth * 0.03;
    final double navIconFontSize = screenWidth * 0.03;

    final purpleColor = const Color(0xFF7C329B);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: purpleColor,
        elevation: 0,
        automaticallyImplyLeading:
            false, // No back button on app bar for chat page
        title: Text(
          "Chats",
          style: GoogleFonts.poppins(
            fontSize: appBarTitleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Dropdown and Pick Date row
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.015,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03,
                        vertical: screenHeight * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: 'All chat',
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: purpleColor,
                          ),
                          style: GoogleFonts.poppins(
                            fontSize: dropdownFontSize,
                            color: Colors.black,
                          ),
                          onChanged: (String? newValue) {
                            // Handle dropdown change
                          },
                          items: <String>['All chat', 'Unread', 'Archived']
                              .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              })
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: purpleColor,
                          size: screenWidth * 0.045,
                        ),
                        SizedBox(width: screenWidth * 0.015),
                        Text(
                          "Pick Date",
                          style: GoogleFonts.poppins(
                            fontSize: dropdownFontSize,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Chat list
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _ChatItem(
                      imagePath: 'assets/demo.png',
                      companyName: "Company Name",
                      message:
                          "Hello ! Mr. RK,\nWe recently received you job a...",
                      date: "14/02/2025",
                      time: "12:43 pm",
                      screenWidth: screenWidth,
                      chatItemTitleFontSize: chatItemTitleFontSize,
                      chatItemSubtitleFontSize: chatItemSubtitleFontSize,
                      chatItemDateFontSize: chatItemDateFontSize,
                      purpleColor: purpleColor,
                    ),
                    _ChatItem(
                      imagePath: 'assets/demo.png',
                      companyName: "Company Name",
                      message:
                          "We received you work through\nthe link you provided. For furth...",
                      date: "14/02/2025",
                      time: "12:43 pm",
                      screenWidth: screenWidth,
                      chatItemTitleFontSize: chatItemTitleFontSize,
                      chatItemSubtitleFontSize: chatItemSubtitleFontSize,
                      chatItemDateFontSize: chatItemDateFontSize,
                      purpleColor: purpleColor,
                    ),
                    _ChatItem(
                      imagePath: 'assets/demo.png',
                      companyName: "Company Name",
                      message:
                          "Hello ! Mr. RK,\nWe recently received you job ap...",
                      date: "14/02/2025",
                      time: "12:43 pm",
                      screenWidth: screenWidth,
                      chatItemTitleFontSize: chatItemTitleFontSize,
                      chatItemSubtitleFontSize: chatItemSubtitleFontSize,
                      chatItemDateFontSize: chatItemDateFontSize,
                      purpleColor: purpleColor,
                    ),
                    _ChatItem(
                      imagePath: 'assets/demo.png',
                      companyName: "Company Name",
                      message:
                          "We received you work through\nthe link you provided. For furth...",
                      date: "14/02/2025",
                      time: "12:43 pm",
                      screenWidth: screenWidth,
                      chatItemTitleFontSize: chatItemTitleFontSize,
                      chatItemSubtitleFontSize: chatItemSubtitleFontSize,
                      chatItemDateFontSize: chatItemDateFontSize,
                      purpleColor: purpleColor,
                    ),
                    _ChatItem(
                      imagePath: 'assets/demo.png',
                      companyName: "Company Name",
                      message:
                          "Hello ! Mr. RK,\nWe recently received you job ap...",
                      date: "14/02/2025",
                      time: "12:43 pm",
                      screenWidth: screenWidth,
                      chatItemTitleFontSize: chatItemTitleFontSize,
                      chatItemSubtitleFontSize: chatItemSubtitleFontSize,
                      chatItemDateFontSize: chatItemDateFontSize,
                      purpleColor: purpleColor,
                    ),
                    _ChatItem(
                      imagePath: 'assets/demo.png',
                      companyName: "Company Name",
                      message:
                          "We received you work through\nthe link you provided. For furth...",
                      date: "14/02/2025",
                      time: "12:43 pm",
                      screenWidth: screenWidth,
                      chatItemTitleFontSize: chatItemTitleFontSize,
                      chatItemSubtitleFontSize: chatItemSubtitleFontSize,
                      chatItemDateFontSize: chatItemDateFontSize,
                      purpleColor: purpleColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
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
                Navigator.pushReplacement(
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
                Navigator.pushReplacement(
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
            _NavIcon(
              icon: Icons.chat_outlined,
              label: "Chats",
              selected: true,
              fontSize: navIconFontSize,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: _NavIcon(
                icon: Icons.person_outline,
                label: "Profile",
                selected: false,
                fontSize: navIconFontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatItem extends StatelessWidget {
  final String imagePath;
  final String companyName;
  final String message;
  final String date;
  final String time;
  final double screenWidth;
  final double chatItemTitleFontSize;
  final double chatItemSubtitleFontSize;
  final double chatItemDateFontSize;
  final Color purpleColor;

  const _ChatItem({
    required this.imagePath,
    required this.companyName,
    required this.message,
    required this.date,
    required this.time,
    required this.screenWidth,
    required this.chatItemTitleFontSize,
    required this.chatItemSubtitleFontSize,
    required this.chatItemDateFontSize,
    required this.purpleColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenWidth * 0.02,
      ),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.03),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: screenWidth * 0.06, // Responsive avatar size
                  backgroundImage: AssetImage(imagePath),
                  backgroundColor: Colors.grey.shade200,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: screenWidth * 0.025,
                    height: screenWidth * 0.025,
                    decoration: BoxDecoration(
                      color: purpleColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    companyName,
                    style: GoogleFonts.poppins(
                      fontSize: chatItemTitleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    message,
                    style: GoogleFonts.poppins(
                      fontSize: chatItemSubtitleFontSize,
                      color: Colors.grey.shade600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  date,
                  style: GoogleFonts.poppins(
                    fontSize: chatItemDateFontSize,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  time,
                  style: GoogleFonts.poppins(
                    fontSize: chatItemDateFontSize,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Icon(
                  Icons.star_border,
                  color: Colors.grey,
                  size: screenWidth * 0.05,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Bottom nav icon widget (reused from Home and NotificationScreen for consistency)
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
