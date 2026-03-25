// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/Qualification/qualification.dart';

class PreviousJob extends StatefulWidget {
  const PreviousJob({super.key});

  @override
  State<PreviousJob> createState() => _PreviousJobState();
}

class _PreviousJobState extends State<PreviousJob> {
  final primaryColor = const Color(0xFF7C329B);

  // Dummy job list
  List<Map<String, String>> jobs = [
    {"title": "Snr. Flutter Developer", "date": "2024-2025"},
    {"title": "Jr. Flutter Developer", "date": "2022-2024"},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    final double appBarTitleFontSize = isTablet ? 22 : 18;
    final double headerFontSize = isTablet ? 18 : 16;
    final double jobTitleFontSize = isTablet ? 16 : 14;
    final double jobDateFontSize = isTablet ? 14 : 12;
    final double iconSize = isTablet ? 24 : 20;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Qualification()),
            );
          },
        ),
        title: Text(
          'Previous job details',
          style: GoogleFonts.poppins(
            fontSize: appBarTitleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),  
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? screenWidth * 0.1 : 16,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Showcase your work experience\nto strengthen your profile!',
                style: GoogleFonts.poppins(
                  fontSize: headerFontSize,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 24),

              // Jobs List
              for (var job in jobs)
                _buildJobEntry(
                  title: job["title"]!,
                  date: job["date"]!,
                  isTablet: isTablet,
                  jobTitleFontSize: jobTitleFontSize,
                  jobDateFontSize: jobDateFontSize,
                  iconSize: iconSize,
                  primaryColor: primaryColor,
                ),
              const SizedBox(height: 24),

              // Add More Button
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () {
                    _showAddJobBottomSheet(context, isTablet);
                  },
                  icon: Icon(Icons.add, color: primaryColor, size: iconSize),
                  label: Text(
                    '+Add more',
                    style: GoogleFonts.poppins(
                      fontSize: jobTitleFontSize,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJobEntry({
    required String title,
    required String date,
    required bool isTablet,
    required double jobTitleFontSize,
    required double jobDateFontSize,
    required double iconSize,
    required Color primaryColor,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: jobTitleFontSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  date,
                  style: GoogleFonts.poppins(
                    fontSize: jobDateFontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.black54,
                    size: iconSize,
                  ),
                  onPressed: () {
                    // Handle delete
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit_outlined,
                    color: Colors.black54,
                    size: iconSize,
                  ),
                  onPressed: () {
                    _showAddJobBottomSheet(context, isTablet);
                  },
                ),
              ],
            ),
          ],
        ),
        const Divider(color: Colors.grey, thickness: 1),
      ],
    );
  }

  void _showAddJobBottomSheet(BuildContext context, bool isTablet) {
    final companyController = TextEditingController();
    final roleController = TextEditingController();
    final fromYearController = TextEditingController();
    final toYearController = TextEditingController();
    final locationController = TextEditingController();

    String selectedWorkMode = "";
    String selectedJobType = "";

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Drag handle
                    Center(
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your previous job details",
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 18 : 16,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Company Name
                    _buildTextField(
                      "Name of the company",
                      "ex: ABC 55 company",
                      companyController,
                      isTablet,
                    ),

                    const SizedBox(height: 16),

                    _buildTextField(
                      "Job role/designation",
                      "ex: Flutter developer",
                      roleController,
                      isTablet,
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            "From",
                            "ex: 2019",
                            fromYearController,
                            isTablet,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            "To",
                            "ex: 2020",
                            toYearController,
                            isTablet,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    DefaultTextStyle.merge(
                      child: Text(
                        "Work Mode",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF7C329B),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          [
                            "In-Office",
                            "Work From Home",
                            "Hybrid",
                            "Field Work",
                          ].map((mode) {
                            final isSelected = selectedWorkMode == mode;
                            return ChoiceChip(
                              label: Text(mode),
                              selected: isSelected,
                              onSelected: (_) {
                                setModalState(() {
                                  selectedWorkMode = mode;
                                });
                              },
                              selectedColor: primaryColor.withValues(alpha: 0.2),
                              labelStyle: GoogleFonts.poppins(
                                color: isSelected ? primaryColor : Colors.black,
                              ),
                            );
                          }).toList(),
                    ),

                    const SizedBox(height: 16),
                    Text(
                      "Job type",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7C329B),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: ["Full Time", "Part Time", "Internship"].map((
                        type,
                      ) {
                        final isSelected = selectedJobType == type;
                        return ChoiceChip(
                          label: Text(type),
                          selected: isSelected,
                          onSelected: (_) {
                            setModalState(() {
                              selectedJobType = type;
                            });
                          },
                          selectedColor: primaryColor.withValues(alpha: 0.2),
                          labelStyle: GoogleFonts.poppins(
                            color: isSelected ? primaryColor : Colors.black,
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 16),

                    // Location
                    _buildTextField(
                      "Office location",
                      "ex: Coimbatore, Tamil Nadu",
                      locationController,
                      isTablet,
                    ),

                    const SizedBox(height: 24),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                jobs.add({
                                  "title": roleController.text,
                                  "date":
                                      "${fromYearController.text}-${toYearController.text}",
                                });
                              });
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Save",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTextField(
    String label,
    String hint,
    TextEditingController controller,
    bool isTablet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Color(0xFF7C329B),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              fontSize: isTablet ? 14 : 12,
              color: Colors.black54,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: const Color(0xFF7C329B), width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
