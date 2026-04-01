import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/Qualification/qualification.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  String highestQualification = "UG"; // default

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    // Responsive font sizes
    final double titleFontSize = isTablet ? 22 : 18;
    final double subTitleFontSize = isTablet ? 18 : 16;
    final double labelFontSize = isTablet ? 16 : 14;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7C329B),
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
          'Education',
          style: GoogleFonts.poppins(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? screenWidth * 0.1 : 16,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Update Your Education Details\nto Attract Employers!',
                  style: GoogleFonts.poppins(
                    fontSize: subTitleFontSize,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF7C329B),
                  ),
                ),
                const SizedBox(height: 24),

                _buildInputCard(
                  context,
                  label: 'Highest Qualification',
                  isTablet: isTablet,
                  content: Text(
                    highestQualification,
                    style: GoogleFonts.poppins(
                      fontSize: labelFontSize,
                      color: Colors.black,
                    ),
                  ),
                  onEdit: () =>
                      _showQualificationBottomSheet(context, isTablet),
                ),

                const SizedBox(height: 16),
                _buildInputWithLabel(
                  context,
                  label: 'Degree',
                  child: _buildDropDownField(
                    'Bachelor of Engineering',
                    isTablet,
                  ),
                  isTablet: isTablet,
                ),
                const SizedBox(height: 16),
                _buildInputWithLabel(
                  context,
                  label: 'Specialization',
                  child: _buildTextField(
                    'Artificial Intelligence Engineering',
                    isTablet,
                  ),
                  isTablet: isTablet,
                ),
                const SizedBox(height: 16),
                _buildInputWithLabel(
                  context,
                  label: 'College/University',
                  child: _buildTextField('Anna University', isTablet),
                  isTablet: isTablet,
                ),
                const SizedBox(height: 16),
                _buildInputWithLabel(
                  context,
                  label: 'Year of Passing/Passed Out',
                  child: _buildDropDownField('2018', isTablet),
                  isTablet: isTablet,
                ),
                SizedBox(
                  height: isTablet ? 120 : 100,
                ), // Spacing for bottom buttons
              ],
            ),
          ),

          // Bottom Buttons
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? screenWidth * 0.1 : 16,
                vertical: 16,
              ),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF7C329B),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Color(0xFF7C329B)),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.poppins(
                          fontSize: isTablet ? 18 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7C329B),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: GoogleFonts.poppins(
                          fontSize: isTablet ? 18 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputCard(
    BuildContext context, {
    required String label,
    required bool isTablet,
    required Widget content,
    required VoidCallback onEdit,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          content,
          IconButton(
            icon: Icon(
              Icons.edit_outlined,
              size: isTablet ? 24 : 20,
              color: Colors.black,
            ),
            onPressed: onEdit,
          ),
        ],
      ),
    );
  }

  Widget _buildInputWithLabel(
    BuildContext context, {
    required String label,
    required Widget child,
    required bool isTablet,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: isTablet ? 16 : 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }

  Widget _buildTextField(String hintText, bool isTablet) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: isTablet ? 16 : 14,
          color: Colors.black,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
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
          borderSide: const BorderSide(color: Color(0xFF7C329B), width: 2),
        ),
      ),
      style: GoogleFonts.poppins(
        fontSize: isTablet ? 16 : 14,
        color: Colors.black,
      ),
    );
  }

  Widget _buildDropDownField(String hintText, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hintText,
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 16 : 14,
              color: Colors.black,
            ),
          ),
          Icon(Icons.keyboard_arrow_down, size: isTablet ? 24 : 20),
        ],
      ),
    );
  }

  void _showQualificationBottomSheet(BuildContext context, bool isTablet) {
    String tempSelection = highestQualification;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  Text(
                    "Highest Qualification",
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 20 : 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF7C329B),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Subtitle
                  Text(
                    "Select your highest qualification",
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 16 : 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:
                        [
                          "Below 10th",
                          "10th",
                          "12th",
                          "Diploma",
                          "ITI",
                          "UG",
                          "PG",
                        ].map((item) {
                          final bool isSelected = tempSelection == item;
                          return ChoiceChip(
                            label: Text(
                              item,
                              style: GoogleFonts.poppins(
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            selected: isSelected,
                            selectedColor: const Color(
                              0xFF7C329B,
                            ).withValues(alpha: 0.15),
                            backgroundColor: Colors.grey[200],
                            labelStyle: TextStyle(
                              color: isSelected
                                  ? const Color(0xFF7C329B)
                                  : Colors.black,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: isSelected
                                    ? const Color(0xFF7C329B)
                                    : Colors.grey.shade300,
                              ),
                            ),
                            onSelected: (selected) {
                              setModalState(() {
                                tempSelection = item;
                              });
                            },
                          );
                        }).toList(),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF7C329B),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(color: Color(0xFF7C329B)),
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              highestQualification = tempSelection;
                            });
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7C329B),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Save",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
