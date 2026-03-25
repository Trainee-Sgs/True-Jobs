import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/login_pages/select_language.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds before navigating to SelectLanguage screen
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const SelectLanguage(),
        ),
      );
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // Animation duration
    );

    // Slide animation from bottom to top
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Starts off-screen at the bottom
      end: const Offset(0, 0), // Ends at its natural position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to prevent memory leaks
    super.dispose();
  }

  // Custom concave container widget for the background layers
  Widget _buildConcaveContainer(
    double screenHeight,
    Color color,
    double heightFactor, {
    String? text,
  }) {
    // Calculate dynamic height based on screenHeight and heightFactor
    final containerHeight = screenHeight / heightFactor;
    // Calculate dynamic font size for the text within the container
    final fontSize = screenHeight * 0.03; // Approximately 3% of screen height

    return ClipPath(
      clipper:
          ConvexClipper(), // Apply the custom clipper for the concave shape
      child: Container(
        height: containerHeight,
        width: double.infinity, // Take full width
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.12,
            ), // Dynamic spacing from the top
            if (text != null) ...[
              Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF7E3DFF),
                  fontSize: fontSize, // Use dynamic font size
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ), // Dynamic spacing below text
            ],

            if (color == Colors.white) ...[
              // Walkthrough GIF - height scaled with screen height
              Image.asset(
                'assets/walkthrough.gif',
                height:
                    screenHeight * 0.2, // Approximately 20% of screen height
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ), // Dynamic spacing below image
            ],
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate dynamic padding and font sizes for the main content
    final horizontalPadding = screenWidth * 0.06; // 6% of screen width
    final verticalPadding = screenHeight * 0.12; // 12% of screen height
    final textFontSize = screenWidth * 0.05; // 6% of screen width for main text
    final iconSize = screenWidth * 0.07; // 7% of screen width for icons
    final contactImageHeight = screenHeight * 0.06; // 6% of screen height

    return Scaffold(
      backgroundColor: const Color(0xFF6A1B9A), // Background color
      body: Stack(
        children: [
          // Bottom concave container layer (E880FF)
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: _slideAnimation,
              child: _buildConcaveContainer(
                screenHeight,
                const Color(0xFFE880FF),
                1.5, // Height factor (larger number means smaller container)
              ),
            ),
          ),
          // Middle concave container layer (white)
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: _slideAnimation,
              child: _buildConcaveContainer(
                screenHeight,
                Colors.white,
                1.6, // Height factor
                text: "Start Your Journey\nWith Us.",
              ),
            ),
          ),
          // Main content on top
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center content horizontally
              children: [
                // "Find Your Dream Job" section
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the row items
                  children: [
                    Text(
                      "Find Your Dream",
                      style: GoogleFonts.poppins(
                        fontSize: textFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Small horizontal spacing
                    SizedBox(width: screenWidth * 0.015),
                    Text(
                      "Job",
                      style: GoogleFonts.poppins(
                        fontSize: textFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.015,
                    ), // Small horizontal spacing
                    Icon(
                      Icons.search,
                      color: Colors.white,
                      size: iconSize,
                    ), // Dynamic icon size
                  ],
                ),

                SizedBox(
                  height: screenHeight * 0.03,
                ), // Dynamic vertical spacing
                Text(
                  "&",
                  style: GoogleFonts.poppins(
                    fontSize: textFontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ), // Dynamic vertical spacing
                Text(
                  "Hire The Best Talent",
                  style: GoogleFonts.poppins(
                    fontSize: textFontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ), // Dynamic vertical spacing
                Image.asset(
                  'assets/contact.png',
                  height: contactImageHeight, // Dynamic image height
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// CustomClipper for the concave shape
class ConvexClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    path.lineTo(0, 0); // Start from top-left

    // Create a quadratic bezier curve for the concave shape at the top
    path.quadraticBezierTo(
      width / 2,
      150,
      width,
      0,
    ); // Control point at (width/2, 150)

    path.lineTo(width, height); // Line to bottom-right
    path.lineTo(0, height); // Line to bottom-left
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
