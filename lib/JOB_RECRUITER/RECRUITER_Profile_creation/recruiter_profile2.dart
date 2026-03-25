import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_RECRUITER/RECRUITER_Profile_creation/rec_profile3.dart';

class RecruiterProfile2 extends StatefulWidget {
  const RecruiterProfile2({super.key});

  @override
  RecruiterProfile2State createState() => RecruiterProfile2State();
}

class RecruiterProfile2State extends State<RecruiterProfile2> {
  final purpleColor = const Color(0xFF7C329B);
  final greyBorder = const Color(0xFFE0E0E0);
  final lightGreyText = Colors.grey.shade600;

  final industryController = TextEditingController();
  final companySizeController = TextEditingController();
  final yearController = TextEditingController();
  final websiteController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();
  final whatWeDoController = TextEditingController();

  bool canGoNext() {
    return industryController.text.isNotEmpty &&
        companySizeController.text.isNotEmpty &&
        yearController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        pincodeController.text.isNotEmpty &&
        whatWeDoController.text.isNotEmpty;
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
                      value: 0.45,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "45%",
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

              // Company Details
              Text(
                "Company Details",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              const SizedBox(height: 20),

              // Industry/Domain
              Text(
                "Industry/Domain",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(
                controller: industryController,
                hintText: "eg. IT Sector",
              ),
              const SizedBox(height: 16),

              // Company Size
              Text(
                "Company Size",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(
                controller: companySizeController,
                hintText: "eg. 20 - 30 members",
              ),
              const SizedBox(height: 16),

              // Year of Establishment
              Text(
                "Year of Establishment",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(
                controller: yearController,
                hintText: "Enter Number",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Website
              Text(
                "Website",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(
                controller: websiteController,
                hintText: "Enter Company Website",
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 16),

              // Address
              Text(
                "Address",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(
                controller: addressController,
                hintText: "No.22 B, 9th Street, Sri Krishna Nagar,\nIrugur",
                maxLines: 4,
              ),
              const SizedBox(height: 12),

              // Detect Location Button
              SizedBox(
                width: double.infinity,
                height: 45,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on_outlined, size: 20),
                  label: Text(
                    "Detect Location",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: purpleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // City & State
              Text(
                "City & State",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(
                controller: cityController,
                hintText: "Coimbatore, Tamil Nadu",
              ),
              const SizedBox(height: 16),

              // Pincode
              Text(
                "Pincode",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(
                controller: pincodeController,
                hintText: "641103",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Company Logo
              Text(
                "Company Logo",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                width: 140,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: greyBorder),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/company.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(Icons.close, size: 18),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: purpleColor),
                  ),
                  child: Text(
                    "Upload Image",
                    style: GoogleFonts.poppins(
                      color: purpleColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // What We Do!
              Text(
                "What We Do!",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(
                controller: whatWeDoController,
                hintText: "About Company",
                maxLines: 4,
              ),
              const SizedBox(height: 100), // Extra space for scrolling
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecruiterProfile3(),
                ),
              );
            },
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

  // Helper method to build a standardized text field
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
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
      maxLines: maxLines,
    );
  }
}
