import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/login_pages/otp.dart';

class Forgot extends StatelessWidget {
  const Forgot({super.key});

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
                      const SizedBox(height: 62),
                      // Forgot Password Title
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Forgot Password",
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 30 : 24,
                            color: purpleColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Input field
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          style: GoogleFonts.poppins(fontSize: isTablet ? 20 : 16),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: isTablet ? 20 : 15,
                              horizontal: 10,
                            ),
                            hintText: 'Mail id/ mobile number',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Instruction text
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "An OTP will be sent to this mail id/mobile number.",
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 16 : 12,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                     
                       const SizedBox(height: 86),
                      // Send OTP Button
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Otp()));
                          },
                          child: Text(
                            'Send OTP',
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
}
