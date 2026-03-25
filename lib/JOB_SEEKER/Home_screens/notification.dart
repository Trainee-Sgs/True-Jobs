// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'package:true_jobs/JOB_SEEKER/Chat_screens/chatpage.dart';
import 'package:true_jobs/JOB_SEEKER/Home_screens/home.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile_setting_page.dart';
import 'package:true_jobs/JOB_SEEKER/Job_screens/saved_job.dart'; // Import the Home screen

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Define responsive sizes for text and padding
    final double titleFontSize =
        screenWidth * 0.07; // ~28px on a 400px width phone
    final double subtitleFontSize =
        screenWidth * 0.04; // ~16px on a 400px width phone
    final double buttonFontSize =
        screenWidth * 0.045; // ~18px on a 400px width phone
    final double verticalPadding = screenHeight * 0.02;
    final double horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7C329B), // Purple color for AppBar
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home()));
          },
        ),
        title: Text(
          "Notification",
          style: GoogleFonts.poppins(
            fontSize:
                screenWidth * 0.05, // Responsive font size for app bar title
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Speaker image
                Image.asset(
                  'assets/speaker.png', // Ensure 'speaker.png' is in your assets folder
                  width: screenWidth * 0.6, // Responsive width
                  height:
                      screenWidth *
                      0.6, // Responsive height (keeping aspect ratio)
                  fit: BoxFit.contain,
                ),
                SizedBox(height: screenHeight * 0.05), // Responsive spacing
                // "Stay tuned!" text
                Text(
                  "Stay tuned!",
                  style: GoogleFonts.poppins(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive spacing
                // Description text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Text(
                    "We'll update you on your job applications and share helpful information to support your job search.",
                    style: GoogleFonts.poppins(
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: screenHeight * 0.06), // Responsive spacing
                // "Search Jobs" button
                SizedBox(
                  width: screenWidth * 0.8, // Responsive button width
                  height: screenHeight * 0.06, // Responsive button height
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement navigation to job search or desired action
                      Navigator.pop(context); // Example: go back
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                        0xFF7C329B,
                      ), // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.015,
                      ), // Responsive padding
                    ),
                    child: Text(
                      "Search Jobs",
                      style: GoogleFonts.poppins(
                        fontSize: buttonFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              
              ],
            ),
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
            // Home Icon - Now navigates to Home screen
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
              ), // Not selected on this screen
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SavedJob(savedJobs: [], allJobs: [],)),
                );
              },
              
              child: _NavIcon(icon: Icons.work_outline, label: "Jobs", selected: false)),
            GestureDetector(

              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Chatpage()),
                );
              },
              child: _NavIcon(
                icon: Icons.chat_outlined,
                label: "Chats",
                selected: false,
              ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Bottom nav icon widget (copied from home.dart for completeness)
class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const _NavIcon({
    required this.icon,
    required this.label,
    required this.selected,
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
            fontSize: 12,
            color: selected ? purpleColor : Colors.grey,
            fontWeight: selected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
