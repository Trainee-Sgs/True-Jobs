import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_RECRUITER/RECRUITER_Profile_creation/recruiter_profile1.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile1.dart';

class Role extends StatefulWidget {
  const Role({super.key});

  @override
  State<Role> createState() => _RoleState();
}

class _RoleState extends State<Role> {
  int? selectedIndex;

  final purpleColor = const Color(0xFF6A1B9A);

  final List<String> options = ["For Hiring Candidates", "To Search Jobs"];

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
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const SizedBox(width: 4),
                          Image.asset(
                            'assets/TrueJobs logo.png',
                            height: 28,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text(
                        "What Are You Looking For?",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Option Buttons
                      ...List.generate(options.length, (i) {
                        final selected = selectedIndex == i;
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = i;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 14,
                                ),
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: selected
                                        ? purpleColor
                                        : purpleColor.withOpacity(0.5),
                                    width: selected ? 2 : 1.5,
                                  ),
                                  color: selected
                                      ? purpleColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  options[i],
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,

                                    fontWeight: FontWeight.w500,
                                    color: selected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),

                      const Spacer(),
                      // Next Button
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
                          onPressed: selectedIndex != null
                              ? () {
                                  if (options[selectedIndex!] ==
                                      "To Search Jobs") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Profil1(),
                                      ),
                                    );
                                  } else {
                                    if (options[selectedIndex!] ==
                                        "For Hiring Candidates") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RecruiterProfile1(),
                                        ),
                                      );
                                    }
                                  }
                                }
                              : null,

                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
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
