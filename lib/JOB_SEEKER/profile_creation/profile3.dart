// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile4.dart';

class Profile3 extends StatefulWidget {
  const Profile3({super.key});

  @override
  State<Profile3> createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  final purpleColor = const Color(0xFF7C329B);

  TextEditingController searchController = TextEditingController();

  // Simulated selected job roles (replace or make dynamic as needed)
  final List<String> selectedRoles = [
    "Ui/Ux Designer",
    "Ui Designer",
    "Designer",
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive values
    final double horizontalPadding = screenWidth * 0.06; // 6% of screen width
    final double verticalSpacingSmall = screenHeight * 0.015; // 1.5% of screen height
    final double verticalSpacingMedium = screenHeight * 0.025; // 2.5% of screen height
    final double titleFontSize = screenWidth * 0.04; // 4% of screen width for labels
    final double contentFontSize = screenWidth * 0.038; // 3.8% of screen width for text fields and chips
    final double largeTitleFontSize = screenWidth * 0.05; // 5% for main titles
    final double buttonHeight = screenHeight * 0.06; // 6% of screen height for buttons
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
                      SizedBox(height: verticalSpacingMedium),
                      // Logo and back button row
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
                              value: 0.45, // 45%
                              minHeight: progressHeight,
                              backgroundColor: Colors.grey.shade300,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.015),
                          Text(
                            "45%",
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
                      SizedBox(height: verticalSpacingMedium),

                      Text(
                        "Prefered Job Role",
                        style: GoogleFonts.poppins(
                          fontSize: largeTitleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: verticalSpacingMedium),
                      Text(
                        "Select up to 5 jobs",
                        style: GoogleFonts.poppins(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: verticalSpacingSmall),
                      // Search Box
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade500,
                            size: iconSize, // Scaled icon size
                          ),
                          hintText: 'Search Here',
                          hintStyle: GoogleFonts.poppins(fontSize: contentFontSize),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1.5,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02,
                            vertical: screenHeight * 0.01,
                          ),
                        ),
                        style: GoogleFonts.poppins(fontSize: contentFontSize),
                      ),
                      SizedBox(height: verticalSpacingMedium),
                      // Selected Job Role Chips
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.015,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Wrap(
                          spacing: screenWidth * 0.03, // Scaled spacing
                          runSpacing: screenHeight * 0.015, // Scaled spacing
                          children: [
                            for (int i = 0; i < selectedRoles.length; i++)
                              _JobTag(
                                label: selectedRoles[i],
                                color: purpleColor,
                                onRemove: () =>
                                    setState(() => selectedRoles.removeAt(i)),
                                fontSize: contentFontSize, // Pass scaled font size
                                iconSize: iconSize * 0.6, // Scaled icon size for chip
                              ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: buttonHeight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Profile4(),
                              ),
                            );
                          },
                          child: Text(
                            'Next',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: contentFontSize + 2,
                              fontWeight: FontWeight.w500,
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

// Custom Job Tag Widget
class _JobTag extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onRemove;
  final double fontSize; // Added for responsiveness
  final double iconSize; // Added for responsiveness

  const _JobTag({
    required this.label,
    required this.color,
    required this.onRemove,
    required this.fontSize, // Receive scaled font size
    required this.iconSize, // Receive scaled icon size
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: EdgeInsets.symmetric(horizontal: fontSize * 0.5), // Scaled padding
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color, width: 1.7),
        borderRadius: BorderRadius.circular(18),
      ),
      backgroundColor: Colors.white,
      label: Text(
        label,
        style: GoogleFonts.poppins(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: fontSize, // Use scaled font size
        ),
      ),
      deleteIcon: Icon(Icons.close, size: iconSize, color: color), // Use scaled icon size
      onDeleted: onRemove,
    );
  }
}
