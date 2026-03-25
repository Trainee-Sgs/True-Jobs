import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/Home_screens/home.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
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
          MaterialPageRoute(builder: (context) => const Home()),
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
            height: 100,
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
    "Sort by",
    "Date posted",
    "Experience",
    "Salary",
    "Work mode",
    "Job type",
    "Shift",
    "Location",
    "Role",
    "Education",
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      "Filter options",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7C329B),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
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
                    // Left Navigation Panel
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
                                fontWeight: selectedIndex == index
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: selectedIndex == index
                                    ? Color(0xFF7C329B)
                                    : Colors.black,
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
                                    style: GoogleFonts.poppins(color: Colors.black),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF7C329B),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ),
                                    );
                                  },
                                  child:  Text(
                                    "Update",
                                    style: GoogleFonts.poppins(color: Colors.white),
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
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _checkbox("Physically challenged"),
            _checkbox("Relevance"),
            _checkbox("Salary high to low"),
            _checkbox("Salary low to high"),
          ],
        );
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _checkbox("Last 24 hours"),
            _checkbox("Last 3 days"),
            _checkbox("Last 7 days"),
            _checkbox("Last 15 days"),
            _checkbox("30 & above days"),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToggleButtons(
              isSelected: const [true, true],
              children: const [Text("Month"), Text("Year")],
              onPressed: (i) {},
            ),
            const SizedBox(height: 16),
            _numberField("Minimum"),
            _numberField("Maximum"),
          ],
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _radio("Fixed salary"),
            _radio("Fixed + incentive"),
            _radio("Incentive only"),
            const SizedBox(height: 16),
            const Text("Pay per"),
            Wrap(
              spacing: 8,
              children: [
                _chip("Hour"),
                _chip("Day"),
                _chip("Week"),
                _chip("Month"),
              ],
            ),
            const SizedBox(height: 16),
            _numberField("Minimum Pay"),
            _numberField("Maximum Pay"),
          ],
        );
      case 4:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _checkbox("In-office"),
            _checkbox("Work from home"),
            _checkbox("Hybrid"),
            _checkbox("Field work"),
          ],
        );
      case 5:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _checkbox("Full time"),
            _checkbox("Part-time"),
            _checkbox("Internship"),
          ],
        );
      case 6:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_checkbox("Day shift"), _checkbox("Night shift")],
        );
      case 7:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select locations"),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(children: [_chip("Chennai"), _chip("Bangalore")]),
          ],
        );
      case 8:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select role"),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              children: [
                _chip("UI/UX"),
                _chip("Accounts"),
                _chip("Electrician"),
              ],
            ),
          ],
        );
      case 9:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _checkbox("Below 10th"),
            _checkbox("10th"),
            _checkbox("12th"),
            _checkbox("Diploma"),
            _checkbox("ITI"),
            _checkbox("UG"),
            _checkbox("PG"),
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
      title: Text(title),
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
      title: Text(title),
    );
  }

  Widget _numberField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _chip(String label) {
    final isSelected = selectedChips.contains(label);
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 8),
      child: ChoiceChip(
        label: Text(label),
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
