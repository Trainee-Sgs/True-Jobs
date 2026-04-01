// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile6.dart';

class Profile5 extends StatefulWidget {
  const Profile5({super.key});

  @override
  State<Profile5> createState() => _Profile5State();
}

class _Profile5State extends State<Profile5> {
  final purpleColor = const Color(0xFF7C329B);

  int selectedShift = 0;
  int selectedWorkMode = 0;
  int selectedJobType = 0;

  int selectedProficiency = 0;
  final List<String> proficiencyLevels = ["Basic", "Inter Mediate", "Advanced"];
  final List<String> shifts = ["Day", "Night", "Rotational"];
  final List<String> workModes = [
    "In-Office",
    "Work From Home",
    "Hybrid",
    "Field Work",
  ];
  final List<String> jobTypes = ["Full Time", "Part Time", "Internship"];

  TextEditingController searchController = TextEditingController();
  final List<String> languages = ["Tamil", "Malayalam", "Hindi", "Japanese"];

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
        screenWidth * 0.038; // 3.8% of screen width for text fields and pills
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
                              value: 0.7, // 70%
                              minHeight: progressHeight,
                              backgroundColor: Colors.grey.shade300,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.015),
                          Text(
                            "70%",
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
                        "Job Type & Language",
                        style: GoogleFonts.poppins(
                          fontSize: largeTitleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: verticalSpacingMedium),
                      Text(
                        "Preferred Shift",
                        style: GoogleFonts.poppins(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: verticalSpacingSmall),
                      Wrap(
                        spacing: screenWidth * 0.03, // Scaled spacing
                        runSpacing: screenHeight * 0.01,
                        children: List.generate(
                          shifts.length,
                          (i) => _Pill(
                            label: shifts[i],
                            selected: selectedShift == i,
                            color: purpleColor,
                            onTap: () => setState(() => selectedShift = i),
                            fontSize: contentFontSize, // Pass scaled font size
                          ),
                        ),
                      ),
                      SizedBox(height: verticalSpacingMedium),
                      Text(
                        "Work Mode",
                        style: GoogleFonts.poppins(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: verticalSpacingSmall),
                      Wrap(
                        spacing: screenWidth * 0.03, // Scaled spacing
                        runSpacing: screenHeight * 0.015,
                        children: List.generate(
                          workModes.length,
                          (i) => _Pill(
                            label: workModes[i],
                            selected: selectedWorkMode == i,
                            color: purpleColor,
                            onTap: () => setState(() => selectedWorkMode = i),
                            fontSize: contentFontSize, // Pass scaled font size
                          ),
                        ),
                      ),
                      SizedBox(height: verticalSpacingMedium),
                      Text(
                        "Job Type",
                        style: GoogleFonts.poppins(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: verticalSpacingSmall),
                      Wrap(
                        spacing: screenWidth * 0.015, // Scaled spacing
                        runSpacing: screenHeight * 0.01,
                        children: List.generate(
                          jobTypes.length,
                          (i) => _Pill(
                            label: jobTypes[i],
                            selected: selectedJobType == i,
                            color: purpleColor,
                            onTap: () => setState(() => selectedJobType = i),
                            fontSize: contentFontSize, // Pass scaled font size
                          ),
                        ),
                      ),
                      SizedBox(height: verticalSpacingMedium),
                      Divider(
                        height: screenHeight * 0.04, // Scaled divider height
                        thickness: 1.5,
                        color: Colors.grey.shade300,
                      ),
                      Text(
                        "Language Proficiency",
                        style: GoogleFonts.poppins(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: verticalSpacingSmall),
                      Text(
                        "English",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.038,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.008), // Smaller spacing
                      Row(
                        children: List.generate(
                          proficiencyLevels.length,
                          (i) => Row(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    setState(() => selectedProficiency = i),
                                child: Icon(
                                  selectedProficiency == i
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_off,
                                  color: purpleColor,
                                  size: iconSize * 0.9,
                                ),
                              ),
                              Text(
                                proficiencyLevels[i],
                                style: GoogleFonts.poppins(
                                  fontSize:
                                      screenWidth * 0.027, // Scaled font size
                                  color: i == selectedProficiency
                                      ? purpleColor
                                      : Colors.black87,
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.025,
                              ), // Scaled spacing
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: verticalSpacingSmall),
                      Text(
                        "Add Languages",
                        style: GoogleFonts.poppins(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: verticalSpacingSmall),
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search Here',
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
                            horizontal: screenWidth * 0.025,
                            vertical: screenHeight * 0.01,
                          ),
                        ),
                        style: GoogleFonts.poppins(fontSize: contentFontSize),
                      ),
                      SizedBox(height: verticalSpacingSmall),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.018,
                          horizontal: screenWidth * 0.015,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Wrap(
                          spacing: screenWidth * 0.02, // Scaled spacing
                          runSpacing: screenHeight * 0.015,
                          children: List.generate(
                            languages.length,
                            (i) => _JobTag(
                              label: languages[i],
                              color: purpleColor,
                              onRemove: () =>
                                  setState(() => languages.removeAt(i)),
                              fontSize:
                                  contentFontSize, // Pass scaled font size
                              iconSize: iconSize * 0.6, // Scaled icon size
                            ),
                          ),
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
                                builder: (context) => const Profile6(),
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

// Pill-shaped selector widget
class _Pill extends StatelessWidget {
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;
  final double fontSize; // Added for responsiveness

  const _Pill({
    required this.label,
    required this.selected,
    required this.color,
    required this.onTap,
    required this.fontSize, // Receive scaled font size
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: fontSize * 1.2,
          vertical: fontSize * 0.7,
        ), // Scaled padding
        margin: EdgeInsets.only(bottom: fontSize * 0.5), // Scaled margin
        decoration: BoxDecoration(
          color: selected ? color : Colors.transparent,
          border: Border.all(
            color: selected ? color : Colors.black26,
            width: selected ? 2 : 1.5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: fontSize, // Use scaled font size
          ),
        ),
      ),
    );
  }
}

// Removable Chip/Tag widget for language
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
      labelPadding: EdgeInsets.symmetric(
        horizontal: fontSize * 0.5,
      ), // Scaled padding
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
      deleteIcon: Icon(
        Icons.close,
        size: iconSize,
        color: color,
      ), // Use scaled icon size
      onDeleted: onRemove,
    );
  }
}
