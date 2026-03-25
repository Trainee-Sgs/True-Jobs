import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/Home_screens/home.dart';

class CreateNewPass extends StatefulWidget {
  const CreateNewPass({super.key});

  @override
  State<CreateNewPass> createState() => _CreateNewPassState();
}

class _CreateNewPassState extends State<CreateNewPass> {
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final purpleColor = const Color(0xFF7C329B);
    final mediaQuery = MediaQuery.of(context);
    final isTablet = mediaQuery.size.width > 600;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: isTablet ? 100 : 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight - AppBar().preferredSize.height),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      // Logo
                      Image.asset(
                        'assets/TrueJobs logo.png',
                        height: isTablet ? 90 : 60,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 16),
                      // Subtitle
                      Text(
                        "Discover Opportunities with Our\nReliable Community.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: isTablet ? 18 : 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Title
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Create New Password",
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 30 : 24,
                            color: purpleColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // New password field
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          obscureText: !_isNewPasswordVisible,
                          style: GoogleFonts.poppins(fontSize: isTablet ? 20 : 16),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: isTablet ? 20 : 15,
                              horizontal: 10,
                            ),
                            hintText: 'Enter new password',
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isNewPasswordVisible = !_isNewPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Re-enter password field
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          obscureText: !_isConfirmPasswordVisible,
                          style: GoogleFonts.poppins(fontSize: isTablet ? 20 : 16),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: isTablet ? 20 : 15,
                              horizontal: 10,
                            ),
                            hintText: 'Re-enter password',
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      // Password requirements
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your password should possess:",
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 16 : 12,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildPasswordRequirement("Minimum 8 characters", isTablet),
                          _buildPasswordRequirement("At least 1 uppercase letter (A-Z)", isTablet),
                          _buildPasswordRequirement("At least 1 lowercase letter (a-z)", isTablet),
                          _buildPasswordRequirement("At least 1 number (0-9)", isTablet),
                          _buildPasswordRequirement("At least 1 special character (e.g., @ # \$ % & * !)", isTablet),
                          _buildPasswordRequirement("No spaces allowed", isTablet),
                        ],
                      ),
                      const Spacer(),
                      // Confirm Button
                      SizedBox(
                        width: double.infinity,
                        height: isTablet ? 60 : 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                          },
                          child: Text(
                            'Confirm',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: isTablet ? 22 : 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPasswordRequirement(String text, bool isTablet) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(
        "• $text",
        style: GoogleFonts.poppins(
          fontSize: isTablet ? 14 : 13,
          color: Colors.black54,
        ),
      ),
    );
  }
}
