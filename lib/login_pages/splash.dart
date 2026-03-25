import 'package:flutter/material.dart';
import 'package:true_jobs/login_pages/walkthrough.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // This timer navigates to the WalkthroughScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          // Navigating to WalkthroughScreen
          builder: (BuildContext context) =>
              const WalkthroughScreen(), // Assuming your walkthrough widget is named WalkthroughScreen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(
        0xFF7C329B,
      ), // Deep purple color from the image background
      body: Center(
        child: Image(image: AssetImage('assets/TrueJobs logo.png'), width: 250),
      ),
    );
  }
}
