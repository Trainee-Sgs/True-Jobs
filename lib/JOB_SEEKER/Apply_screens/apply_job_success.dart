import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/Models/job_details.dart';

class ApplyJobSuccess extends StatefulWidget {
  const ApplyJobSuccess({super.key});

  @override
  State<ApplyJobSuccess> createState() => _PostJobSuccessState();
}

class _PostJobSuccessState extends State<ApplyJobSuccess> {
  @override
  void initState() {
    super.initState();
    // Add timer for navigation
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const JobDetails(job: {},), // Your target screen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Define the custom purple color
    const purpleColor = Color(0xFF7C329B);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/mobilesuccess.gif', // Placeholder, replace with your actual GIF path
                height: screenHeight * 0.35,
              ),

             
              Text(
                'Submitted your job',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: purpleColor,
                ),
              ),

              
              Text(
                'application',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: purpleColor,
                ),
              ),

              SizedBox(height: screenHeight * 0.06),

              // Description text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                  children: [
                    const TextSpan(text: "Visit "),
                    TextSpan(
                      text: "' job'",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w400,
                        color: purpleColor,
                      ),
                    ),
                    const TextSpan(
                      text:
                          " to know your \n application status",
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
}
