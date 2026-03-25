import 'dart:async';

import 'package:flutter/material.dart';
import 'package:true_jobs/JOB_SEEKER/Apply_screens/apply_job1.dart';

class Loading extends StatefulWidget {
  const 
  
  
  Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          
          builder: (BuildContext context) =>
              const ApplyJob1(), 
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
                          'assets/loading.gif',
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
