import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_RECRUITER/Main_Screens/profiles/rec_saved_profile_details.dart';
import 'package:true_jobs/JOB_RECRUITER/Menu/Company_profile/company_profile.dart';
import 'package:true_jobs/JOB_RECRUITER/Menu/Post_Job/post_job1.dart';
import 'package:true_jobs/JOB_RECRUITER/Menu/Settings_screen/rec_settings.dart';
import 'package:true_jobs/JOB_RECRUITER/Menu/credits.dart';
import 'package:true_jobs/JOB_RECRUITER/Menu/help.dart';
import 'package:true_jobs/JOB_RECRUITER/Menu/payment_history.dart';
import 'package:true_jobs/JOB_RECRUITER/Menu/post_status/posting.dart';
import 'package:true_jobs/JOB_RECRUITER/Rec_payment_screens/subscription.dart';

class SmartGlobalDrawer extends StatelessWidget {
  const SmartGlobalDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      width: screenWidth * 0.92,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              height: screenHeight * 0.132,
              decoration: BoxDecoration(
                color: const Color(0xFF7C329B),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.01,
                  ),
                  child: Row(
                    children: [
                      // Logo
                      Container(
                        width: screenWidth * 0.12,
                        height: screenWidth * 0.12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.06,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.06,
                          ),
                          child: Image.asset(
                            'assets/smart_logo.png',
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.white,
                                child: Icon(
                                  Icons.business,
                                  color: const Color(0xFF7C329B),
                                  size: screenWidth * 0.06,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      // Company Name
                      Expanded(
                        child: Text(
                          'SMART GLOBAL\nSOLUTIONS',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.1,
                          ),
                        ),
                      ),
                      // Back Arrow
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: screenWidth * 0.06,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Menu Items
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.02),

                    // Post a Job
                    _buildMenuItem(
                      context,
                      icon: Icons.send,
                      title: 'Post a Job',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostJobScreen(),
                          ),
                        );
                      },
                    ),

                    // Posting Status with badge
                    _buildMenuItem(
                      context,
                      icon: Icons.show_chart,
                      title: 'Posting Status',
                      badge: '3',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostingStatusScreen(),
                          ),
                        );
                      },
                    ),

                    // Saved Profiles
                    _buildMenuItem(
                      context,
                      icon: Icons.bookmark,
                      title: 'Saved Profiles',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RecSavedProfileDetails(),
                          ),
                        );
                      },
                    ),

                    // Company Profile
                    _buildMenuItem(
                      context,
                      icon: Icons.business,
                      title: 'Company Profile',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CompanyProfileScreen(),
                          ),
                        );
                      },
                    ),

                    // Payment History
                    _buildMenuItem(
                      context,
                      icon: Icons.history,
                      title: 'Payment History',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentHistory(),
                          ),
                        );
                      },
                    ),

                    // Settings
                    _buildMenuItem(
                      context,
                      icon: Icons.settings,
                      title: 'Settings',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RecSettings(),
                          ),
                        );
                      },
                    ),

                    // Help & Support
                    _buildMenuItem(
                      context,
                      icon: Icons.help_outline,
                      title: 'Help & Support',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Help()),
                        );
                      },
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Premium Plan Section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'PREMIUM PLAN',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF7C329B),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                  height: 1,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const Subscription(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'View Plans',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF7C329B),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            'Available Credits',
                            style: GoogleFonts.poppins(
                              color: Colors.grey[600],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            '10',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF7C329B),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Need more credits
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Credits(),
                              ),
                            );
                          },
                          child: Text(
                            'Need more credits? Buy now',
                            style: GoogleFonts.poppins(
                              color: Colors.green[700],
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.green[700],
                          size: screenWidth * 0.04,
                        ),
                      ],
                    ),

                    // Bottom Actions
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.02,
                        bottom: screenHeight * 0.02,
                      ),
                      child: Column(
                        children: [
                          // Share App
                          InkWell(
                            onTap: () {
                              // TODO: Implement Share
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.01,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.share,
                                    color: const Color(0xFF7C329B),
                                    size: screenWidth * 0.05,
                                  ),
                                  SizedBox(width: screenWidth * 0.03),
                                  Text(
                                    'Share App',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF7C329B),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Logout
                          InkWell(
                            onTap: () {
                              _showLogoutConfirmationDialog(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.01,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: const Color(0xFF7C329B),
                                    size: screenWidth * 0.05,
                                  ),
                                  SizedBox(width: screenWidth * 0.03),
                                  Text(
                                    'Logout',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF7C329B),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 1,
                                    ),
                                  ),
                                ],
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

  void _showLogoutConfirmationDialog(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.grey),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/light.gif',
                          height: 200,
                          width: 100,
                        ),

                        Text(
                          '\nAre you sure \nyou want to',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                        ),
                        Text(
                          '\n\nLogout?',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: const Color(0xFF7C329B),
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7C329B),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text('Cancel', style: GoogleFonts.poppins()),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Implement actual logout logic here
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF7C329B),
                              side: const BorderSide(color: Color(0xFF7C329B)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text('Logout', style: GoogleFonts.poppins()),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? badge,
    required double screenWidth,
    required double screenHeight,
    VoidCallback? onTap, // 👈 added
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap, // 👈 now clickable
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFF7C329B),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ),
              if (badge != null) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    badge,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF7C329B),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
