// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/Chat_screens/chatpage.dart';
import 'package:true_jobs/JOB_SEEKER/Home_screens/home.dart';
import 'package:true_jobs/Models/job_card.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile_setting_page.dart';

class SavedJob extends StatefulWidget {
  final List<Map<String, dynamic>> savedJobs;
  final Function(Map<String, dynamic> job)? onUpdate;
  const SavedJob({super.key, required this.savedJobs, this.onUpdate, required List<Map<String, dynamic>> allJobs});

  @override
  State<SavedJob> createState() => _SavedJobState();
}

class _SavedJobState extends State<SavedJob> {
  int selectedTab = 0;
  int bottomNavIndex = 1;

  void saveJob(Map<String, dynamic> job) {
    setState(() {
      job["isSaved"] = true;

      if (!widget.savedJobs.any((j) => j["id"] == job["id"])) {
        widget.savedJobs.add(job);
      }

      if (widget.onUpdate != null) {
        widget.onUpdate!(job);
      }
    });

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('Job saved successfully!'),
    //     duration: Duration(seconds: 2),
    //   ),
    // );
  }

  void unsaveJob(Map<String, dynamic> job) {
    setState(() {
      job["isSaved"] = false;
      widget.savedJobs.removeWhere((j) => j["id"] == job["id"]);
      if (widget.onUpdate != null) {
        widget.onUpdate!(job);
      }
    });

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('Job removed from saved list.'),
    //     duration: Duration(seconds: 2),
    //   ),
    // );
  }

  void toggleSaveJob(Map<String, dynamic> job) {
    if (job["isSaved"] == true) {
      unsaveJob(job);
    } else {
      saveJob(job);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final purpleColor = const Color(0xFF7C329B);
    List<Map<String, dynamic>> displayedJobs;
    switch (selectedTab) {
      case 1:
        displayedJobs =
            widget.savedJobs.where((j) => j["isApplied"] == true).toList();
        break;
      case 2:
        displayedJobs =
            widget.savedJobs.where((j) => j["isInprogress"] == true).toList();
        break;
      case 3:
        displayedJobs =
            widget.savedJobs.where((j) => j["isRejected"] == true).toList();
        break;
      default:
        displayedJobs =
            widget.savedJobs.where((j) => j["isSaved"] == true).toList();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: purpleColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(
              context, MaterialPageRoute(builder: (_) => const Home())),
        ),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              Text(
                "Jobs ",
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "For You!",
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02,
                vertical: screenHeight * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _JobCategoryTab(
                    title: "Saved",
                    selected: selectedTab == 0,
                    onTap: () => setState(() => selectedTab = 0),
                  ),
                  _JobCategoryTab(
                    title: "Applied",
                    selected: selectedTab == 1,
                    onTap: () {
                      setState(() {
                        selectedTab = 1;
                        if (!widget.savedJobs.any((job) => job["id"] == 101)) {
                          widget.savedJobs.add({
                            "id": 101,
                            "company": "Smart Global Solutions",
                            "title": "Flutter Developer",
                            "location": "Bangalore",
                            "salary": "₹15 LPA",
                            "posted": "Today",
                            "monthly": true,
                            "assetImage": "assets/demo.png",
                            "isSaved": false,
                            "isApplied": true,
                            "isInprogress": false,
                            "isRejected": false,
                          });
                        }
                        if (!widget.savedJobs.any((job) => job["id"] == 102)) {
                          widget.savedJobs.add({
                            "id": 102,
                            "company": "Smart Global Solutions",
                            "title": "UI UX Designer",
                            "location": "Bangalore",
                            "salary": "₹15 LPA",
                            "posted": "Today",
                            "monthly": true,
                            "assetImage": "assets/demo.png",
                            "isSaved": false,
                            "isApplied": true,
                            "isInprogress": false,
                            "isRejected": false,
                          });
                        }
                        if (!widget.savedJobs.any((job) => job["id"] == 103)) {
                          widget.savedJobs.add({
                            "id": 103,
                            "company": "Smart Global Solutions",
                            "title": "PHP Developer",
                            "location": "Bangalore",
                            "salary": "₹15 LPA",
                            "posted": "Today",
                            "monthly": true,
                            "assetImage": "assets/demo.png",
                            "isSaved": false,
                            "isApplied": true,
                            "isInprogress": false,
                            "isRejected": false,
                          });
                        }

                      });
                    },
                  ),
                  _JobCategoryTab(
                    title: "In-Progress",
                    selected: selectedTab == 2,
                    onTap: () {
                      setState(() {
                        selectedTab = 2;
                        if (!widget.savedJobs.any((job) => job["id"] == 104)) {
                          widget.savedJobs.add({
                            "id": 104,
                            "company": "Smart Global Solutions",
                            "title": "Flutter Developer",
                            "location": "Bangalore",
                            "salary": "₹15 LPA",
                            "posted": "Today",
                            "monthly": true,
                            "assetImage": "assets/demo.png",
                            "isSaved": false,
                            "isApplied": false,
                            "isInprogress": true,
                            "isRejected": false,
                          });
                        }
                        if (!widget.savedJobs.any((job) => job["id"] == 105)) {
                          widget.savedJobs.add({
                            "id": 105,
                            "company": "Smart Global Solutions",
                            "title": "UI UX Designer",
                            "location": "Bangalore",
                            "salary": "₹15 LPA",
                            "posted": "Today",
                            "monthly": true,
                            "assetImage": "assets/demo.png",
                            "isSaved": false,
                            "isApplied": false,
                            "isInprogress": true,
                            "isRejected": false,
                          });
                        }
                        if (!widget.savedJobs.any((job) => job["id"] == 106)) {
                          widget.savedJobs.add({
                            "id": 106,
                            "company": "Smart Global Solutions",
                            "title": "PHP Developer",
                            "location": "Bangalore",
                            "salary": "₹15 LPA",
                            "posted": "Today",
                            "monthly": true,
                            "assetImage": "assets/demo.png",
                            "isSaved": false,
                            "isApplied": false,
                            "isInprogress": true,
                            "isRejected": false,
                          });
                        }
                      });
                    },
                  ),
                  _JobCategoryTab(
                    title: "Rejected",
                    selected: selectedTab == 3,
                    onTap: () {
                      setState(() {
                        selectedTab = 3;
                        if (!widget.savedJobs.any((job) => job["id"] == 107)) {
                          widget.savedJobs.add({
                            "id": 107,
                            "company": "Smart Global Solutions",
                            "title": "Flutter Developer",
                            "location": "Bangalore",
                            "salary": "₹15 LPA",
                            "posted": "Today",
                            "monthly": true,
                            "assetImage": "assets/demo.png",
                            "isSaved": false,
                            "isApplied": false,
                            "isInprogress": false,
                            "isRejected": true,
                          });
                        }
                        if (!widget.savedJobs.any((job) => job["id"] == 108)) {
                          widget.savedJobs.add({
                            "id": 108,
                            "company": "Smart Global Solutions",
                            "title": "UI UX Designer",
                            "location": "Bangalore",
                            "salary": "₹15 LPA",
                            "posted": "Today",
                            "monthly": true,
                            "assetImage": "assets/demo.png",
                            "isSaved": false,
                            "isApplied": false,
                            "isInprogress": false,
                            "isRejected": true,
                          });
                        }
                        if (!widget.savedJobs.any((job) => job["id"] == 109)) {
                          widget.savedJobs.add({
                            "id": 109,
                            "company": "Smart Global Solutions",
                            "title": "PHP Developer",
                            "location": "Bangalore",
                            "salary": "₹15 LPA",
                            "posted": "Today",
                            "monthly": true,
                            "assetImage": "assets/demo.png",
                            "isSaved": false,
                            "isApplied": false,
                            "isInprogress": false,
                            "isRejected": true,
                          });
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: displayedJobs.isEmpty
                  ? Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.1),
                      SizedBox(
                        width: screenWidth * 0.7,
                        height: screenWidth * 0.7,
                        child: Image.asset(
                          'assets/walkthrough.gif',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        "No Jobs Here!",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05),
                        child: Text(
                          "Browse listings and save or apply for jobs to see them here.",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      SizedBox(
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.06,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Home()),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Search Jobs",
                            style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
                  : ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.01,
                ),
                itemCount: displayedJobs.length,
                itemBuilder: (context, index) {
                  final job = displayedJobs[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                    child: JobCard(
                      company: job["company"],
                      title: job["title"],
                      location: job["location"],
                      salary: job["salary"],
                      posted: job["posted"],
                      monthly: job["monthly"],
                      cardTitleFontSize: screenWidth * 0.04,
                      cardSubTitleFontSize: screenWidth * 0.033,
                      iconSize: screenWidth * 0.06,
                      isApplied: job["isApplied"],
                      isInprogress: job["isInprogress"],
                      isRejected: job["isRejected"],
                      isSaved: job["isSaved"],
                      assetImage: job["assetImage"],
                      onSavedTap: () {
                        toggleSaveJob(job);
                      },
                    ),
                  );
                },
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
        height: screenHeight * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(
                    context, MaterialPageRoute(builder: (_) => const Home()));
              },
              child: _NavIcon(
                  icon: Icons.home, label: "Home", selected: bottomNavIndex == 0),
            ),
            _NavIcon(
                icon: Icons.work_outline,
                label: "Jobs",
                selected: bottomNavIndex == 1),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const Chatpage()));
              },
              child: _NavIcon(
                  icon: Icons.chat_outlined,
                  label: "Chats",
                  selected: bottomNavIndex == 2),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const ProfilePage()));
              },
              child: _NavIcon(
                  icon: Icons.person_outline,
                  label: "Profile",
                  selected: bottomNavIndex == 3),
            ),
          ],
        ),
      ),
    );
  }
}

class _JobCategoryTab extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback? onTap;

  const _JobCategoryTab({
    required this.title,
    required this.selected,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: selected
              ? const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.purple, width: 3),
            ),
          )
              : null,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: selected ? FontWeight.bold : FontWeight.w500,
              color: selected ? Colors.purple : Colors.black,
              fontSize: MediaQuery.of(context).size.width * 0.035,
            ),
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const _NavIcon({
    required this.icon,
    required this.label,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const purpleColor = Color(0xFF7C329B);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: selected ? purpleColor : Colors.grey, size: 26),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: selected ? purpleColor : Colors.grey,
            fontWeight: selected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
