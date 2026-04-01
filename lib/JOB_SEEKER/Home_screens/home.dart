// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/Chat_screens/chatpage.dart';
import 'package:true_jobs/JOB_SEEKER/Functions/filter.dart';
import 'package:true_jobs/JOB_SEEKER/Home_screens/notification.dart';
import 'package:true_jobs/JOB_SEEKER/Functions/search_screen.dart';
import 'package:true_jobs/JOB_SEEKER/Job_screens/saved_job.dart';
import 'package:true_jobs/Models/job_card.dart';
import 'package:true_jobs/Models/job_details.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile_setting_page.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final purpleColor = const Color(0xFF7C329B);

  List<Map<String, dynamic>> jobs = [
    {
      "id": "1",
      "company": "Smart Global Solutions",
      "title": "Flutter Developer",
      "location": "Tiruppur",
      "salary": "8,000 - 10,000",
      "posted": "5 days ago",
      "monthly": true,
      "isApplied": false,
      "isInprogress": false,
      "isRejected": true,
      "isSaved": false,
      "assetImage": "assets/demo.png",
    },
    {
      "id": "2",
      "company": "Smart Global Solutions",
      "title": "UI/UX Designer",
      "location": "Tiruppur",
      "salary": "8,000 - 10,000",
      "posted": "5 days ago",
      "monthly": true,
      "isApplied": false,
      "isInprogress": true,
      "isRejected": false,
      "isSaved": false,
      "assetImage": "assets/demo.png",
    },
    {
      "id": "3",
      "company": "Smart Global Solutions",
      "title": "Web Developer",
      "location": "Tiruppur",
      "salary": "8,000 - 10,000",
      "posted": "5 days ago",
      "monthly": true,
      "isApplied": true,
      "isInprogress": false,
      "isRejected": false,
      "isSaved": false,
      "assetImage": "assets/demo.png",
    },
    {
      "id": "3",
      "company": "Smart Global Solutions",
      "title": "Web Developer",
      "location": "Tiruppur",
      "salary": "8,000 - 10,000",
      "posted": "9 days ago",
      "monthly": true,
      "isApplied": true,
      "isInprogress": false,
      "isRejected": false,
      "isSaved": false,
      "assetImage": "assets/demo.png",
    },
     {
      "id": "3",
      "company": "Smart Global Solutions",
      "title": "Web Developer",
      "location": "Tiruppur",
      "salary": "8,000 - 10,000",
      "posted": "7 days ago",
      "monthly": true,
      "isApplied": false,
      "isInprogress": false,
      "isRejected": false,
      "isSaved": false,
      "assetImage": "assets/demo.png",
    },
  ];

  List<Map<String, dynamic>> get savedJobs =>
      jobs.where((job) => job["isSaved"] == true).toList();

  void _updateJob(Map<String, dynamic> updatedJob) {
    setState(() {
      final index = jobs.indexWhere((job) => job["id"] == updatedJob["id"]);
      if (index != -1) {
        jobs[index] = updatedJob;
      }
    });
  }

  void _handleSaveTap(int index) {
    setState(() {
      jobs[index]["isSaved"] = !jobs[index]["isSaved"];

      // Show a snackbar message
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       jobs[index]["isSaved"]
      //           ? 'Job saved to your list'
      //           : 'Job removed from your list',
      //       style: GoogleFonts.poppins(),
      //     ),
      //     duration: Duration(seconds: 2),
      //     behavior: SnackBarBehavior.floating,
      //     margin: EdgeInsets.all(10),
      //   ),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive values
    final double horizontalPadding = screenWidth * 0.05;
    final double verticalSpacingSmall = screenHeight * 0.015;
    final double verticalSpacingMedium = screenHeight * 0.025;
    final double headerFontSize = screenWidth * 0.034;
    final double subHeaderFontSize = screenWidth * 0.035;
    final double cardTitleFontSize = screenWidth * 0.04;
    final double cardSubTitleFontSize = screenWidth * 0.03;
    final double iconSize = screenWidth * 0.08;
    final double searchBarHeight = screenHeight * 0.055;
    final double bottomNavHeight = screenHeight * 0.08;

    final double collapsedSearchBarHeight = searchBarHeight * 0.9;
    final double collapsedGreetingHeight = headerFontSize * 1.6;
    final double collapsedVerticalPadding = verticalSpacingSmall * 1.0;
    final double collapsedHeight =
        collapsedSearchBarHeight + collapsedGreetingHeight + collapsedVerticalPadding + 12;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: purpleColor,
              pinned: true,
              expandedHeight: screenHeight * 0.33,
              collapsedHeight: collapsedHeight,
              toolbarHeight: collapsedHeight,
              elevation: 0,
              automaticallyImplyLeading: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  var top = constraints.biggest.height;
                  bool collapsed = top <= collapsedHeight + 1.0;

                  return FlexibleSpaceBar(
                    background: _buildExpandedHeader(
                      screenWidth,
                      screenHeight,
                      horizontalPadding,
                      verticalSpacingSmall,
                      verticalSpacingMedium,
                      searchBarHeight,
                      headerFontSize,
                      subHeaderFontSize,
                      iconSize,
                    ),
                    titlePadding: EdgeInsets.zero,
                    title: collapsed
                        ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: collapsedSearchBarHeight,
                            child: TextField(
                              readOnly: true,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SearchScreen(),
                                  ),
                                );
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey.shade600,
                                  size: iconSize * 0.7,
                                ),
                                hintText: 'Search jobs',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: subHeaderFontSize * 0.9,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: collapsedSearchBarHeight * 0.12,
                                  horizontal: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Hi ! SMART GLOBAL SOLUTIONS",
                                  style: GoogleFonts.poppins(
                                    fontSize: headerFontSize * 0.95,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SavedJob(
                                            savedJobs: savedJobs,
                                            onUpdate: _updateJob,
                                            allJobs: jobs,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.bookmark_border,
                                      color: Colors.white,
                                      size: iconSize * 0.9,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const NotificationScreen(),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.notifications_none,
                                      color: Colors.white,
                                      size: iconSize * 0.9,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                    )
                        : null,
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      verticalSpacingMedium,
                      horizontalPadding,
                      verticalSpacingSmall * 0.5,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Explore your jobs",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: cardTitleFontSize * 1.1,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "based on your profile",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: cardSubTitleFontSize * 1.1,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FilterScreen(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.filter_alt_outlined,
                            color: purpleColor,
                            size: iconSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: verticalSpacingSmall * 0.5,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: purpleColor,
                          size: iconSize * 0.8,
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          "Tiruppur",
                          style: GoogleFonts.poppins(
                            color: purpleColor,
                            fontSize: subHeaderFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: jobs.asMap().entries.map((entry) {
                      int index = entry.key;
                      Map<String, dynamic> job = entry.value;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JobDetails(job: job),
                            ),
                          );
                        },
                        child: JobCard(
                          company: job["company"],
                          title: job["title"],
                          location: job["location"],
                          salary: job["salary"],
                          posted: job["posted"],
                          monthly: job["monthly"],
                          cardTitleFontSize: cardTitleFontSize,
                          cardSubTitleFontSize: cardSubTitleFontSize,
                          iconSize: iconSize * 0.8,
                          isApplied: job["isApplied"],
                          isInprogress: job["isInprogress"],
                          isRejected: job["isRejected"],
                          isSaved: job["isSaved"],
                          assetImage: job["assetImage"],
                          onSavedTap: () => _handleSaveTap(index),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                bottom: bottomNavHeight + verticalSpacingMedium,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.withValues(alpha: 0.25))),
          color: Colors.white,
        ),
        height: bottomNavHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _NavIcon(
              icon: Icons.home,
              label: "Home",
              selected: true,
              iconSize: iconSize,
              fontSize: subHeaderFontSize * 0.8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavedJob(
                      savedJobs: savedJobs,
                      onUpdate: _updateJob,
                      allJobs: jobs,
                    ),
                  ),
                );
              },
              child: _NavIcon(
                icon: Icons.work_outline,
                label: "Jobs",
                selected: false,
                iconSize: iconSize,
                fontSize: subHeaderFontSize * 0.8,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Chatpage()),
                );
              },
              child: _NavIcon(
                icon: Icons.chat_outlined,
                label: "Chats",
                selected: false,
                iconSize: iconSize,
                fontSize: subHeaderFontSize * 0.8,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: _NavIcon(
                icon: Icons.person_outline,
                label: "Profile",
                selected: false,
                iconSize: iconSize,
                fontSize: subHeaderFontSize * 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedHeader(
      double screenWidth,
      double screenHeight,
      double horizontalPadding,
      double verticalSpacingSmall,
      double verticalSpacingMedium,
      double searchBarHeight,
      double headerFontSize,
      double subHeaderFontSize,
      double iconSize,
      ) {
    final purpleColor = const Color(0xFF7C329B);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: purpleColor,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalSpacingMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding * 0.8,
              vertical: verticalSpacingSmall,
            ),
            child: SizedBox(
              height: searchBarHeight,
              child: TextField(
                readOnly: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade500,
                    size: iconSize * 0.8,
                  ),
                  hintText: 'Search jobs',
                  hintStyle: GoogleFonts.poppins(fontSize: subHeaderFontSize),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: searchBarHeight * 0.1,
                    horizontal: horizontalPadding * 0.4,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(horizontalPadding * 0.2),
                child: Text(
                  "Hi ! SMART GLOBAL SOLUTIONS",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: headerFontSize,
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.08),
              IconButton(
                icon: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                  size: iconSize,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SavedJob(
                        savedJobs: savedJobs,
                        onUpdate: _updateJob,
                        allJobs: jobs,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(width: screenWidth * 0.01),
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: iconSize,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          // ADDED CODE STARTS HERE
          Padding(
            padding: EdgeInsets.only(
              top: verticalSpacingSmall,
              left: horizontalPadding * 0.2,
              right: horizontalPadding * 0.2,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(horizontalPadding * 0.5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Finish your profile &\nget noticed!",
                          style: GoogleFonts.poppins(
                            color: purpleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: subHeaderFontSize * 0.9,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: verticalSpacingSmall * 0.5),
                        Text(
                          "85 %",
                          style: GoogleFonts.poppins(
                            color: purpleColor,
                            fontWeight: FontWeight.w600,
                            fontSize: headerFontSize * 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: horizontalPadding * 0.5),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(horizontalPadding * 0.75),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Visibility in search",
                          style: GoogleFonts.poppins(
                            color: purpleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: subHeaderFontSize * 0.82,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: verticalSpacingSmall * 0.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "26",
                              style: GoogleFonts.poppins(
                                color: purpleColor,
                                fontWeight: FontWeight.w600,
                                fontSize: headerFontSize * 1.3,
                              ),
                            ),
                            SizedBox(width: horizontalPadding * 0.3),
                            Flexible(
                              child: Text(
                                "Recruiters\nnoticed you",
                                style: GoogleFonts.poppins(
                                  color: purpleColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: subHeaderFontSize * 0.9,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ADDED CODE ENDS HERE
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final double iconSize;
  final double fontSize;

  const _NavIcon({
    required this.icon,
    required this.label,
    required this.selected,
    required this.iconSize,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final purpleColor = const Color(0xFF7C329B);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize * 0.85,
          color: selected ? purpleColor : Colors.grey,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            color: selected ? purpleColor : Colors.grey,
          ),
        ),
      ],
    );
  }
}
