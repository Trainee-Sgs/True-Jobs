import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostJobScreen extends StatelessWidget {
  const PostJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _RecruiterMenuScaffold(
      title: 'Post a Job',
      icon: Icons.send,
      message: 'Create and publish a new recruiter job post from here.',
    );
  }
}

class _RecruiterMenuScaffold extends StatelessWidget {
  final String title;
  final IconData icon;
  final String message;

  const _RecruiterMenuScaffold({
    required this.title,
    required this.icon,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const primaryColor = Color(0xFF7C329B);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        titleSpacing: 0,
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F3FB),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE4D8EB)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: screenWidth * 0.16,
                  height: screenWidth * 0.16,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEFE3F6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: screenWidth * 0.08,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
                SizedBox(height: screenHeight * 0.014),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
