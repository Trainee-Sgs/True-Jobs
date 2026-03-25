// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile_setting_page.dart';

class JobPreference extends StatefulWidget {
  const JobPreference({super.key});

  @override
  State<JobPreference> createState() => _JobPreferenceState();
}

class _JobPreferenceState extends State<JobPreference> {
  List<String> selectedRoles = ["UI/UX Designer", "UI Designer"];
  List<String> selectedWorkModes = [];
  List<String> selectedJobTypes = [];
  String? selectedShift = "Day";
  String salary = "25,000";
  String payPer = "Month";
  String relocate = "Anywhere in India";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7C329B),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
        ),
        title: Text(
          'Job preferences',
          style: GoogleFonts.poppins(
            fontSize: isTablet ? 22 : 18,
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
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Preferred job role
                _buildSectionCard(
                  context,
                  title: 'Preferred job role',
                  titleColor: const Color(0xFF7C329B),
                  onEdit: () => _showJobRoleBottomSheet(context),
                  content: Wrap(
                    spacing: 8,
                    children: selectedRoles
                        .map(
                          (role) => _buildChip(
                        role,
                        const Color(0xFFE5CCFA),
                        const Color(0xFF7C329B),
                      ),
                    )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 16),
                _buildSectionCard(
                  context,
                  title: 'Preferred shift',
                  titleColor: const Color(0xFF7C329B),
                  content: Wrap(
                    spacing: 8.0,
                    children: ["Day", "Night"].map((shift) {
                      final isSelected = selectedShift == shift;
                      return ChoiceChip(
                        label: Text(shift, style: GoogleFonts.poppins()),
                        selected: isSelected,
                        onSelected: (_) {
                          setState(() {
                            selectedShift = shift;
                          });
                        },
                        selectedColor: const Color(0xFF7C329B),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                _buildSectionCard(
                  context,
                  title: 'Work mode',
                  titleColor: const Color(0xFF7C329B),
                  content: Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children:
                    [
                      "In-Office",
                      "Work From Home",
                      "Hybrid",
                      "Field Work",
                    ].map((mode) {
                      final isSelected = selectedWorkModes.contains(mode);
                      return ChoiceChip(
                        label: Text(mode, style: GoogleFonts.poppins()),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              selectedWorkModes.add(mode);
                            } else {
                              selectedWorkModes.remove(mode);
                            }
                          });
                        },
                        selectedColor: const Color(0xFF7C329B),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),

                _buildSectionCard(
                  context,
                  title: 'Job type',
                  titleColor: const Color(0xFF7C329B),
                  content: Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: ["Full Time", "Part Time", "Internship"].map((
                        jobType,
                        ) {
                      final isSelected = selectedJobTypes.contains(jobType);
                      return ChoiceChip(
                        label: Text(jobType, style: GoogleFonts.poppins()),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              selectedJobTypes.add(jobType);
                            } else {
                              selectedJobTypes.remove(jobType);
                            }
                          });
                        },
                        selectedColor: const Color(0xFF7C329B),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                _buildSectionCard(
                  context,
                  title: 'Salary expectation',
                  titleColor: const Color(0xFF7C329B),
                  onEdit: () => _showSalaryBottomSheet(context),
                  content: Row(
                    children: [
                      const Icon(
                        Icons.currency_rupee,
                        size: 20,
                        color: Colors.black,
                      ),
                      Text(
                        "$salary /$payPer",
                        style: GoogleFonts.poppins(
                          fontSize: isTablet ? 16 : 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildSectionCard(
                  context,
                  title: 'Willing to relocate',
                  titleColor: const Color(0xFF7C329B),
                  onEdit: () => _showRelocateBottomSheet(context),
                  content: Text(
                    relocate,
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 16 : 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: isTablet ? 120 : 100),
              ],
            ),
          ),
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
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C329B),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Save changes',
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 18 : 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(
      BuildContext context, {
        required String title,
        required Widget content,
        required Color titleColor,
        FontWeight titleFontWeight = FontWeight.w400,
        VoidCallback? onEdit,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: isTablet ? 18 : 16,
                  fontWeight: FontWeight.w400,
                  color: titleColor,
                ),
              ),
              if (onEdit != null)
                IconButton(
                  icon: Icon(Icons.edit_outlined, color: titleColor),
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

  Widget _buildChip(String label, Color bg, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }

  void _showJobRoleBottomSheet(BuildContext context) {
    final List<String> allRolesMaster = [
      "UI/UX Designer",
      "UI Designer",
      "Graphic Designer",
    ];
    
    List<String> tempSelected = List.from(selectedRoles);
    
    TextEditingController searchController = TextEditingController();
    String searchQuery = "";

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: StatefulBuilder(
              builder: (context, setModalState) {
                List<String> filteredRoles = allRolesMaster
                    .where((role) =>
                    role.toLowerCase().contains(searchQuery.toLowerCase()))
                    .toList();

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
                  // Title Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Preferred job role",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF7C329B),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search job roles",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      setModalState(() {
                        searchQuery = value;
                      });
                    },
                  ),

                  const SizedBox(height: 12),
                  
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: filteredRoles.map((role) {
                          final isSelected = tempSelected.contains(role);
                          return ChoiceChip(
                            label: Text(role, style: GoogleFonts.poppins()),
                            selected: isSelected,
                            onSelected: (selected) {
                              setModalState(() {
                                if (selected) {
                                  if (tempSelected.length < 5) {
                                    tempSelected.add(role);
                                  }
                                } else {
                                  tempSelected.remove(role);
                                }
                              });
                            },
                            selectedColor: const Color(0xFF7C329B),
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7C329B),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedRoles = tempSelected;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );

          },
            )
        );
      },
    );
  }


  void _showSalaryBottomSheet(BuildContext context) {
    TextEditingController salaryController = TextEditingController(
      text: salary,
    );
    String tempPayPer = payPer;

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
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Salary expectation",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF7C329B),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: salaryController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.currency_rupee),
                      hintText: "Enter here",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: ["Hour", "Day", "Week", "Month"].map((option) {
                      return ChoiceChip(
                        label: Text(option, style: GoogleFonts.poppins()),
                        selected: tempPayPer == option,
                        onSelected: (_) {
                          setModalState(() {
                            tempPayPer = option;
                          });
                        },
                        selectedColor: const Color(0xFF7C329B),
                        labelStyle: TextStyle(
                          color: tempPayPer == option
                              ? Colors.white
                              : Colors.black,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7C329B),
                          ),
                          onPressed: () {
                            setState(() {
                              salary = salaryController.text;
                              payPer = tempPayPer;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
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

  void _showRelocateBottomSheet(BuildContext context) {
    String tempRelocate = relocate;

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
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Willing to relocate",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF7C329B),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Column(
                    children: [
                      RadioListTile(
                        value: "Anywhere in India",
                        groupValue: tempRelocate,
                        onChanged: (val) {
                          setModalState(() {
                            tempRelocate = val!;
                          });
                        },
                        title: Text(
                          "Anywhere in India",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                      RadioListTile(
                        value: "No, prefer to stay local",
                        groupValue: tempRelocate,
                        onChanged: (val) {
                          setModalState(() {
                            tempRelocate = val!;
                          });
                        },
                        title: Text(
                          "No, prefer to stay local",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7C329B),
                          ),
                          onPressed: () {
                            setState(() {
                              relocate = tempRelocate;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
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