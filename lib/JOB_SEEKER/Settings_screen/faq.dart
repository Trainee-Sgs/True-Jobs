import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7C329B),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Help & Support',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isTablet ? 24 : 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Image and Text
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.03,
              ),
              child: Column(
                children: [
                  // FAQ Image and Text Section
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        // FAQ Image
                        Container(
                          width: isTablet ? 120 : screenWidth * 0.25,
                          height: isTablet ? 120 : screenWidth * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            'assets/FAQ.gif',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        // Text Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Feeling Stuck?',
                                style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 24 : screenWidth * 0.05,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.005),
                              Text(
                                'We\'ll Help You Sort It Out!',
                                style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 16 : screenWidth * 0.035,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: screenHeight * 0.025),
                  
                  // Contact Button
                  Container(
                    width: double.infinity,
                    height: isTablet ? 70 : screenHeight * 0.075,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C329B),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.headset_mic,
                              color: Colors.white,
                              size: isTablet ? 24 : 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Contact Us    98765-43210',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: isTablet ? 16 : screenWidth * 0.038,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '24/7 Assistance Available',
                                style: GoogleFonts.poppins(
                                  color: Colors.white70,
                                  fontSize: isTablet ? 14 : screenWidth * 0.032,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: screenHeight * 0.02),
            
            // General Queries Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'General queries',
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 20 : screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  
                  // FAQ Items
                  _buildFAQItem(
                    '1. How do I create an account in app ?',
                    context,
                    isTablet,
                    screenWidth,
                  ),
                  _buildFAQItem(
                    '2. How do I create an account in app ?',
                    context,
                    isTablet,
                    screenWidth,
                  ),
                  _buildFAQItem(
                    '3. How do I create an account in app ?',
                    context,
                    isTablet,
                    screenWidth,
                  ),
                  _buildFAQItem(
                    '4. How do I create an account in app ?',
                    context,
                    isTablet,
                    screenWidth,
                  ),
                ],
              ),
            ),
            
            SizedBox(height: screenHeight * 0.03),
            
            // Job Postings Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Job postings',
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 20 : screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  
                  // Job FAQ Items
                  _buildFAQItem(
                    '1. How do I create an account in app ?',
                    context,
                    isTablet,
                    screenWidth,
                  ),
                  _buildExpandedFAQItem(
                    '2. How do I create an account in app ?',
                    'Lorem ipsum dolor sit amet, consectetur adipis cing elit, sed do eiusmod tempor incididunt ut',
                    context,
                    isTablet,
                    screenWidth,
                  ),
                  _buildFAQItem(
                    '3. How do I create an account in app ?',
                    context,
                    isTablet,
                    screenWidth,
                  ),
                  _buildFAQItem(
                    '4. How do I create an account in app ?',
                    context,
                    isTablet,
                    screenWidth,
                  ),
                ],
              ),
            ),
            
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
  
  Widget _buildFAQItem(String question, BuildContext context, bool isTablet, double screenWidth) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: 4,
        ),
        title: Text(
          question,
          style: GoogleFonts.poppins(
            fontSize: isTablet ? 16 : screenWidth * 0.035,
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey[600],
          size: isTablet ? 24 : 20,
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Text(
              'Answer content goes here...',
              style: GoogleFonts.poppins(
                fontSize: isTablet ? 14 : screenWidth * 0.032,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildExpandedFAQItem(String question, String answer, BuildContext context, bool isTablet, double screenWidth) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: 4,
        ),
        title: Text(
          question,
          style: GoogleFonts.poppins(
            fontSize: isTablet ? 16 : screenWidth * 0.035,
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_up,
          color: Colors.grey[600],
          size: isTablet ? 24 : 20,
        ),
        initiallyExpanded: true,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.04,
              0,
              screenWidth * 0.04,
              screenWidth * 0.04,
            ),
            child: Text(
              answer,
              style: GoogleFonts.poppins(
                fontSize: isTablet ? 14 : screenWidth * 0.032,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
