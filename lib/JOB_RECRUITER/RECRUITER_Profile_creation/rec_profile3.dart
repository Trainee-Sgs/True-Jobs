import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_RECRUITER/RECRUITER_Profile_creation/rec_profile_success.dart';

class RecruiterProfile3 extends StatefulWidget {
  const RecruiterProfile3({super.key});

  @override
  RecruiterProfile3State createState() => RecruiterProfile3State();
}

class RecruiterProfile3State extends State<RecruiterProfile3> {
  final purpleColor = const Color(0xFF7C329B);

  final gstController = TextEditingController();
  final panController = TextEditingController();
  final cinController = TextEditingController();

  bool canSave() {
    // Check if at least one field is filled
    return gstController.text.isNotEmpty ||
        panController.text.isNotEmpty ||
        cinController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    // Media query to get screen size and make the UI responsive
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine the padding based on screen width
    final horizontalPadding = screenWidth > 600 ? 100.0 : 24.0;

    return Scaffold(
       backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 16,
          ),
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
                      value: 0.80,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 6),

                  Text(
                    "80%",
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

              // KYC Details
              Text(
                "KYC Details",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),

              
              const SizedBox(height: 20),

              // GST No.
              Text(
                "GST No.",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(
                controller: gstController,
                hintText: "33ADWFS21640128",
              ),
              const SizedBox(height: 16),

              // PAN Card Details
              Text(
                "PAN Card Details",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(
                controller: panController,
                hintText: "Enter PAN number",
              ),
              const SizedBox(height: 16),

              // CIN No.
              Text(
                "CIN No.",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(
                controller: cinController,
                hintText: "Company Identification Number",
              ),
              const SizedBox(height: 210),

              // Note section
              Text(
                "Note: The verification process for your company may take some time. During this period, job postings may be delayed, but you can still search and save job seekers' profiles.",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(horizontalPadding / 2),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: canSave()
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileSuccess1(),
                      ),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: canSave() ? purpleColor : Colors.purple.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              "Save",
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

  // Helper method to build a standardized text field
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 14, height: 1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
