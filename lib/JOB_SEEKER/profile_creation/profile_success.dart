import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/Home_screens/home.dart';

class ProfileSuccess extends StatefulWidget {
  const ProfileSuccess({super.key});

  @override
  State<ProfileSuccess> createState() => _ProfileSuccessState();
}

class _ProfileSuccessState extends State<ProfileSuccess>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          // Navigating to WalkthroughScreen
          builder: (BuildContext context) => const Home(), // Assuming your walkthrough widget is named WalkthroughScreen
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
    double gifSize = MediaQuery.of(context).size.width * 0.66;
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
                  Text(
                    "Congratulations!",
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF7C329B),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Your Profile Is Ready",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7C329B),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
