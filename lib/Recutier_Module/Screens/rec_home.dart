import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/Recutier_Module/Screens/rec_notification.dart';
import 'package:true_jobs/Recutier_Module/Screens/Menu/Post_Job/post_job1.dart';
import 'package:true_jobs/Recutier_Module/Screens/Rec_payment_screens/subscription.dart';
import 'package:true_jobs/Recutier_Module/Widgets/bottom_nav.dart';
import 'package:true_jobs/Recutier_Module/Widgets/Search/rec_search.dart';
import '../Widgets/custom_drawer.dart';

class RecHome extends StatefulWidget {
  const RecHome({super.key});

  static const Color primaryColor = Color(0xFF7C329B);

  @override
  State<RecHome> createState() => _RecHomeState();
}

class _RecHomeState extends State<RecHome> {
 
  static const Color primaryColor = Color(0xFF7C329B);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      drawer: const SmartGlobalDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(screenWidth, screenHeight),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCompanyRow(context, screenWidth),
                    const SizedBox(height: 16),
                    Text(
                      'Subscription Plans',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildPlanSection(context, screenWidth, screenHeight),
                    const SizedBox(height: 16),
                    _buildPostJobCard(context, screenWidth, screenHeight),
                    const SizedBox(height: 24),
                    _buildEmptyState(screenWidth, screenHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const RecruiterBottomNav(currentIndex: 0),
    );
  }

  Widget _buildTopBar(double screenWidth, double screenHeight) {
    return Container(
      color: primaryColor,
      padding: EdgeInsets.fromLTRB(
        12,
        screenHeight * 0.01,
        12,
        screenHeight * 0.012,
      ),
      child: Row(
        children: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecSearch()),
                );
              },
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IgnorePointer(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search candidates by role/title',
                      hintStyle: GoogleFonts.poppins(
                        color: const Color(0xFF9A9A9A),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: const Color(0xFF9A9A9A),
                        size: 22,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                    autofocus: false,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyRow(BuildContext context, double screenWidth) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE2E2E2)),
          ),
          child: ClipOval(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Image.asset(
                'assets/smart_logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            'SMART GLOBAL SOLUTIONS',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              height: 1,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.bookmark_border_rounded,
            color: Colors.black87,
            size: 24,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RecNotification()),
            );
          },
          icon: Icon(
            Icons.notifications_none_rounded,
            color: Colors.black87,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildPlanSection(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: _buildPlanImage(
                  'assets/basic.png',
                  screenWidth,
                  screenHeight,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildPlanImage(
                  'assets/premium.png',
                  screenWidth,
                  screenHeight,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Subscription()),
            );
          },
          child: Text(
            'View Plan\nDetails',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: primaryColor,
              height: 1.1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlanImage(
    String assetPath,
    double screenWidth,
    double screenHeight,
  ) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        child: Image.asset(
          assetPath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildPostJobCard(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PostJobScreen()),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F1F4),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 88,
              height: 88,
              child: Image.asset(
                'assets/mobile.gif',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFD1A9E6),
                      width: 1.2,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Post Jobs',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFC58ADF),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(
                        Icons.play_arrow_rounded,
                        color: const Color(0xFFC58ADF),
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(double screenWidth, double screenHeight) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: screenWidth * 0.62,
            child: Image.asset(
              'assets/paperplan.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Start Posting Jobs to See Listings',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF9E9E9E),
              height: 1,
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

