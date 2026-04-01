import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/Qualification/qualification.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  late List<String> skills;
  late List<String> allSkills; 

  @override
  void initState() {
    super.initState();
    skills = [
      'UI/UX Design',
      'UI Design',
      'UX Research',
      'Graphic Design',
      'Figma',
      'UI Design',
      'Balsamiq',
    ];
    allSkills = [
      'UI/UX Design',
      'UI Design',
      'UX Research',
      'Graphic Design',
      'Figma',
      'Balsamiq',
      'Adobe XD',
      'Sketch',
      'InVision',
      'Prototyping',
      'User Testing',
      'Wireframing',
      'Interaction Design',
      'Visual Design',
    ];
  }
  Future<void> showAddSkillsPopup(BuildContext context) async {
    List<String> selectedSkills = List.from(skills);

    TextEditingController searchController = TextEditingController();
    List<String> filteredSkills = List.from(allSkills);

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            void updateFilter(String query) {
              final filter = allSkills
                  .where(
                    (skill) => skill.toLowerCase().contains(query.toLowerCase()),
              )
                  .toList();
              setModalState(() {
                filteredSkills = filter;
              });
            }
            void addSkill(String skill) {
              if (!selectedSkills.contains(skill)) {
                setModalState(() {
                  selectedSkills.add(skill);
                });
              }
            }
            void removeSkill(String skill) {
              setModalState(() {
                selectedSkills.remove(skill);
              });
            }

            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add skills',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF7C329B),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.black),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Select the skills you have!',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF7C329B),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: searchController,
                      onChanged: (value) => updateFilter(value),
                      style: GoogleFonts.poppins(fontSize: 14),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                        hintText: 'Search Here',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade500,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFF7C329B), width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                        isDense: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: selectedSkills.map((skill) {
                        return Chip(
                          backgroundColor: const Color(0xFFBFA3F9).withValues(alpha: 0.7),
                          label: Text(
                            skill,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          deleteIcon: const Icon(Icons.close, color: Colors.white, size: 18),
                          onDeleted: () {
                            removeSkill(skill);
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 150,
                      child: filteredSkills.isNotEmpty
                          ? ListView.separated(
                        itemCount: filteredSkills.length,
                        separatorBuilder: (_, _) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final skill = filteredSkills[index];
                          final selected = selectedSkills.contains(skill);
                          return ListTile(
                            title: Text(
                              skill,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight:
                                selected ? FontWeight.w600 : FontWeight.w400,
                                color: selected ? const Color(0xFF7C329B) : Colors.black,
                              ),
                            ),
                            trailing: selected
                                ? const Icon(Icons.check, color: Color(0xFF7C329B))
                                : null,
                            onTap: () {
                              if (selected) {
                                removeSkill(skill);
                              } else {
                                addSkill(skill);
                              }
                            },
                          );
                        },
                      )
                          : Center(
                        child: Text(
                          'No skills found',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                skills = selectedSkills.toSet().toList();
                              });
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7C329B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: Text(
                              "Save",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 12),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;
    final horizontalPadding = isTablet ? screenWidth * 0.08 : screenWidth * 0.05;
    final verticalPadding = isTablet ? screenHeight * 0.03 : screenHeight * 0.02;
    final skillItemHeight = isTablet ? 70.0 : 60.0;
    final titleFontSize = isTablet ? 24.0 : 20.0;
    final subtitleFontSize = isTablet ? 18.0 : 16.0;
    final skillFontSize = isTablet ? 18.0 : 16.0;
    final addMoreFontSize = isTablet ? 16.0 : 14.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7C329B), 
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          iconSize: isTablet ? 28 : 24,
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Qualification()),
          ),
        ),
        title: Text(
          'Skills',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: titleFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Enhance Your Profile with Skills for a Better Career Match!',
                style: GoogleFonts.poppins(
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF7C329B),
                  height: 1.4,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                '(Drag and drop the skills to arrange perfectly)',
                style: GoogleFonts.poppins(
                  fontSize: isTablet ? 14.0 : 12.0,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF6B7280),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              
              ReorderableListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: skills.length,
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) newIndex -= 1;
                    final item = skills.removeAt(oldIndex);
                    skills.insert(newIndex, item);
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    key: ValueKey(skills[index] + index.toString()),
                    margin: EdgeInsets.only(bottom: screenHeight * 0.015),
                    height: skillItemHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE5E7EB),
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.015,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: Text(
                              skills[index],
                              style: GoogleFonts.poppins(
                                fontSize: skillFontSize,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF374151),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                skills.removeAt(index);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                Icons.delete_outline,
                                color: const Color(0xFF9CA3AF),
                                size: isTablet ? 24 : 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => showAddSkillsPopup(context),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06,
                    vertical: screenHeight * 0.015,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: screenWidth * 0.52),
                      Icon(
                        Icons.add,
                        color: const Color(0xFF7C329B),
                        size: isTablet ? 20 : 18,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        'Add more',
                        style: GoogleFonts.poppins(
                          fontSize: addMoreFontSize,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF7C329B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
