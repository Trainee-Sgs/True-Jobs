import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/Apply_screens/apply_job3.dart';

class ApplyJob2 extends StatefulWidget {
  const ApplyJob2({super.key});

  @override
  State<ApplyJob2> createState() => _ApplyJob2State();
}

class _ApplyJob2State extends State<ApplyJob2> {
  // Add TextEditingController for the notice period text field
  final TextEditingController _noticePeriodController = TextEditingController();

  // State variables for the dropdowns
  String? _relocateValue;
  String? _experienceValue;

  final List<String> _relocateOptions = ['Yes', 'No', 'Maybe'];
  final List<String> _experienceOptions = [
    'Less than 1 year',
    '1-3 years',
    '3-5 years',
    '5+ years'
  ];

  @override
  void dispose() {
    _noticePeriodController.dispose();
    super.dispose();
  }

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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              Icons.arrow_back,
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
                                child: Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color:   Colors.green,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                              Expanded(
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
                          '2/3',
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 16 : 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),

                    // Main content
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Questions from Employer',
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 24 : 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.008),
                          Text(
                            'Shape your careers with every answer.',
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 16 : 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.04),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withValues(alpha: 0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Question 1
                                Text(
                                  '1. Are you willing to relocate?',
                                  style: GoogleFonts.poppins(
                                    fontSize: isTablet ? 18 : 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.015),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[400]!),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: _relocateValue,
                                      hint: Text(
                                        'Choose',
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey[600],
                                          fontSize: isTablet ? 16 : 14,
                                        ),
                                      ),
                                      items: _relocateOptions
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: GoogleFonts.poppins(
                                              color: Colors.black87,
                                              fontSize: isTablet ? 16 : 14,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _relocateValue = newValue;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.025),

                                // Question 2
                                Text(
                                  '2. Notice period',
                                  style: GoogleFonts.poppins(
                                    fontSize: isTablet ? 18 : 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.015),
                                TextField(
                                  controller: _noticePeriodController,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    hintText: 'Write your answer',
                                    hintStyle: GoogleFonts.poppins(
                                      color: Colors.grey[600],
                                      fontSize: isTablet ? 16 : 14,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          BorderSide(color: Colors.grey[400]!),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          BorderSide(color: Colors.grey[400]!),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF7C329B)),
                                    ),
                                  ),
                                  style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                    fontSize: isTablet ? 16 : 14,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.025),

                                // Question 3
                                Text(
                                  '3. Do you possess the relevant or equivalent experience?',
                                  style: GoogleFonts.poppins(
                                    fontSize: isTablet ? 18 : 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.015),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[400]!),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: _experienceValue,
                                      hint: Text(
                                        'Choose',
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey[600],
                                          fontSize: isTablet ? 16 : 14,
                                        ),
                                      ),
                                      items: _experienceOptions
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: GoogleFonts.poppins(
                                              color: Colors.black87,
                                              fontSize: isTablet ? 16 : 14,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _experienceValue = newValue;
                                        });
                                      },
                                    ),
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

            // Fixed Next Button
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ApplyJob3()));
              
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
}
