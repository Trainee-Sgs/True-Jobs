// ignore_for_file: unused_element_parameter
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile2.dart';

class Profil1 extends StatefulWidget {
  const Profil1({super.key});

  @override
  Profil1State createState() => Profil1State();
}

class Profil1State extends State<Profil1> {
  final purpleColor = const Color(0xFF7C329B);

  String gender = 'Male';
  bool isPhysicallyChallenged = false;
  List<String> conditionTypes = [];
  List<String> affectedAreas = [];
  DateTime? selectedDate;

  // Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  // Validation
  bool canGoToNext() {
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        gender.isNotEmpty &&
        (isPhysicallyChallenged
            ? conditionTypes.isNotEmpty && affectedAreas.isNotEmpty
            : true);
  }

  // Date Picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Multi Selection Dialog
  void _showSelectionDialog(
    BuildContext context,
    String title,
    List<String> options,
    List<String> selectedOptions,
    Function(List<String>) onSave,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        List<bool> isChecked = List.generate(
          options.length,
          (index) => selectedOptions.contains(options[index]),
        );

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateDialog) {
            return AlertDialog(
              title: Text(title),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(options.length, (index) {
                    return CheckboxListTile(
                      title: Text(options[index]),
                      value: isChecked[index],
                      onChanged: (bool? value) {
                        setStateDialog(() {
                          isChecked[index] = value ?? false;
                        });
                      },
                    );
                  }),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    List<String> selected = [];
                    for (int i = 0; i < options.length; i++) {
                      if (isChecked[i]) {
                        selected.add(options[i]);
                      }
                    }
                    onSave(selected);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(color: Color(0xFF7C329B)),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildSelectableField({
    required String hint,
    required List<String> values,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          values.isEmpty ? hint : values.join(', '),
          style: GoogleFonts.poppins(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 22,
                              ),
                              onPressed: () => Navigator.of(context).maybePop(),
                              splashRadius: 28,
                            ),
                            const SizedBox(width: 4),
                            Image.asset(
                              'assets/TrueJobs logo.png',
                              height: 28,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.0,
                              minHeight: 10,
                              borderRadius: BorderRadius.circular(10),
                              backgroundColor: Colors.grey.shade300,
                              color: purpleColor,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "0%",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Profile Creation",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Name
                      Text(
                        "Name",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Full Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1.5,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                        ),
                        style: GoogleFonts.poppins(),
                      ),
                      const SizedBox(height: 16),

                      // Email
                      Text(
                        "Mail Id",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Mail Id',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1.5,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                        ),
                        style: GoogleFonts.poppins(),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),

                      // Gender
                      Text(
                        "Gender",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  gender = "Male";
                                });
                              },
                              child: _GenderButton(
                                width: 5,
                                label: " Male",
                                selected: gender == "Male",
                                color: purpleColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  gender = "Female";
                                });
                              },
                              child: _GenderButton(
                                label: "Female",
                                selected: gender == "Female",
                                color: purpleColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  gender = "Transgender";
                                });
                              },
                              child: _GenderButton(
                                width: 20,
                                label: "Transgender",
                                selected: gender == "Transgender",
                                color: purpleColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // DOB
                      Text(
                        "Date of Birth",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _selectDate(context),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  selectedDate == null
                                      ? 'Select Date'
                                      : '${selectedDate!.toLocal()}'.split(
                                          ' ',
                                        )[0],
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => _selectDate(context),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.calendar_today,
                                size: 22,
                                color: Color(0xFF7C329B),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Physically Challenged
                      Text(
                        "Physically Challenged",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isPhysicallyChallenged = true;
                              });
                            },
                            child: _GenderButton(
                              label: "Yes",
                              selected: isPhysicallyChallenged,
                              color: purpleColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isPhysicallyChallenged = false;
                                conditionTypes.clear();
                                affectedAreas.clear();
                              });
                            },
                            child: _GenderButton(
                              label: "No",
                              selected: !isPhysicallyChallenged,
                              color: purpleColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Conditional Fields
                      if (isPhysicallyChallenged) ...[
                        Text(
                          "Condition Type",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildSelectableField(
                          hint: 'Select Condition Type',
                          values: conditionTypes,
                          onTap: () {
                            _showSelectionDialog(
                              context,
                              'Select Condition Type',
                              [
                                'Physical Disability',
                                'Visual Disability',
                                'Hearing Disability',
                                'Speech and Language Disability',
                                'Intellectual Disability',
                                'Learning Disability',
                                'Neurological Disability',
                                'Psychosocial Disability',
                                'Multiple Disabilities',
                                'Autism Spectrum Disorder (ASD)',
                                'Developmental Disability',
                                'Cognitive Disability',
                                'Orthopedic Disability',
                                'Chronic Illness-related Disability',
                                'Sensory Processing Disability',
                                'Behavioral Disability',
                                'Mental Health Disability',
                                'Genetic Disorder-related Disability',
                                'Traumatic Brain Injury (TBI)',
                                'Spinal Cord Injury (SCI)',
                              ],
                              conditionTypes,
                              (selected) {
                                setState(() {
                                  conditionTypes = selected;
                                });
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16),

                        Text(
                          "Affected Area",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildSelectableField(
                          hint: 'Select Affected Area',
                          values: affectedAreas,
                          onTap: () {
                            _showSelectionDialog(
                              context,
                              'Select Affected Area',
                              [
                                'Chest',
                                'Ears',
                                'Head',
                                'Left Eye',
                                'Left Hand',
                                'Left Leg',
                                'Mouth',
                                'Nose',
                                'Shoulder',
                                'Right Eye',
                                'Right Hand',
                              ],
                              affectedAreas,
                              (selected) {
                                setState(() {
                                  affectedAreas = selected;
                                });
                              },
                            );
                          },
                        ),
                      ],
                      const Spacer(),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: canGoToNext()
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Profile2(),
                                    ),
                                  );
                                }
                              : null,
                          child: Text(
                            'Next',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _GenderButton extends StatelessWidget {
  final String label;
  final bool selected;
  final Color color;
  final double? width;
  final double? height;

  const _GenderButton({
    required this.label,
    required this.selected,
    required this.color,
    this.width,
    
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? color : Colors.transparent,
        border: Border.all(
          color: selected ? color : Colors.grey.shade400,
          width: selected ? 2 : 1.5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 8.9,
        ),
      ),
    );
  }
}
