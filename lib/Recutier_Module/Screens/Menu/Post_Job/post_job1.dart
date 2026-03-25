import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  static const Color primaryColor = Color(0xFF7C329B);
  static const Color completedColor = Color(0xFF20A251);
  static const Color borderColor = Color(0xFFD8D8D8);
  static const Color labelColor = Color(0xFF8D5AA6);
  static const List<String> stepTitles = [
    'Job Details',
    'Qualifications',
    'Salary & Interview',
    'Preview',
  ];

  final TextEditingController companyController = TextEditingController(
    text: 'SMART GLOBAL SOLUTIONS',
  );
  final TextEditingController roleController = TextEditingController(
    text: 'eg. Civil Engineer',
  );
  final TextEditingController jobDescriptionController =
      TextEditingController();
  final TextEditingController benefitsController = TextEditingController();
  final TextEditingController affectedAreaController = TextEditingController(
    text: 'Select here',
  );

  final List<String> selectedSkills = ['UI/UX Designer', 'UI Designer', 'Designer'];
  final List<String> availableSkills = [
    'UI/UX Designer',
    'UI Designer',
    'Designer',
  ];

  bool genderMale = true;
  bool genderFemale = false;
  bool genderTransgender = false;
  bool isPhysicallyChallenged = true;
  int currentStep = 0;
  final Set<int> completedSteps = <int>{};

  String conditionType = 'Select here';
  String selectedShift = 'Day';
  final List<String> selectedWorkModes = ['In-Office'];
  String selectedJobType = 'Full Time';

  void _goToStep(int index) {
    setState(() {
      currentStep = index;
    });
  }

  void _handleNext() {
    setState(() {
      completedSteps.add(currentStep);
      if (currentStep < stepTitles.length - 1) {
        currentStep++;
      }
    });
  }

  void _toggleSkill(String skill) {
    setState(() {
      if (selectedSkills.contains(skill)) {
        selectedSkills.remove(skill);
      } else {
        selectedSkills.add(skill);
      }
    });
  }

  Widget _chip(String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.only(right: 8, bottom: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF0DDF8),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xFFD6B7EA),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                color: labelColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(
              Icons.close,
              size: 16,
              color: labelColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _smallButton(String label, bool selected, VoidCallback onTap) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: selected ? primaryColor : Colors.white,
        foregroundColor: selected ? Colors.white : const Color(0xFF5B5B5B),
        side: BorderSide(
          color: selected ? primaryColor : const Color(0xFFBEBEBE),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        minimumSize: const Size(0, 40),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final spacing = size.height * 0.013;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 18),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        titleSpacing: 0,
        title: Text(
          'Post New Job',
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStepper(isTablet: isTablet),
            Padding(
              padding: EdgeInsets.fromLTRB(isTablet ? 100 : 24, 16, isTablet ? 100 : 24, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  _buildField(
                    'Hiring For',
                    controller: companyController,
                    hint: 'SMART GLOBAL SOLUTIONS',
                    enabled: false,
                  ),
                  SizedBox(height: spacing),
                  _buildReadOnlyField(
                    'Job Title/Role',
                    controller: roleController,
                    hint: 'eg. Civil Engineer',
                  ),
                  SizedBox(height: spacing),

                  _buildDropdown(
                    'Select Skills Required',
                    ['Type here', ...availableSkills],
                    'Type here',
                    (val) {},
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0EFEF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Wrap(
                      children: selectedSkills
                          .map(
                            (skill) => _chip(
                              skill,
                              true,
                              () => _toggleSkill(skill),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(height: spacing),

                  Text(
                    'Looking for',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: labelColor,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 16,
                    children: [
                      _genderToggle(
                        'Male',
                        genderMale,
                        () => setState(() {
                          genderMale = !genderMale;
                        }),
                      ),
                      _genderToggle(
                        'Female',
                        genderFemale,
                        () => setState(() {
                          genderFemale = !genderFemale;
                        }),
                      ),
                      _genderToggle(
                        'Transgender',
                        genderTransgender,
                        () => setState(() {
                          genderTransgender = !genderTransgender;
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: spacing),

                  Text(
                    'Job for Physically Challenged?',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: labelColor,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _smallButton(
                        'Yes',
                        isPhysicallyChallenged,
                        () => setState(() => isPhysicallyChallenged = true),
                      ),
                      const SizedBox(width: 8),
                      _smallButton(
                        'No',
                        !isPhysicallyChallenged,
                        () => setState(() => isPhysicallyChallenged = false),
                      ),
                    ],
                  ),
                  SizedBox(height: spacing),

                  if (isPhysicallyChallenged) ...[
                    _buildDropdown(
                      'Condition Type',
                      ['Select here', 'Permanent', 'Temporary'],
                      conditionType,
                      (val) => setState(() {
                        conditionType = val;
                      }),
                    ),
                    SizedBox(height: spacing),
                    _buildDropdown(
                      'Affected Area',
                      const ['Select here'],
                      'Select here',
                      (val) {},
                    ),
                    SizedBox(height: spacing),
                  ],

                  Text(
                    'Shift',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ['Day', 'Night', 'Rotational']
                        .map(
                          (item) => _smallButton(
                            item,
                            selectedShift == item,
                            () => setState(() => selectedShift = item),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: spacing),

                  Text(
                    'Work Mode',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ['In-Office', 'Work From Home', 'Hybrid', 'Field Work']
                        .map(
                          (item) => _smallButton(
                            item,
                            selectedWorkModes.contains(item),
                            () {
                              setState(() {
                                if (selectedWorkModes.contains(item)) {
                                  selectedWorkModes.remove(item);
                                } else {
                                  selectedWorkModes.add(item);
                                }
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: spacing),

                  Text(
                    'Job Type',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ['Full Time', 'Part Time', 'Internship']
                        .map(
                          (item) => _smallButton(
                            item,
                            selectedJobType == item,
                            () => setState(() => selectedJobType = item),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: spacing),

                  _buildMultilineField(
                    'Job Description',
                    controller: jobDescriptionController,
                    hint: 'Type here',
                  ),
                  SizedBox(height: spacing),
                  _buildMultilineField(
                    'Benefits (optional)',
                    controller: benefitsController,
                    hint: 'Type here',
                  ),
                  SizedBox(height: size.height * 0.03),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      onPressed: _handleNext,
                      child: Text(
                        currentStep == stepTitles.length - 1 ? 'Finish' : 'Next',
                        style: GoogleFonts.poppins(
                          fontSize: isTablet ? 22 : 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stepCircle(int index) {
    final isCompleted = completedSteps.contains(index);
    final isActive = currentStep == index;
    final Color backgroundColor =
        (isCompleted || isActive) ? completedColor : const Color(0xFF626262);

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        '${index + 1}',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          height: 1,
        ),
      ),
    );
  }

  Widget _buildStepper({required bool isTablet}) {
    const double titleHeight = 18;
    const double titleGap = 3;
    const double circleSize = 24;
    const double connectorHeight = 2;
    final double connectorTop = (circleSize - connectorHeight) / 2;
    final double stepWidth = isTablet ? 130 : 106;
    final double connectorWidth = isTablet ? 60 : 48;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(isTablet ? 32 : 16, 10, isTablet ? 32 : 16, 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: () {
            final List<Widget> items = [];
            for (var index = 0; index < stepTitles.length; index++) {
              final bool isCompleted = completedSteps.contains(index);
              final bool isActive = currentStep == index;
              final Color textColor =
                  (isCompleted || isActive) ? completedColor : const Color(0xFF686868);
              final bool isLast = index == stepTitles.length - 1;

              items.add(
                InkWell(
                  onTap: () => _goToStep(index),
                  child: SizedBox(
                    width: isLast ? stepWidth : stepWidth + connectorWidth,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: stepWidth,
                          height: titleHeight,
                          child: Center(
                            child: Text(
                              stepTitles[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: isTablet ? 18 : 14,
                                color: textColor,
                                fontWeight: FontWeight.w500,
                                height: 1.1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: titleGap),
                        SizedBox(
                          width: isLast ? stepWidth : stepWidth + connectorWidth,
                          height: circleSize,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: _stepCircle(index),
                              ),
                              if (!isLast)
                                Positioned(
                                  left: circleSize,
                                  right: 0,
                                  top: connectorTop,
                                  child: _stepConnector(
                                    active: completedSteps.contains(index),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return items;
          }(),
        ),
      ),
    );
  }

  Widget _stepConnector({required bool active}) {
    const double dotSize = 3;
    const double gap = 1;
    return SizedBox(
      height: 2,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dashCount =
              ((constraints.maxWidth + gap) / (dotSize + gap)).floor().clamp(10, 24);
          return Row(
            children: List.generate(
              dashCount,
              (index) => Container(
                width: dotSize,
                height: 2,
                margin: EdgeInsets.only(right: index == dashCount - 1 ? 0 : gap),
                decoration: BoxDecoration(
                  color: active ? completedColor : const Color(0xFFBDBDBD),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildReadOnlyField(
    String label, {
    required TextEditingController controller,
    String hint = '',
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: labelColor,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.centerLeft,
          child: Text(
            controller.text.isEmpty ? hint : controller.text,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(0xFF9A9A9A),
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildField(
    String label, {
    required TextEditingController controller,
    String hint = '',
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: labelColor,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          enabled: enabled,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 15,
            ),
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(0xFF9A9A9A),
              height: 1.2,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: borderColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: borderColor),
            ),
          ),
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black87,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildMultilineField(
    String label, {
    required TextEditingController controller,
    String hint = '',
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: labelColor,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          minLines: 4,
          maxLines: 4,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 15,
            ),
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(0xFF9A9A9A),
              height: 1.2,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: borderColor),
            ),
          ),
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black87,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> items,
    String current,
    ValueChanged<String> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: labelColor,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButton<String>(
            value: current,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down, size: 22),
            underline: const SizedBox.shrink(),
            items: items
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: const Color(0xFF9A9A9A),
                        height: 1.2,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) onChanged(value);
            },
          ),
        ),
      ],
    );
  }

  Widget _genderToggle(String label, bool active, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            active ? Icons.check_box : Icons.check_box_outline_blank,
            size: 20,
            color: active ? primaryColor : const Color(0xFF7A7A7A),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: const Color(0xFF5F5F5F),
              fontSize: 16,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
