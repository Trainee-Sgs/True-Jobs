import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/Qualification/qualification.dart';

class LanguageProficiency extends StatefulWidget {
  const LanguageProficiency({super.key});

  @override
  State<LanguageProficiency> createState() => _LanguageProficiencyState();
}

class _LanguageProficiencyState extends State<LanguageProficiency> {
  final primaryColor = const Color(0xFF7C329B);

  List<String> languages = ["English (Advanced)", "Tamil", "Japanese"];

  final List<String> availableLanguages = [
    "Malayalam",
    "Kannada",
    "Telugu",
    "Hindi",
    "Spanish",
  ];

  List<String> selectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    final double appBarTitleFontSize = isTablet ? 22 : 18;
    final double headerFontSize = isTablet ? 18 : 16;
    final double subHeaderFontSize = isTablet ? 14 : 12;
    final double languageTextFontSize = isTablet ? 16 : 14;
    final double iconSize = isTablet ? 24 : 20;
    final double paddingHorizontal = isTablet ? screenWidth * 0.1 : 16.0;

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
          'Language proficiency',
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
            horizontal: paddingHorizontal,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Your Language Skills!',
                style: GoogleFonts.poppins(
                  fontSize: headerFontSize,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '(Drag and drop the skills to arrange perfectly)',
                style: GoogleFonts.poppins(
                  fontSize: subHeaderFontSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24),

              // Language list
              for (var lang in languages) ...[
                _buildLanguageEntry(
                  language: lang,
                  isDefault: lang.contains("English"),
                  languageTextFontSize: languageTextFontSize,
                  iconSize: iconSize,
                ),
                const SizedBox(height: 8),
              ],

              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: _openLanguagePopup,
                  icon: Icon(Icons.add, color: primaryColor, size: iconSize),
                  label: Text(
                    'Add more',
                    style: GoogleFonts.poppins(
                      fontSize: languageTextFontSize,
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

  Widget _buildLanguageEntry({
    required String language,
    required bool isDefault,
    required double languageTextFontSize,
    required double iconSize,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: GoogleFonts.poppins(
                fontSize: languageTextFontSize,
                fontWeight: isDefault ? FontWeight.w600 : FontWeight.w500,
                color: Colors.black,
              ),
            ),
            if (!isDefault)
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.black54,
                  size: iconSize,
                ),
                onPressed: () {
                  setState(() {
                    languages.remove(language);
                  });
                },
              ),
          ],
        ),
        const Divider(color: Colors.grey, thickness: 1),
      ],
    );
  }

  void _openLanguagePopup() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: StatefulBuilder(
              builder: (context, setModalState) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    runSpacing: 16,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add languages you know",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
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
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Search Here",
                          hintStyle: GoogleFonts.poppins(fontSize: 14),
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                      const SizedBox(height: 16),

                      Wrap(
                        spacing: 8,
                        runSpacing: 8,

                        children: availableLanguages.map((lang) {
                          final isSelected = selectedLanguages.contains(lang);
                          return FilterChip(
                            selected: isSelected,
                            label: Text(
                              lang,
                              style: GoogleFonts.poppins(
                                color: isSelected ? Colors.white : primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            selectedColor: primaryColor,
                            checkmarkColor: Colors.white,
                            backgroundColor: Colors.grey[200],
                            onSelected: (selected) {
                              setModalState(() {
                                if (selected) {
                                  selectedLanguages.add(lang);
                                } else {
                                  selectedLanguages.remove(lang);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    languages.addAll(selectedLanguages);
                                    selectedLanguages.clear();
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Save",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
