import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_RECRUITER/functions_rec/Search/rec_search_display.dart';



class FilterScreen1 extends StatefulWidget {
  const FilterScreen1({super.key});

  @override
  State<FilterScreen1> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen1> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => const FilterBottomSheet(),
      );
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const RecSavedProfileScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 88,
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xFF7C329B)),
          ),
        ],
      ),
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  int selectedIndex = 0;

  final List<String> filterTitles = [
    "Keywords",
    "Location",
    "Experience",
    "Education",
    "Salary",
    "Work Mode",
    "Job Type",
    "Last Active",
    "Shift",
    "Language",
    "Sort By",
  ];

  final Map<String, bool> selectedOptions = {};
  String? selectedSalaryType;
  final Set<String> selectedChips = {};

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Filter options",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF7C329B),
                        height: 1,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close_rounded, color: Colors.black),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RecSavedProfileScreen()),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              // Content
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      color: Colors.grey.shade200,
                      child: ListView.builder(
                        itemCount: filterTitles.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            selected: selectedIndex == index,
                            selectedTileColor: Colors.white,
                            title: Text(
                              filterTitles[index],
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: selectedIndex == index
                                    ? FontWeight.w500
                                    : FontWeight.w400,
                                color: selectedIndex == index
                                    ? const Color(0xFF7C329B)
                                    : Colors.black,
                                height: 1,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Expanded(child: _buildFilterContent(selectedIndex)),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedOptions.clear();
                                      selectedChips.clear();
                                      selectedSalaryType = null;
                                    });
                                  },
                                  child: Text(
                                    "Clear filters",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.black,
                                      height: 1,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF7C329B),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const RecSavedProfileScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Update",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.white,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
    );
  }
  
  Widget _buildFilterContent(int index) {
    switch (index) {
      case 0: // Keywords
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search & select skills/role",
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, height: 1),
            ),
            const SizedBox(height: 10),
            TextField(
              style: GoogleFonts.poppins(fontSize: 14, height: 1),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey, height: 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
            ),
            const SizedBox(height: 10),
            _checkbox("UI/UX"),
            _checkbox("UI Developer"),
            Wrap(
              children: [_chip("UI/UX"), _chip("Accounts"), _chip("Electrician")],
            ),
          ],
        );

      case 1: // Location
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select locations",
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, height: 1),
            ),
            const SizedBox(height: 10),
            TextField(
              style: GoogleFonts.poppins(fontSize: 14, height: 1),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey, height: 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(children: [_chip("Chennai")]),
          ],
        );

      case 2: // Experience
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Experience level", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, height: 1)),
            const SizedBox(height: 10),
            ToggleButtons(
              isSelected: const [true, false],
              children: const [Text("Month"), Text("Year")],
              onPressed: (i) {},
            ),
            const SizedBox(height: 16),
            _numberField("Minimum"),
            _numberField("Maximum"),
          ],
        );

      case 3: // Education
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Choose the education level", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, height: 1)),
            _checkbox("Below 10th"),
            _checkbox("10th"),
            _checkbox("12th"),
            _checkbox("Diploma"),
            _checkbox("ITI"),
            _checkbox("UG"),
            _checkbox("PG"),
          ],
        );

      case 4: // Salary
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Salary expectation", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, height: 1)),
            const SizedBox(height: 10),
            _radio("Hour"),
            _radio("Day"),
            _radio("Week"),
            _radio("Month"),
            const SizedBox(height: 16),
            _numberField("Minimum Pay"),
            _numberField("Maximum Pay"),
          ],
        );

      case 5: // Work Mode
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Preferred work mode", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, height: 1)),
            _checkbox("In-office"),
            _checkbox("Work from home"),
            _checkbox("Hybrid"),
            _checkbox("Field work"),
          ],
        );

      case 6: // Job Type
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Preferred job type", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, height: 1)),
            _checkbox("Full time"),
            _checkbox("Part-time"),
            _checkbox("Internship"),
          ],
        );

      case 7: // Last Active
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Applicant last active", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, height: 1)),
            _radio("7 days"),
            _radio("15 days"),
            _radio("1 month"),
            _radio("2 months"),
            _radio("5 months"),
          ],
        );

      case 8: // Shift
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shift preference", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, height: 1)),
            _checkbox("Day shift"),
            _checkbox("Night shift"),
          ],
        );

      case 9: // Language
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Preferred language", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, height: 1)),
            _checkbox("English"),
            _checkbox("Hindi"),
            _checkbox("Tamil"),
          ],
        );

      case 10: // Sort By
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sort by", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, height: 1)),
            _checkbox("Relevance"),
            _checkbox("Salary high to low"),
            _checkbox("Salary low to high"),
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _checkbox(String title) {
    return CheckboxListTile(
      value: selectedOptions[title] ?? false,
      onChanged: (val) {
        setState(() {
          selectedOptions[title] = val ?? false;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(title, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, height: 1)),
    );
  }

  Widget _radio(String title) {
    return RadioListTile<String>(
      value: title,
      groupValue: selectedSalaryType,
      onChanged: (val) {
        setState(() {
          selectedSalaryType = val;
        });
      },
      title: Text(title, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, height: 1)),
    );
  }

  Widget _numberField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        keyboardType: TextInputType.number,
        style: GoogleFonts.poppins(fontSize: 14, height: 1),
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey, height: 1),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
      ),
    );
  }

  Widget _chip(String label) {
    final isSelected = selectedChips.contains(label);
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 8),
      child: ChoiceChip(
        label: Text(label, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, height: 1)),
        selected: isSelected,
        selectedColor: Colors.deepPurple.shade100,
        onSelected: (val) {
          setState(() {
            if (val) {
              selectedChips.add(label);
            } else {
              selectedChips.remove(label);
            }
          });
        },
      ),
    );
  }
}

class nish extends StatelessWidget {
  const nish({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.purple));
  }
}
