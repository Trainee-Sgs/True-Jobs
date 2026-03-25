import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_RECRUITER/RECRUITER_Profile_creation/recruiter_profile2.dart';

class RecruiterProfile1 extends StatefulWidget {
  const RecruiterProfile1({super.key});

  @override
  RecruiterProfile1State createState() => RecruiterProfile1State();
}

class RecruiterProfile1State extends State<RecruiterProfile1> {
  final purpleColor = const Color(0xFF7C329B);

  final companyNameController = TextEditingController();
  final mailController = TextEditingController();
  final gstController = TextEditingController();

  bool gstVerified = false;

  bool canGoNext() {
    return companyNameController.text.isNotEmpty &&
        mailController.text.isNotEmpty &&
        gstVerified;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back + Logo
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 22,
                    ),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  const SizedBox(width: 4),
                  Image.asset(
                    "assets/TrueJobs logo.png",
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Progress Bar
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
                      fontSize: 12,
                      color: Colors.black54,
                      height: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                "Profile Creation",
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54, height: 1),
              ),
              const SizedBox(height: 20),

              // Basic Details
              Text(
                "Basic Details",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              const SizedBox(height: 20),

              // Company Name
              Text("Company Name", style: GoogleFonts.poppins(fontSize: 14, height: 1)),
              const SizedBox(height: 6),
              TextField(
                controller: companyNameController,
                decoration: InputDecoration(
                  hintText: "Enter Company Name",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 14, height: 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Mail Id
              Text("Mail Id", style: GoogleFonts.poppins(fontSize: 14, height: 1)),
              const SizedBox(height: 6),
              TextField(
                controller: mailController,
                decoration: InputDecoration(
                  hintText: "Enter Company Mail Id",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 14, height: 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // GST Details
              Text(
                "GST Details",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              const SizedBox(height: 16),

              Text("GST No.", style: GoogleFonts.poppins(fontSize: 14, height: 1)),
              const SizedBox(height: 6),
              TextField(
                controller: gstController,
                decoration: InputDecoration(
                  hintText: "Enter Company GST Number",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 14, height: 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Inside your Column (replace the Verify button + extra info part)
              SizedBox(
                width: double.infinity,
                height: 45,
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      gstVerified = gstController.text.isNotEmpty;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: purpleColor),
                  ),
                  child: Text(
                    "Verify",
                    style: GoogleFonts.poppins(
                      color: purpleColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ✅ Animated section
              AnimatedSize(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                child: gstVerified
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (gstVerified) // Show only when verified
                                Row(
                                  children: [
                                    Icon(
                                      Icons.verified, // ✅ verified icon
                                      color: Colors.green,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "Verified",
                                      style: GoogleFonts.poppins(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 1,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Company Name",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "SMART GLOBAL SOLUTIONS",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Address",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "No.22 B, 9th Street, Sri Krishna Nagar, Irugur,\n"
                            "Coimbatore, Tamil Nadu 641103",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                          const SizedBox(height: 20),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),

              const SizedBox(height: 100), // extra space for scrolling
            ],
          ),
        ),
      ),

      // ✅ Button fixed at bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: canGoNext() ? () {
              // Navigate to the next profile creation screen
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RecruiterProfile2(),
                ),
              );
            } : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: canGoNext()
                  ? purpleColor
                  : Colors.purple.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              "Next",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
