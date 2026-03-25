// ignore_for_file: unused_element_parameter, unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/Recutier_Module/Screens/rec_notification.dart';
import 'package:true_jobs/Recutier_Module/Widgets/bottom_nav.dart';
import 'package:true_jobs/Recutier_Module/Widgets/custom_drawer.dart';

class RecChat extends StatelessWidget {
  const RecChat({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Responsive font sizes
    final double chatItemTitleFontSize = screenWidth * 0.042;
    final double chatItemSubtitleFontSize = screenWidth * 0.035;
    final double chatItemDateFontSize = screenWidth * 0.03;

    final purpleColor = const Color(0xFF7C329B);

    return Scaffold(
      drawer: const SmartGlobalDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: purpleColor,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: screenWidth * 0.06,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ), // No back button on app bar for chat page
        title: Text(
          "Chats",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 1,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: screenWidth * 0.08,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecNotification(),
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                        borderRadius: BorderRadius.circular(8),
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
                            fontSize: 14,
                            color: Colors.black,
                            height: 1,
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
                      borderRadius: BorderRadius.circular(8),
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
                            fontSize: 14,
                            color: Colors.black,
                            height: 1,
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
      bottomNavigationBar: const RecruiterBottomNav(currentIndex: 2),
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: screenWidth * 0.0025,
              blurRadius: screenWidth * 0.012,
              offset: Offset(0, screenWidth * 0.005),
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
                      border: Border.all(
                        color: Colors.white,
                        width: screenWidth * 0.0038,
                      ),
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
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.025),
                  Text(
                    message,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.2,
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
                    fontSize: 12,
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
                Text(
                  time,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
                SizedBox(height: screenWidth * 0.025),
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
