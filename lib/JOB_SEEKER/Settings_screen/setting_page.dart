// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile_setting_page.dart';
import 'package:true_jobs/JOB_SEEKER/Settings_screen/app_lock.dart';
import 'package:true_jobs/JOB_SEEKER/Settings_screen/faq.dart';
import 'package:true_jobs/JOB_SEEKER/Settings_screen/terms_condition.dart';
import 'package:true_jobs/login_pages/select_language.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _showOnline = true;
  bool _maskMailId = false;
  bool _whatsappAlerts = true;
  final Color purpleColor = const Color(0xFF7C329B);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Responsive font sizes
    final double appBarTitleFontSize = screenWidth * 0.05;
    final double itemTitleFontSize = screenWidth * 0.042;
    final double smallTextFontSize = screenWidth * 0.035;
    final double bottomActionFontSize = screenWidth * 0.038;
    final double horizontalPadding = screenWidth * 0.04;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
            fontSize: appBarTitleFontSize,
            fontWeight: FontWeight.bold,
            color: purpleColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: purpleColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: screenHeight * 0.02,
                ),
                child: Column(
                  children: [
                    _buildSettingSwitchItem(
                      icon: Icons.wifi,
                      title: "Show I'm online",
                      value: _showOnline,
                      onChanged: (bool value) {
                        setState(() {
                          _showOnline = value;
                        });
                      },
                      itemTitleFontSize: itemTitleFontSize,
                      purpleColor: purpleColor,
                    ),
                    _buildDivider(screenWidth),
                    _buildSettingSwitchItem(
                      icon: Icons.visibility_off,
                      title: "Mask my mail id",
                      infoIcon: true,
                      value: _maskMailId,
                      onChanged: (bool value) {
                        setState(() {
                          _maskMailId = value;
                        });
                      },
                      itemTitleFontSize: itemTitleFontSize,
                      purpleColor: purpleColor,
                    ),
                    _buildDivider(screenWidth),
                    _buildSettingSwitchItem(
                      icon: Icons.chat,
                      title: "WhatsApp job alerts",
                      value: _whatsappAlerts,
                      onChanged: (bool value) {
                        setState(() {
                          _whatsappAlerts = value;
                        });
                      },
                      itemTitleFontSize: itemTitleFontSize,
                      purpleColor: purpleColor,
                    ),
                    _buildDivider(screenWidth),
                    _buildSettingTextItem(
                      icon: Icons.language,
                      title: "App language",
                      trailingText: "English",
                      itemTitleFontSize: itemTitleFontSize,
                      smallTextFontSize: smallTextFontSize,
                      purpleColor: purpleColor,
                      onTap: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              insetPadding: const EdgeInsets.only(
                                top: 60,
                                bottom: 50,
                                left: 16,
                                right: 16,
                              ),
                              child: Stack(
                                children: [
                                  SelectLanguage(),
                                  Positioned(
                                    right: 0,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.cancel,
                                        color: Color.fromARGB(255, 20, 20, 20),
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _buildDivider(screenWidth),

                    _buildSettingActionItem(
                      icon: Icons.lock,
                      title: "App lock/unlock",
                      itemTitleFontSize: itemTitleFontSize,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AppLock(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _buildDivider(screenWidth),
                    _buildSettingActionItem(
                      icon: Icons.help_outline,
                      title: "Support & FAQs",
                      itemTitleFontSize: itemTitleFontSize,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Faq()),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    _buildDivider(screenWidth),
                    _buildSettingActionItem(
                      icon: Icons.description_outlined,
                      title: "Terms & conditions",
                      itemTitleFontSize: itemTitleFontSize,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TermsCondition(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _buildDivider(screenWidth),
                    _buildSettingActionItem(
                      icon: Icons.logout,
                      title: "Logout",
                      itemTitleFontSize: itemTitleFontSize,
                      onTap: () {
                        _showLogoutConfirmationDialog(context);
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _buildDivider(screenWidth),
                  ],
                ),
              ),
            ),
            // Bottom action bar
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.withValues(alpha: 0.25)),
                ),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
                horizontal: horizontalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _BottomActionItem(
                    icon: Icons.delete_outline,
                    label: "Delete account",
                    onTap: () {
                      _showDeleteConfirmationDialog(context);
                    },
                    fontSize: bottomActionFontSize,
                    color: Colors.grey.shade700,
                  ),
                  _BottomActionItem(
                    icon: Icons.share,
                    label: "Share App",
                    onTap: () {
                      // Handle share app
                    },
                    fontSize: bottomActionFontSize,
                    color: purpleColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMaskInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title row with close button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      Text(
                        "Masking mail id",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: purpleColor,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(Icons.close, size: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Our platform masks your email ID (e.g., smartxxxxxx.com) "
                    "to protect your privacy and prevent spam.\n\n"
                    "All employer communications sent to this masked address "
                    "will be securely forwarded to your actual email inbox.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // New function to show the delete confirmation dialog
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
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
                    Image.asset('assets/delete.gif', height: 100, width: 100),
                    const SizedBox(height: 16),
                    Text(
                      'Deleting your account will permanently erase your data and activity. This action can’t be undone.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: MediaQuery.of(context).size.width * 0.038,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Are you sure you want to',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Delete Account?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
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
                              side: const BorderSide(color: Color(0xFF7C329B)),
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Account deletion is not available yet.'),
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF7C329B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text('Delete', style: GoogleFonts.poppins()),
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
                            fontSize: screenWidth * 0.038,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '\n\nLogout?',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.038,
                            color: const Color(0xFF7C329B),
                            fontWeight: FontWeight.w600,
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Logout is not available yet.'),
                                ),
                              );
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

  Widget _buildDivider(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      child: Divider(color: Colors.grey.shade300, height: 1, thickness: 1),
    );
  }

  Widget _buildSettingSwitchItem({
    required IconData icon,
    required String title,
    bool infoIcon = false,
    required bool value,
    required ValueChanged<bool> onChanged,
    required double itemTitleFontSize,
    required Color purpleColor,
  }) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF6A1B9A), size: screenWidth * 0.06),
          SizedBox(width: screenWidth * 0.04),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: itemTitleFontSize,
              color: Colors.black,
            ),
          ),
          if (infoIcon) ...[
            infoIcon
                ? IconButton(
                    icon: const Icon(
                      Icons.info_outline,
                      size: 18,
                      color: Color(0xFF6A1B9A),
                    ),
                    onPressed: () {
                      _showMaskInfoDialog(context);
                    },
                  )
                : const SizedBox(),
          ],
          const Spacer(),
          Transform.scale(
            scale: screenWidth * 0.0025,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: Colors.white,
              activeTrackColor: purpleColor,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTextItem({
    required IconData icon,
    required String title,
    required String trailingText,
    required double itemTitleFontSize,
    required double smallTextFontSize,
    required Color purpleColor,
    VoidCallback? onTap,
  }) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF6A1B9A),
              size: screenWidth * 0.06,
            ),
            SizedBox(width: screenWidth * 0.04),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: itemTitleFontSize,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Text(
              trailingText,
              style: GoogleFonts.poppins(
                fontSize: smallTextFontSize,
                color: purpleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingActionItem({
    required IconData icon,
    required String title,
    required double itemTitleFontSize,
    required VoidCallback onTap,
  }) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF6A1B9A),
              size: screenWidth * 0.06,
            ),
            SizedBox(width: screenWidth * 0.04),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: itemTitleFontSize,
                color: Colors.black,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _BottomActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final double fontSize;
  final Color color;

  const _BottomActionItem({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.fontSize,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 26),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: fontSize,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
