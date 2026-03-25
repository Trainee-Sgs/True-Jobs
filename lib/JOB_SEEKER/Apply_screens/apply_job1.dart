import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/Apply_screens/apply_job2.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile_setting_page.dart';

class ApplyJob1 extends StatefulWidget {
  const ApplyJob1({super.key});

  @override
  State<ApplyJob1> createState() => _ApplyJob1State();
}

class _ApplyJob1State extends State<ApplyJob1> {
  bool showCVTemplates = false;
  int selectedTemplate = 1;
  bool cvByTrueJobSelected = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ---------- Scrollable Content ----------
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Header Section
                    Container(
                      width: double.infinity,
                      color: const Color(0xFF7C329B),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.015,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.close,
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
                                flex: 2,
                                child: Container(
                                  height: 4,
                                  color: Colors.grey[300],
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
                          '1/3',
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 16 : 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),

                    // ---------- Main Content ----------
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Share your CV with us.',
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 24 : 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.008),
                          Text(
                            'Select one option',
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 16 : 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.025),

                          // CV by True Job Option
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                cvByTrueJobSelected = true;
                                showCVTemplates = !showCVTemplates;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(screenWidth * 0.04),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: cvByTrueJobSelected
                                      ? const Color(0xFF7C329B)
                                      : Colors.grey[300]!,
                                  width: cvByTrueJobSelected ? 2 : 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'CV by True Job',
                                          style: GoogleFonts.poppins(
                                            fontSize: isTablet ? 18 : 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF7C329B),
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.005),
                                        Text(
                                          'Created using your profile information',
                                          style: GoogleFonts.poppins(
                                            fontSize: isTablet ? 14 : 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (cvByTrueJobSelected)
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF7C329B),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.radio_button_checked,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),

                          // CV Templates Section
                          if (showCVTemplates) ...[
                            SizedBox(height: screenHeight * 0.015),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfilePage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'View & edit profile',
                                  style: GoogleFonts.poppins(
                                    fontSize: isTablet ? 14 : 12,
                                    color: const Color(0xFF7C329B),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Text(
                              'Select one CV template',
                              style: GoogleFonts.poppins(
                                fontSize: isTablet ? 16 : 14,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),

                            // CV Templates Grid
                            Row(
                              children: List.generate(4, (index) {
                                final templateIndex = index + 1;
                                final isSelected =
                                    selectedTemplate == templateIndex;

                                return Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedTemplate = templateIndex;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: index < 3
                                            ? screenWidth * 0.02
                                            : 0,
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: screenHeight * 0.12,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: isSelected
                                                    ? const Color(0xFF7C329B)
                                                    : Colors.grey[300]!,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: _getTemplateColor(
                                                  templateIndex),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(
                                                      screenWidth * 0.01),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12),
                                                        ),
                                                        child: Icon(
                                                          Icons.remove_red_eye,
                                                          size: isTablet
                                                              ? 16
                                                              : 12,
                                                          color:
                                                              Colors.grey[600],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          screenWidth * 0.01,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withValues(alpha: 0.8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: screenWidth * 0.01),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: screenHeight * 0.008),
                                          Row(
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: isSelected
                                                      ? Colors.green
                                                      : Colors.transparent,
                                                  border: Border.all(
                                                    color: isSelected
                                                        ? Colors.green
                                                        : Colors.grey[400]!,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: isSelected
                                                    ? const Icon(
                                                        Icons.check,
                                                        color: Colors.white,
                                                        size: 14,
                                                      )
                                                    : null,
                                              ),
                                              SizedBox(width: screenWidth * 0.01),
                                              Text(
                                                '$templateIndex.',
                                                style: GoogleFonts.poppins(
                                                  fontSize:
                                                      isTablet ? 14 : 12,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                          ],
                           SizedBox(height: screenHeight * 0.02),

                          // Uploaded Resume Option
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(screenWidth * 0.04),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: !cvByTrueJobSelected
                                    ? const Color(0xFF7C329B)
                                    : Colors.grey[300]!,
                                width: !cvByTrueJobSelected ? 2 : 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: screenWidth * 0.03),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Upload your resume ',
                                            style: GoogleFonts.poppins(
                                              fontSize: isTablet ? 16 : 14,
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xFF7C329B),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: screenHeight * 0.005),
                                      Row(
                                        children: [
                                          Text(
                                            '.pdf or .docx only (5 MB maximum)',
                                            style: GoogleFonts.poppins(
                                              fontSize: isTablet ? 12 : 11,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                if (!cvByTrueJobSelected)
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey[400]!,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ---------- Fixed Next Button ----------
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ApplyJob2()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C329B),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Next',
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 18 : 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTemplateColor(int index) {
    switch (index) {
      case 1:
        return Colors.grey[100]!;
      case 2:
        return Colors.pink[50]!;
      case 3:
        return Colors.blue[50]!;
      case 4:
        return Colors.green[50]!;
      default:
        return Colors.grey[100]!;
    }
  }
}
