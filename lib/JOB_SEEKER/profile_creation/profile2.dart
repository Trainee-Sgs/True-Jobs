// ignore_for_file: unused_element_parameter
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile3.dart';

class Profile2 extends StatefulWidget {
  const Profile2({super.key});

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  final purpleColor = const Color(0xFF7C329B);

  final List<String> qualifications = [
    "Below 10th",
    "10th",
    "12th",
    "Diploma",
    "ITI",
    "UG",
    "PG",
  ];
  int? selectedQualification;

  String schoolName = '';
  String? selectedYear;

  String diplomaBoard = '';
  String diplomaSpecialization = '';
  String diplomaCollege = '';
  String? diplomaYear;

  String? itiBoard;
  String itiCourse = '';
  String itiInstitution = '';
  String? itiYear;

  // UG/PG specific fields
  String? degree;
  String ugPgSpecialization = '';
  String ugPgCollege = '';
  String? ugPgYear;

  final List<String> years = List.generate(
    50,
        (index) => (2025 - index).toString(),
  );

  final List<String> degrees = [
    "Bachelor of Arts (BA)",
    "Bachelor of Science (BSc)",
    "Bachelor of Commerce (BCom)",
    "Bachelor of Engineering (BE/BTech)",
    "Bachelor of Technology (BTech)",
    "Bachelor of Business Administration (BBA)",
    "Master of Arts (MA)",
    "Master of Science (MSc)",
    "Master of Commerce (MCom)",
    "Master of Business Administration (MBA)",
    "Master of Technology (MTech)",
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
    final double contentFontSize = screenWidth * 0.038; // 3.8% of screen width for text fields and pills
    final double largeTitleFontSize = screenWidth * 0.05; // 5% for main titles
    final double buttonHeight = screenHeight * 0.06; // 6% of screen height for buttons
    final double progressHeight = screenHeight * 0.01; // 1% for progress bar
    final double logoHeight = screenHeight * 0.035; // 3.5% for logo
    final double iconSize = screenWidth * 0.055; // 5.5% for icons


    TextStyle labelStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      color: Colors.black87,
      fontSize: titleFontSize, // Scaled font size
    );

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

                      SizedBox(height: screenHeight * 0.005), // Smaller vertical spacing
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: 0.20,
                                minHeight: progressHeight,
                                backgroundColor: Colors.grey.shade300,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.015),
                          Text(
                            "20%",
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
                        "Education",
                        style: GoogleFonts.poppins(
                          fontSize: largeTitleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: verticalSpacingMedium),
                      Text(
                        "Your Highest Qualification",
                        style: GoogleFonts.poppins(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: verticalSpacingSmall),

                      Wrap(
                        spacing: screenWidth * 0.03, // Scaled spacing
                        runSpacing: screenHeight * 0.015, // Scaled spacing
                        children: [
                          for (int i = 0; i < qualifications.length; i++)
                            _QualificationPill(
                              label: qualifications[i],
                              selected: selectedQualification == i,
                              color: purpleColor,
                              onTap: () {
                                setState(() {
                                  selectedQualification = i;

                                  schoolName = '';
                                  selectedYear = null;
                                  diplomaBoard = '';
                                  diplomaSpecialization = '';
                                  diplomaCollege = '';
                                  diplomaYear = null;
                                  itiBoard = null;
                                  itiCourse = '';
                                  itiInstitution = '';
                                  itiYear = null;
                                  degree = null;
                                  ugPgSpecialization = '';
                                  ugPgCollege = '';
                                  ugPgYear = null;
                                });
                              },
                              fontSize: contentFontSize, // Pass scaled font size
                            ),
                        ],
                      ),
                      SizedBox(height: verticalSpacingMedium),

                      // Show fields for 10th, 12th
                      if (selectedQualification == 1 || selectedQualification == 2)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "School",
                              style: labelStyle,
                            ),
                            SizedBox(height: verticalSpacingSmall),
                            TextField(
                              style: GoogleFonts.poppins(fontSize: contentFontSize),
                              decoration: InputDecoration(
                                hintText: "Enter School Name",
                                border: const OutlineInputBorder(),
                                hintStyle: GoogleFonts.poppins(color: Colors.black38, fontSize: contentFontSize),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.035,
                                  vertical: screenHeight * 0.018,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  schoolName = value;
                                });
                              },
                            ),
                            SizedBox(height: verticalSpacingMedium),
                            Text(
                              "Year of passed Out",
                              style: labelStyle,
                            ),
                            SizedBox(height: verticalSpacingSmall),
                            DropdownButtonFormField<String>(
                              initialValue: selectedYear,
                              hint: Text("Select Year", style: GoogleFonts.poppins(fontSize: contentFontSize)),
                              items: years.map((String year) {
                                return DropdownMenuItem<String>(
                                  value: year,
                                  child: Text(year, style: GoogleFonts.poppins(fontSize: contentFontSize)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedYear = value;
                                });
                              },
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.035,
                                  vertical: screenHeight * 0.018,
                                ),
                              ),
                            ),
                            SizedBox(height: verticalSpacingMedium),
                          ],
                        ),

                      if (selectedQualification == 3)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Board
                            Text(
                              "Board",
                              style: labelStyle,
                            ),
                            SizedBox(height: verticalSpacingSmall),
                            TextField(
                              style: GoogleFonts.poppins(fontSize: contentFontSize),
                              decoration: InputDecoration(
                                hintText: "Enter Board of Diploma",
                                border: const OutlineInputBorder(),
                                hintStyle: GoogleFonts.poppins(color: Colors.black38, fontSize: contentFontSize),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.035,
                                  vertical: screenHeight * 0.018,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  diplomaBoard = value;
                                });
                              },
                            ),
                            SizedBox(height: verticalSpacingMedium),

                            // Specialization
                            Text(
                              "Specialization",
                              style: labelStyle,
                            ),
                            SizedBox(height: verticalSpacingSmall),
                            TextField(
                              style: GoogleFonts.poppins(fontSize: contentFontSize),
                              decoration: InputDecoration(
                                hintText: "Enter Specialization",
                                border: const OutlineInputBorder(),
                                hintStyle: GoogleFonts.poppins(color: Colors.black38, fontSize: contentFontSize),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.035,
                                  vertical: screenHeight * 0.018,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  diplomaSpecialization = value;
                                });
                              },
                            ),
                            SizedBox(height: verticalSpacingMedium),

                            // College/University
                            Text(
                              "College/University",
                              style: labelStyle,
                            ),
                            SizedBox(height: verticalSpacingSmall),
                            TextField(
                              style: GoogleFonts.poppins(fontSize: contentFontSize),
                              decoration: InputDecoration(
                                hintText: "Enter name of the college/university",
                                border: const OutlineInputBorder(),
                                hintStyle: GoogleFonts.poppins(color: Colors.black38, fontSize: contentFontSize),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.035,
                                  vertical: screenHeight * 0.018,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  diplomaCollege = value;
                                });
                              },
                            ),
                            SizedBox(height: verticalSpacingMedium),

                            Text(
                              "Year of Passing/Passed Out",
                              style: labelStyle,
                            ),
                            SizedBox(height: verticalSpacingSmall),
                            DropdownButtonFormField<String>(
                              initialValue: diplomaYear,
                              hint: Text("Select Year", style: GoogleFonts.poppins(fontSize: contentFontSize)),
                              items: years.map((String year) {
                                return DropdownMenuItem<String>(
                                  value: year,
                                  child: Text(year, style: GoogleFonts.poppins(fontSize: contentFontSize)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  diplomaYear = value;
                                });
                              },
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.035,
                                  vertical: screenHeight * 0.018,
                                ),
                              ),
                            ),
                            SizedBox(height: verticalSpacingMedium),
                          ],
                        ),

                      if (selectedQualification == 4)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select Board",
                              style: labelStyle,
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Wrap( // Using Wrap for responsive layout
                              spacing: screenWidth * 0.03,
                              runSpacing: screenHeight * 0.01,
                              children: [
                                _QualificationPill(
                                  label: "NCVT",
                                  selected: itiBoard == "NCVT",
                                  color: purpleColor,
                                  onTap: () {
                                    setState(() {
                                      itiBoard = "NCVT";
                                    });
                                  },
                                  fontSize: contentFontSize, // Pass scaled font size
                                ),
                                _QualificationPill(
                                  label: "SCVT",
                                  selected: itiBoard == "SCVT",
                                  color: purpleColor,
                                  onTap: () {
                                    setState(() {
                                      itiBoard = "SCVT";
                                    });
                                  },
                                  fontSize: contentFontSize, // Pass scaled font size
                                ),
                              ],
                            ),
                            SizedBox(height: verticalSpacingMedium),

                            Text(
                              "ITI Course",
                              style: labelStyle,
                            ),
                            SizedBox(height: verticalSpacingSmall),
                            TextField(
                              style: GoogleFonts.poppins(fontSize: contentFontSize),
                              decoration: InputDecoration(
                                hintText: "Enter ITI course Name",
                                border: const OutlineInputBorder(),
                                hintStyle: GoogleFonts.poppins(color: Colors.black38, fontSize: contentFontSize),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.035,
                                  vertical: screenHeight * 0.018,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  itiCourse = value;
                                });
                              },
                            ),
                            SizedBox(height: verticalSpacingMedium),

                            Text(
                              "Institution",
                              style: labelStyle,
                            ),
                            SizedBox(height: verticalSpacingSmall),
                            TextField(
                              style: GoogleFonts.poppins(fontSize: contentFontSize),
                              decoration: InputDecoration(
                                hintText: "Enter Institution Name",
                                border: const OutlineInputBorder(),
                                hintStyle: GoogleFonts.poppins(color: Colors.black38, fontSize: contentFontSize),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.035,
                                  vertical: screenHeight * 0.018,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  itiInstitution = value;
                                });
                              },
                            ),
                            SizedBox(height: verticalSpacingMedium),

                            Text(
                              "Year of Passing/Passed Out",
                              style: labelStyle,
                            ),
                            SizedBox(height: verticalSpacingSmall),
                            DropdownButtonFormField<String>(
                              initialValue: itiYear,
                              hint: Text("Select Year", style: GoogleFonts.poppins(fontSize: contentFontSize)),
                              items: years.map((String year) {
                                return DropdownMenuItem<String>(
                                  value: year,
                                  child: Text(year, style: GoogleFonts.poppins(fontSize: contentFontSize)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  itiYear = value;
                                });
                              },
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.035,
                                  vertical: screenHeight * 0.018,
                                ),
                              ),
                            ),
                            SizedBox(height: verticalSpacingMedium),
                          ],
                        ),

                      if (selectedQualification == 5 || selectedQualification == 6)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Degree",
                              style: labelStyle,
                            ),
                            SizedBox(height: verticalSpacingSmall),
                            DropdownButtonFormField<String>(
                              isExpanded: true,
                              initialValue: degree,
                              hint: Text("Select Degree", style: GoogleFonts.poppins(fontSize: contentFontSize)),
                              items: degrees.map((String deg) {
                                return DropdownMenuItem<String>(
                                  value: deg,
                                  child: Text(deg, style: GoogleFonts.poppins(fontSize: contentFontSize)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  degree = value;
                                });
                              },
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.035,
                                  vertical: screenHeight * 0.018,
                                ),
                              ),
                            ),
                            SizedBox(height: verticalSpacingMedium),

                            Text(
                              "Specialization",
                              style: labelStyle,
                            ),
                            SizedBox(height: verticalSpacingSmall),
                            TextField(
                              style: GoogleFonts.poppins(fontSize: contentFontSize),
                              decoration: InputDecoration(
                                hintText: "Enter Specialization",
                                border: const OutlineInputBorder(),
                                hintStyle: GoogleFonts.poppins(color: Colors.black38, fontSize: contentFontSize),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.035,
                                  vertical: screenHeight * 0.018,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  ugPgSpecialization = value;
                                });
                              },
                            ),
                            SizedBox(height: verticalSpacingMedium),

                            // College/University
                            Text(
                              "College/University",
                              style: labelStyle,
                            ),
                            SizedBox(height: verticalSpacingSmall),
                            TextField(
                              style: GoogleFonts.poppins(fontSize: contentFontSize),
                              decoration: InputDecoration(
                                hintText: "Enter name of the college/university",
                                border: const OutlineInputBorder(),
                                hintStyle: GoogleFonts.poppins(color: Colors.black38, fontSize: contentFontSize),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.035,
                                  vertical: screenHeight * 0.018,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  ugPgCollege = value;
                                });
                              },
                            ),
                            SizedBox(height: verticalSpacingMedium),

                            Text(
                              "Year of Passing/Passed Out",
                              style: labelStyle,
                            ),
                            SizedBox(height: verticalSpacingSmall),
                            DropdownButtonFormField<String>(
                              initialValue: ugPgYear,
                              hint: Text("Select Year", style: GoogleFonts.poppins(fontSize: contentFontSize)),
                              items: years.map((String year) {
                                return DropdownMenuItem<String>(
                                  value: year,
                                  child: Text(year, style: GoogleFonts.poppins(fontSize: contentFontSize)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  ugPgYear = value;
                                });
                              },
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.035,
                                  vertical: screenHeight * 0.018,
                                ),
                              ),
                            ),
                            SizedBox(height: verticalSpacingMedium),
                          ],
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
                                builder: (context) => const Profile3(),
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

class _QualificationPill extends StatelessWidget {
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;
  final double fontSize; // Added for responsiveness

  const _QualificationPill({
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
        padding: EdgeInsets.symmetric(horizontal: fontSize * 1.2, vertical: fontSize * 0.7), // Scaled padding
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
