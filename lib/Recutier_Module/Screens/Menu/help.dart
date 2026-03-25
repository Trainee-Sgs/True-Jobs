import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  static const Color primaryColor = Color(0xFF7C329B);
  static const Color lightPurple = Color(0xFFD9B8E6);

  final List<String> _generalQueries = const [
    'How do I create an account in app ?',
    'How do I create an account in app ?',
    'How do I create an account in app ?',
    'How do I create an account in app ?',
  ];

  final List<String> _jobPostingQueries = const [
    'How do I create an account in app ?',
    'How do I create an account in app ?',
    'How do I create an account in app ?',
    'How do I create an account in app ?',
  ];

  int? _expandedGeneralIndex;
  int? _expandedJobIndex;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: screenHeight * 0.065,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.025),
          child: Container(
            width: double.infinity,
            height: screenHeight * 0.025,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor,
                  Color(0xFFC893D8),
                  Color(0xFFE8D4F0),
                  Colors.white,
                ],
                stops: [0.0, 0.32, 0.68, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: screenWidth * 0.052,
          ),
        ),
        titleSpacing: 0,
        title: Text(
          'Help & Support',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.028),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Feeling Stuck?',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                              height: 1,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.008),
                          Text(
                            "We'll Help You Sort It Out!",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.028),
                  _buildContactCard(screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.032),
                  Divider(
                    thickness: 1,
                    color: const Color(0xFFD2D2D2),
                  ),
                  SizedBox(height: screenHeight * 0.024),
                  _buildSectionTitle(screenWidth, 'General queries'),
                  SizedBox(height: screenHeight * 0.016),
                  ...List.generate(
                    _generalQueries.length,
                    (index) => _buildFaqItem(
                      screenWidth: screenWidth,
                      question: _generalQueries[index],
                      indexText: '${index + 1}.',
                      expanded: _expandedGeneralIndex == index,
                      onTap: () {
                        setState(() {
                          _expandedGeneralIndex =
                              _expandedGeneralIndex == index ? null : index;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.024),
                  _buildSectionTitle(screenWidth, 'Job postings'),
                  SizedBox(height: screenHeight * 0.016),
                  ...List.generate(
                    _jobPostingQueries.length,
                    (index) => _buildFaqItem(
                      screenWidth: screenWidth,
                      question: _jobPostingQueries[index],
                      indexText: '${index + 1}.',
                      expanded: _expandedJobIndex == index,
                      onTap: () {
                        setState(() {
                          _expandedJobIndex =
                              _expandedJobIndex == index ? null : index;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.032),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(double screenWidth, double screenHeight) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: screenWidth * 0.64,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.012,
            ),
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
            child: Column(
              children: [
                Text(
                  'Contact Us:    98765-43210',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                SizedBox(height: screenHeight * 0.003),
                Text(
                  '24/7 Assistance Available',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: -screenWidth * 0.13,
            top: screenHeight * 0.014,
            child: SizedBox(
              width: screenWidth * 0.18,
              height: screenHeight * 0.05,
              child: CustomPaint(
                painter: _HelpBannerPainter(
                  primaryColor: primaryColor,
                  lightPurple: lightPurple,
                ),
              ),
            ),
          ),
          Positioned(
            left: -screenWidth * 0.093,
            top: screenHeight * 0.012,
            child: Container(
              width: screenWidth * 0.072,
              height: screenWidth * 0.072,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(screenWidth * 0.004),
              ),
              child: Icon(
                Icons.help_outline_rounded,
                color: Colors.white,
                size: screenWidth * 0.043,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(double screenWidth, String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF555555),
            height: 1,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 48,
          height: 2,
          color: const Color(0xFFBFBFBF),
        ),
      ],
    );
  }

  Widget _buildFaqItem({
    required double screenWidth,
    required String question,
    required String indexText,
    required bool expanded,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: screenWidth * 0.014),
            child: Row(
              children: [
                Text(
                  indexText,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF454545),
                    height: 1,
                  ),
                ),
                SizedBox(width: screenWidth * 0.012),
                Expanded(
                  child: Text(
                    question,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF454545),
                      height: 1.1,
                    ),
                  ),
                ),
                Icon(
                  expanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: const Color(0xFF3F3F3F),
                  size: screenWidth * 0.058,
                ),
              ],
            ),
          ),
        ),
        if (expanded)
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.07,
              right: screenWidth * 0.02,
              bottom: screenWidth * 0.02,
            ),
            child: Text(
              'Create your account using the required details in the app and follow the on-screen steps to continue.',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF666666),
                height: 1.3,
              ),
            ),
          ),
      ],
    );
  }
}

class _HelpBannerPainter extends CustomPainter {
  const _HelpBannerPainter({
    required this.primaryColor,
    required this.lightPurple,
  });

  final Color primaryColor;
  final Color lightPurple;

  @override
  void paint(Canvas canvas, Size size) {
    final connectorPaint = Paint()
      ..shader = LinearGradient(
        colors: [primaryColor, lightPurple, Colors.white],
        stops: const [0.0, 0.55, 1.0],
        begin: Alignment.centerLeft,
        end: Alignment.bottomRight,
      ).createShader(Offset.zero & size);

    final connectorPath = Path()
      ..moveTo(size.width * 0.18, size.height * 0.28)
      ..lineTo(size.width * 0.92, size.height * 0.06)
      ..lineTo(size.width, size.height * 0.3)
      ..lineTo(size.width * 0.54, size.height * 0.56)
      ..lineTo(size.width * 0.18, size.height * 0.42)
      ..close();
    canvas.drawPath(connectorPath, connectorPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
