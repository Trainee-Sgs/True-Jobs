import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/login_pages/Register/reg_otp.dart';

class RegLogin extends StatelessWidget {
  const RegLogin({super.key});

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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                      // New Registration Title
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "New Registration",
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 30 : 24,
                            color: purpleColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Mobile number field
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
                            hintText: 'Mobile number',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                      // Next Button
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> RegOtp()));
                          },
                          child: Text(
                            'Next',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: isTablet ? 22 : 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Divider
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'or continue with',
                              style: GoogleFonts.poppins(
                                fontSize: isTablet ? 14 : 12,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Social media login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google_login.png',
                            height: isTablet ? 50 : 40,
                          ),
                          const SizedBox(width: 20),
                          Image.asset(
                            'assets/apple_login.png',
                            height: isTablet ? 50 : 40,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                     
                      // Login link
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text.rich(
                            TextSpan(
                              text: 'Already have an account! ',
                              style: GoogleFonts.poppins(
                                fontSize: isTablet ? 16 : 14,
                                color: Colors.black87,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: GoogleFonts.poppins(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      // Terms and Privacy
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              text:
                                  'By clicking Continue, you agree to True Jobs ',
                              style: GoogleFonts.poppins(
                                fontSize: isTablet ? 12 : 10,
                                color: Colors.black54,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: GoogleFonts.poppins(
                                    decoration: TextDecoration.underline,
                                    color: purpleColor,
                                  ),
                                ),
                                TextSpan(text: ' and '),
                                TextSpan(
                                  text: 'Privacy Policy.',
                                  style: GoogleFonts.poppins(
                                    decoration: TextDecoration.underline,
                                    color: purpleColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
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
