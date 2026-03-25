import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile_success.dart';

class Profile6 extends StatefulWidget {
  const Profile6({super.key});

  @override
  State<Profile6> createState() => _Profile6State();
}

class _Profile6State extends State<Profile6> {
  final purpleColor = const Color(0xFF7C329B);

  TextEditingController linkedInController = TextEditingController();
  TextEditingController portfolioController = TextEditingController();
  // Simulate file upload state
  String resumeStatus = "Empty";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive values
    final double horizontalPadding = screenWidth * 0.05; // 5% of screen width
    final double verticalSpacingSmall =
        screenHeight * 0.015; // 1.5% of screen height
    final double verticalSpacingMedium =
        screenHeight * 0.025; // 2.5% of screen height
    final double titleFontSize =
        screenWidth * 0.04; // 4% of screen width for labels
    final double contentFontSize =
        screenWidth * 0.038; // 3.8% of screen width for text fields and buttons
    final double largeTitleFontSize = screenWidth * 0.05; // 5% for main titles
    final double buttonHeight =
        screenHeight * 0.06; // 6% of screen height for buttons
    final double progressHeight = screenHeight * 0.01; // 1% for progress bar
    final double logoHeight = screenHeight * 0.035; // 3.5% for logo
    final double iconSize = screenWidth * 0.055; // 5.5% for icons

    return Scaffold(
       backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.015,
                      ), // Adjusted top spacing
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: iconSize,
                            ),
                            onPressed: () => Navigator.of(context).maybePop(),
                            splashRadius: iconSize * 1.2,
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Image.asset(
                            'assets/TrueJobs logo.png',
                            height: logoHeight,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),

                      SizedBox(height: screenHeight * 0.005),
                      Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              borderRadius: BorderRadius.circular(10),
                              value: 0.92, // 92%
                              minHeight: progressHeight,
                              backgroundColor: Colors.grey.shade300,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.015),
                          Text(
                            "92%",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.035,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Profile Creation",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.038,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: verticalSpacingSmall),
                      Text(
                        "Social Links & Resume",
                        style: GoogleFonts.poppins(
                          fontSize: largeTitleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: verticalSpacingMedium),
                      Text(
                        "LinkedIn (optional)",
                        style: GoogleFonts.poppins(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: verticalSpacingSmall),
                      TextField(
                        controller: linkedInController,
                        decoration: InputDecoration(
                          hintText: 'Enter Link Address',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: contentFontSize,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1.5,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.035,
                            vertical: screenHeight * 0.015,
                          ),
                        ),
                        style: GoogleFonts.poppins(fontSize: contentFontSize),
                      ),
                      SizedBox(height: verticalSpacingMedium),
                      Row(
                        children: [
                          Text(
                            "Portfolio (Optional)",
                            style: GoogleFonts.poppins(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.015),
                          Text(
                            "(For Tech/Design Roles)",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.022, // Scaled font size
                              fontWeight: FontWeight.w400,
                              color: purpleColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: verticalSpacingSmall),
                      TextField(
                        controller: portfolioController,
                        decoration: InputDecoration(
                          hintText: 'Enter Portfolio Link Address',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: contentFontSize,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1.5,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.035,
                            vertical: screenHeight * 0.015,
                          ),
                        ),
                        style: GoogleFonts.poppins(fontSize: contentFontSize),
                      ),
                      SizedBox(height: verticalSpacingMedium),
                      Divider(
                        height: screenHeight * 0.04,
                        thickness: 1.5,
                        color: Colors.grey.shade300,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.015,
                        ), // Scaled padding
                        child: Center(
                          child: Text(
                            "Upload Your Updated Resume",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth * 0.042, // Scaled font size
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            SizedBox(height: verticalSpacingMedium),
                            SizedBox(
                              height:
                                  screenHeight * 0.07, // Scaled height for icon
                              child: Center(
                                child: Icon(
                                  Icons.folder_open,
                                  size: screenWidth * 0.14, // Scaled icon size
                                  color: purpleColor,
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.008),
                            Text(
                              "pdf, docx, jpg or png format only\n(10 MB maximum file size)",
                              style: GoogleFonts.poppins(
                                fontSize:
                                    screenWidth * 0.032, // Scaled font size
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.04,
                                vertical: screenHeight * 0.015,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                  width: 1.2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                resumeStatus,
                                style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: contentFontSize,
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            SizedBox(
                              width: double.infinity,
                              height: buttonHeight,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: purpleColor,
                                    width: 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  // File upload logic here
                                  setState(() {
                                    resumeStatus =
                                        "Resume.pdf"; // Simulate uploaded file
                                  });
                                },
                                child: Text(
                                  'Upload file',
                                  style: GoogleFonts.poppins(
                                    color: purpleColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: contentFontSize,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: verticalSpacingMedium),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: buttonHeight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: purpleColor.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileSuccess(),
                              ),
                            );
                          }, // Disabled until resume uploaded
                          child: Text(
                            'Save',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: contentFontSize + 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: verticalSpacingMedium),
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
