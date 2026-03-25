import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/Apply_screens/apply_job1.dart';
import 'package:true_jobs/JOB_SEEKER/Apply_screens/apply_job_success.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/personal_details.dart';

class ApplyJob3 extends StatefulWidget {
  const ApplyJob3({super.key});

  @override
  State<ApplyJob3> createState() => _ApplyJob3State();
}

class _ApplyJob3State extends State<ApplyJob3> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;
    final purpleColor = const Color(0xFF7C329B);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ---------- Scrollable Content ----------
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    Container(
                      width: double.infinity,
                      color: purpleColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.015,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: isTablet ? 28 : 24,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Job Details Header
                    Container(
                      width: double.infinity,
                      color: Colors.grey[50],
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Flutter Developer',
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 22 : 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            'Smart Global Solutions',
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 16 : 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.008),
                          Text(
                            '8,000 - 10,000 monthly',
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 16 : 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            'Tiruppur  |  Posted: 5 days ago',
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 14 : 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.015),

                          // Progress Bar
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Step indicator
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.01,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '3/3',
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 16 : 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),

                    // Main content
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Preview',
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 24 : 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.008),
                          Text(
                            'Check your job application before you submit',
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 16 : 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.025),

                          // Basic Details Section
                          buildSection(
                            title: 'Basic details',
                            context: context,
                            onEdit: () {
                              // Navigate to Personal Details page (Placeholder)
                              // You would replace this with your actual route
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PersonalDetails(),
                                ),
                              );
                            },
                            children: [
                              buildDetailRow(
                                title: 'Full name',
                                value: 'Remo Pandiyan',
                                isTablet: isTablet,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              buildDetailRow(
                                title: 'Mail id',
                                value: 'samples24@gmail.com',
                                isTablet: isTablet,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              buildDetailRow(
                                title: 'Mobile number',
                                value: '+91 9876543210',
                                isTablet: isTablet,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              buildDetailRow(
                                title: 'City & state',
                                value: 'Coimbatore, Tamil Nadu',
                                isTablet: isTablet,
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.025),

                          // Your CV Section
                          buildSection(
                            title: 'Your CV',
                            context: context,
                            onEdit: () {
                              // Navigate to apply_job1.dart
                              // You would replace this with your actual route to ApplyJob1
                              // Assuming ApplyJob1 is imported and a valid page
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ApplyJob1()),
                              );
                            
                            },
                            children: [
                              Container(
                                padding: EdgeInsets.all(screenWidth * 0.03),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey[300]!),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.picture_as_pdf,
                                      color: Colors.red,
                                      size: isTablet ? 32 : 28,
                                    ),
                                    SizedBox(width: screenWidth * 0.03),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Flutter Resume 2',
                                            style: GoogleFonts.poppins(
                                              fontSize: isTablet ? 16 : 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'Your uploaded resume',
                                            style: GoogleFonts.poppins(
                                              fontSize: isTablet ? 14 : 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '2 days ago',
                                      style: GoogleFonts.poppins(
                                        fontSize: isTablet ? 14 : 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.025),

                          // Terms and Conditions Text
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                fontSize: isTablet ? 12 : 11,
                                color: Colors.grey[600],
                                height: 1.5,
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                      'By submitting your job application, you agree to:\n',
                                ),
                                const TextSpan(text: '• '),
                                const TextSpan(
                                  text:
                                      'Share your personal and professional details with potential employers.\n',
                                ),
                                const TextSpan(text: '• '),
                                const TextSpan(
                                  text:
                                      'Allow True Job to store and process your information for recruitment purposes.\n',
                                ),
                                const TextSpan(text: '• '),
                                const TextSpan(
                                  text:
                                      'Receive job-related notifications and updates WhatApp or Email.\n',
                                ),
                                const TextSpan(text: '• '),
                                TextSpan(
                                  text: 'Abide by our ',
                                  style: GoogleFonts.poppins(
                                    fontSize: isTablet ? 12 : 11,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: GoogleFonts.poppins(
                                    fontSize: isTablet ? 12 : 11,
                                    color: purpleColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: GoogleFonts.poppins(
                                    fontSize: isTablet ? 12 : 11,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy.',
                                  style: GoogleFonts.poppins(
                                    fontSize: isTablet ? 12 : 11,
                                    color: purpleColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const TextSpan(text: '\n'),
                                TextSpan(
                                  text:
                                      'Your privacy is our priority. We ensure your data is handled securely and in compliance with our policies.',
                                  style: GoogleFonts.poppins(
                                    fontSize: isTablet ? 12 : 11,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                
                Container(
  width: double.infinity,
  padding: EdgeInsets.all(screenWidth * 0.04),
  child: Column(
    children: [
      // Submit application button
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ApplyJobSuccess()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: purpleColor,
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.018,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: Text(
            'Submit application',
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 18 : 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),

      SizedBox(height: screenHeight * 0.01),

      // Apply later button
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Handle apply later button press
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.018,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Colors.grey[300]!),
            ),
            elevation: 0,
          ),
          child: Text(
            'Apply later',
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 18 : 16,
              fontWeight: FontWeight.w600,
              color: purpleColor,
            ),
          ),
        ),
      ),

      SizedBox(height: screenHeight * 0.01),

      // Delete application button
      SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            // Handle delete application press
          },
          child: Text(
            'Delete Application',
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 16 : 14,
              color: Colors.red,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
            ),
          ),
        ),
      ),
    ],
  ),
),

                
                
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection({
    required String title,
    required BuildContext context,
    required VoidCallback onEdit,
    required List<Widget> children,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
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
                title,
                style: GoogleFonts.poppins(
                  fontSize: isTablet ? 18 : 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              GestureDetector(
                onTap: onEdit,
                child: Icon(
                  Icons.edit_outlined,
                  color: const Color(0xFF7C329B),
                  size: isTablet ? 24 : 20,
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ...children,
        ],
      ),
    );
  }

  Widget buildDetailRow({
    required String title,
    required String value,
    required bool isTablet,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: isTablet ? 14 : 12,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: isTablet ? 16 : 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
