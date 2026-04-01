import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/Qualification/previous_job.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/Qualification/education.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/Qualification/language_proficiency.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/Qualification/skills.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile_setting_page.dart';

class Qualification extends StatefulWidget {
  const Qualification({super.key});

  @override
  State<Qualification> createState() => _QualificationState();
}

class _QualificationState extends State<Qualification> {
  int _years = 2;
  int _months = 8;

  final TextEditingController _yearsController = TextEditingController();
  final TextEditingController _monthsController = TextEditingController();

  @override
  void dispose() {
    _yearsController.dispose();
    _monthsController.dispose();
    super.dispose();
  }

  void _showExperienceBottomSheet() {
    _yearsController.text = _years.toString();
    _monthsController.text = _months.toString();

    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius:
        BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true, 
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add total years of experience',
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 18 : 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF7C329B),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Years',
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 14 : 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF7C329B),
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextField(
                            controller: _yearsController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(8),
                              ),
                              hintText: 'Enter',
                              contentPadding:
                              const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Months',
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 14 : 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF7C329B),
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextField(
                            controller: _monthsController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(8),
                              ),
                              hintText: 'Enter',
                              contentPadding:
                              const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(12),
                          ),
                          side: BorderSide(
                              color: Colors.grey.shade400),
                        ),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 14 : 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          final years =
                          int.tryParse(_yearsController.text);
                          final months =
                          int.tryParse(_monthsController.text);

                          if (years == null ||
                              years < 0 ||
                              months == null ||
                              months < 0 ||
                              months > 11) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please enter valid years and months (0-11)'),
                              ),
                            );
                            return;
                          }

                          setState(() {
                            _years = years;
                            _months = months;
                          });
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(0xFF7C329B),
                          padding: const EdgeInsets.symmetric(
                              vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 14 : 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7C329B),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
        ),
        title: Text(
          'Qualifications',
          style: GoogleFonts.poppins(
            fontSize: isTablet ? 22 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? screenWidth * 0.1 : 16,
          vertical: 16,
        ),
        child: Column(
          children: [
            _buildSectionCard(
              context,
              title: 'Education',
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Education()),
                );
              },
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Highest Qualification: UG',
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 16 : 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Icon(
                          Icons.school,
                          size: isTablet ? 24 : 20,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'B.E. Artificial Intelligence\nEngineering',
                              style: GoogleFonts.poppins(
                                fontSize: isTablet ? 16 : 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Batch: 2018',
                                style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 12 : 10,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionCard(
              context,
              title: 'Skills',
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Skills()),
                );
              },
              content: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  _buildSkillChip('UI/Ux Design', isTablet),
                  _buildSkillChip('UI Design', isTablet),
                  _buildSkillChip('Ux Research', isTablet),
                  _buildSkillChip('Graphic Design', isTablet),
                  _buildSkillChip('Figma', isTablet),
                  _buildSkillChip('UI Design', isTablet),
                  _buildSkillChip('UI/Ux Design', isTablet),
                  _buildSkillChip('UI Design', isTablet),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionCard(
              context,
              title: 'Certifications',
              onEdit: () {
              },
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'IOS Development',
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 16 : 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Never expires',
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 12 : 10,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionCard(
              context,
              title: 'Total Years of Experience',
              onEdit: _showExperienceBottomSheet,
              content: Text(
                '$_years Years $_months Months',
                style: GoogleFonts.poppins(
                  fontSize: isTablet ? 16 : 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionCard(
              context,
              title: 'Previous job details',
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PreviousJob()),
                );
              },
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildJobDetails(
                    context,
                    jobTitle: 'Snr. Flutter Developer',
                    company: 'ABC 55 company',
                    location: 'Coimbatore',
                    period: '2024-2025',
                    isTablet: isTablet,
                  ),
                  const SizedBox(height: 16),
                  _buildJobDetails(
                    context,
                    jobTitle: 'Jr. Flutter Developer',
                    company: 'ABC 55 company',
                    location: 'Coimbatore',
                    period: '2022-2024',
                    isTablet: isTablet,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionCard(
              context,
              title: 'Language proficiency',
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LanguageProficiency(),
                  ),
                );
              },
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'English (Advanced)',
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 16 : 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7C329B),
                    ),
                  ),
                  Text(
                    'Tamil',
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 16 : 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(
      BuildContext context, {
        required String title,
        required void Function() onEdit,
        required Widget content,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: isTablet ? 18 : 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF7C329B),
                ),
              ),
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
          const SizedBox(height: 12),
          content,
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label, bool isTablet) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE5CCFA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: isTablet ? 14 : 12,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF7C329B),
        ),
      ),
    );
  }

  Widget _buildJobDetails(
      BuildContext context, {
        required String jobTitle,
        required String company,
        required String location,
        required String period,
        required bool isTablet,
      }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Icon(
            Icons.circle,
            size: isTablet ? 10 : 8,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                jobTitle,
                style: GoogleFonts.poppins(
                  fontSize: isTablet ? 16 : 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                '1 yr Exp @ $company',
                style: GoogleFonts.poppins(
                  fontSize: isTablet ? 14 : 12,
                  color: Colors.black54,
                ),
              ),
              Text(
                location,
                style: GoogleFonts.poppins(
                  fontSize: isTablet ? 14 : 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            period,
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 12 : 10,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
