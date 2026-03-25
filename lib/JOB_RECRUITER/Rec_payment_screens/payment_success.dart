import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_RECRUITER/Main_Screens/rec_home.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess>   with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          // Navigating to WalkthroughScreen
          builder: (BuildContext context) => const RecHome(), // Assuming your walkthrough widget is named WalkthroughScreen
        ),
      );
    });
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _scaleAnim = Tween<double>(
      begin: 1.2,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Responsive width
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double gifSize = screenWidth * 0.66;
    gifSize = gifSize.clamp(120.0, 250.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Heading
                  
                  
                  // Zoom out animated success GIF
                  AnimatedBuilder(
                    animation: _scaleAnim,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnim.value,
                        child: Image.asset(
                          'assets/success.gif',
                          width: gifSize,
                          height: gifSize,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                  Text(
                    "Paid Successfully",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF7C329B),
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.018),
                  Text(
                    "Your Plan Is Active Now",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color:Colors.black,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
