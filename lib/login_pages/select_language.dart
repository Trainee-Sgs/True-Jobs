import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/login_pages/login.dart'; // Assuming this path is correct

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  // Index: 0 = English, 1 = Tamil, 2 = Hindi
  int? selectedIndex;

  final purpleColor = const Color(0xFF7C329B);

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate a dynamic padding or spacing based on screen width
    final horizontalPadding = screenWidth * 0.05; // 5% of screen width
    final verticalSpacing = screenHeight * 0.03; // 3% of screen height
    final languageBoxSpacing =
        screenWidth * 0.04; // 4% of screen width between boxes

    // Adjust language box size dynamically
    final langBoxSize =
        screenWidth *
        0.28; // Approximately 1/3 of screen width for each box on smaller screens, allowing space for 3
    final minLangBoxSize = 90.0; // Minimum size to ensure readability
    final maxLangBoxSize =
        120.0; // Maximum size to avoid being too large on tablets

    final effectiveLangBoxSize = langBoxSize.clamp(
      minLangBoxSize,
      maxLangBoxSize,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: verticalSpacing * 2), // More spacing at the top
            // Earth gif - height scaled with screen height
            Image.asset(
              'assets/earth.gif',
              height: screenHeight * 0.15, // 15% of screen height
              fit: BoxFit.contain,
            ),
            SizedBox(height: verticalSpacing),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Select Your Language to Get Started.',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.045, // Scale font size
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: verticalSpacing),

            // Language selection boxes using Wrap for flexible layout
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Center(
                // Center the Wrap widget itself
                child: Wrap(
                  spacing: languageBoxSpacing, // Horizontal spacing
                  runSpacing:
                      languageBoxSpacing, // Vertical spacing for wrapped items
                  alignment: WrapAlignment.start, // Center items when they wrap
                  children: [
                    _buildLangBox(
                      index: 0,
                      labelTop: 'A',
                      labelBottom: 'English',
                      fontFamily: null,
                      size: effectiveLangBoxSize,
                    ),
                    _buildLangBox(
                      index: 1,
                      labelTop: 'அ',
                      labelBottom: 'தமிழ்',
                      fontFamily: 'NotoSansTamil',
                      size: effectiveLangBoxSize,
                    ),
                    _buildLangBox(
                      index: 2,
                      labelTop: 'अ',
                      labelBottom: 'हिन्दी',
                      fontFamily: 'NotoSansDevanagari',
                      size: effectiveLangBoxSize,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            // Continue button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: SizedBox(
                width: double.infinity,
                height: screenHeight * 0.06, // Scale button height
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purpleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: selectedIndex != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Login(), // Replace with your next screen
                            ),
                          );
                        }
                      : null,
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.045, // Scale font size
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: verticalSpacing * 1.5,
            ), // More spacing at the bottom
          ],
        ),
      ),
    );
  }

  Widget _buildLangBox({
    required int index,
    required String labelTop,
    required String labelBottom,
    String? fontFamily,
    required double size, // Add size parameter
  }) {
    final selected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: size, // Use dynamic size
        height: size, // Use dynamic size
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? purpleColor : purpleColor.withOpacity(0.5),
            width: selected ? 2 : 1.5,
          ),
          color: selected ? purpleColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                labelTop,
                style: TextStyle(
                  fontSize: size * 0.32, // Scale font size relative to box size
                  fontWeight: FontWeight.bold,
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                labelBottom,
                style: TextStyle(
                  fontSize: size * 0.16, // Scale font size relative to box size
                  fontWeight: FontWeight.w500,
                  color: selected ? Colors.white : Colors.black,
                  fontFamily: fontFamily,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
