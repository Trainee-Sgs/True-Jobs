import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_RECRUITER/Main_Screens/rec_home.dart';
import 'package:true_jobs/JOB_RECRUITER/Main_Screens/profiles/rec_saved_profile_details.dart';
import 'package:true_jobs/Models/job_details.dart';

class RecruiterJobDetails extends StatelessWidget {
  const RecruiterJobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    double baseWidth = 375;
    double scale(double w) => w * width / baseWidth;

    final purpleColor = const Color(0xFF7B2B91);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: purpleColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
          iconSize: scale(22),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == "stop") {
                _showStopHiringDialog(context, purpleColor);
              } else if (value == "share") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Share Job Post tapped")),
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "stop",
                child: Row(
                  children: [
                    const Icon(Icons.stop_circle, color: Colors.red),
                    const SizedBox(width: 8),
                    Text("Stop Hiring", style: GoogleFonts.poppins()),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "share",
                child: Row(
                  children: [
                    const Icon(Icons.share, color: Colors.black87),
                    const SizedBox(width: 8),
                    Text("Share Job Post", style: GoogleFonts.poppins()),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(scale(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Job Card
            _buildRecruiterJobCard(
              scale,
              purpleColor,
              "Flutter Developer",
              "Smart Global Solutions",
              "8,000 – 10,000",
              true,
              "Tiruppur",
              "22/01/2025",
              "Basic",
              "05/02/2025",
              "Active",
              onViewTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => JobDetails(job: {},),));
              },
            ),

            const SizedBox(height: 16),
            
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: scale(12), vertical: scale(6)),
                  decoration: BoxDecoration(
                    color: purpleColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "18 Applied",
                    style: GoogleFonts.poppins(
                      color: purpleColor,
                      fontWeight: FontWeight.w600,
                      fontSize: scale(13),
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  icon:
                  const Icon(Icons.download, color: Colors.white, size: 18),
                  label: Text(
                    "Excel Report",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RecSavedProfileDetails()),
                );
              },
              child: _buildCandidateCard(
                scale,
                "Marvin McKinney",
                "Coimbatore",
                "2 Yr Exp",
                "UG",
                "25,000",
                "English (Advanced)",
                "assets/demo1.png",
              ),
            ),

            _buildCandidateCard(
              scale,
              "Marjorie",
              "Coimbatore",
              "2 Yr Exp",
              "UG",
              "25,000",
              "English (Advanced)",
              "assets/demo2.png",
            ),
            _buildCandidateCard(
              scale,
              "Mitchell",
              "Coimbatore",
              "2 Yr Exp",
              "UG",
              "25,000",
              "English (Advanced)",
              "assets/demo3.png",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecruiterJobCard(
      double Function(double) scale,
      Color purpleColor,
      String title,
      String company,
      String salary,
      bool monthly,
      String location,
      String posted,
      String plan,
      String expiresOn,
      String jobStatus, {
        VoidCallback? onViewTap,
        bool? isApplied,
        bool? isInprogress,
        bool? isRejected,
        bool? isViewed,
      }) {
    double cardTitleFontSize = 16;
    double cardSubTitleFontSize = 14;

    Color? statusColor;
    if (jobStatus.toLowerCase() == "active") statusColor = Colors.green;
    if (jobStatus.toLowerCase() == "pending") statusColor = Colors.grey;
    if (jobStatus.toLowerCase() == "expired") statusColor = Colors.red;

    return Container(
      padding: EdgeInsets.all(scale(12)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: scale(28),
                backgroundColor: purpleColor.withOpacity(0.1),
                backgroundImage: AssetImage("assets/demo.png"),
              ),

              SizedBox(width: scale(12)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(title,
                              style: GoogleFonts.poppins(
                                  fontSize: cardTitleFontSize,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: scale(8), vertical: scale(4)),
                          decoration: BoxDecoration(
                            color: statusColor?.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: statusColor!, width: 1),
                          ),
                          child: Text(jobStatus,
                              style: GoogleFonts.poppins(
                                  fontSize: cardSubTitleFontSize * 0.85,
                                  color: statusColor,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                    Text(company,
                        style: GoogleFonts.poppins(
                            fontSize: cardSubTitleFontSize,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: scale(8)),

          Row(
            children: [
              Icon(Icons.currency_rupee, size: scale(16), color: purpleColor),
              SizedBox(width: 4),
              Text(salary,
                  style: GoogleFonts.poppins(
                      fontSize: cardSubTitleFontSize,
                      fontWeight: FontWeight.w600,
                      color: purpleColor)),
              if (monthly)
                Text(" / month",
                    style: GoogleFonts.poppins(
                        fontSize: cardSubTitleFontSize * 0.9,
                        color: Colors.grey)),
            ],
          ),

          SizedBox(height: scale(6)),

          Row(
            children: [
              Icon(Icons.location_on, size: scale(14), color: Colors.grey),
              SizedBox(width: 4),
              Expanded(
                child: Text(location,
                    style: GoogleFonts.poppins(
                        fontSize: cardSubTitleFontSize,
                        color: Colors.black87),
                    overflow: TextOverflow.ellipsis),
              ),
              if (onViewTap != null)
                GestureDetector(
                  onTap: onViewTap,
                  child: Text("View Job",
                      style: GoogleFonts.poppins(
                          fontSize: cardSubTitleFontSize,
                          color: purpleColor,
                          decoration: TextDecoration.underline)),
                ),
            ],
          ),

          SizedBox(height: scale(6)),

          Text("Posted: $posted",
              style: GoogleFonts.poppins(
                  fontSize: cardSubTitleFontSize * 0.9,
                  color: Colors.black87)),
          SizedBox(height: scale(4)),
          Row(
            children: [
              Text("Plan: $plan",
                  style: GoogleFonts.poppins(
                      fontSize: cardSubTitleFontSize * 0.9,
                      color: Colors.black87)),
              SizedBox(width: scale(8)),
              Text("Expires on $expiresOn",
                  style: GoogleFonts.poppins(
                      fontSize: cardSubTitleFontSize * 0.9,
                      color: Colors.black87)),
            ],
          ),

          if (isApplied == true ||
              isInprogress == true ||
              isRejected == true ||
              isViewed == true)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: scale(4)),
                child: Builder(
                  builder: (context) {
                    if (isApplied == true) return _statusText("Applied");
                    if (isInprogress == true) return _statusText("In Progress");
                    if (isRejected == true) return _statusText("Rejected");
                    if (isViewed == true) return _statusText("Viewed");
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _statusText(String text) {
    return Text(text,
        style: GoogleFonts.poppins(
            fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black87));
  }

  Widget _buildCandidateCard(
      double Function(double) scale,
      String name,
      String location,
      String exp,
      String edu,
      String expected,
      String lang,
      String avatar) {
    return Container(
      margin: EdgeInsets.only(bottom: scale(12)),
      padding: EdgeInsets.all(scale(12)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E5E5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: scale(22), backgroundImage: AssetImage(avatar)),
              SizedBox(width: scale(12)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: scale(14))),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: scale(14), color: Colors.grey),
                      SizedBox(width: scale(4)),
                      Text(location,
                          style: GoogleFonts.poppins(
                              fontSize: scale(13), color: Colors.grey[600])),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: scale(10)),
          Text("$exp | $edu | Applied on: 03/02/2025",
              style: GoogleFonts.poppins(fontSize: scale(13))),
          SizedBox(height: scale(8)),
          Row(
            children: [
              Text("Expected:",
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: scale(13))),
              SizedBox(width: scale(6)),
              Icon(Icons.currency_rupee, size: scale(16), color: const Color(0xFF7B2B91)),
              Text(expected,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: scale(13))),
              Text("/month",
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: scale(13))),
            ],
          ),
          SizedBox(height: scale(8)),
          Text("Language: $lang",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: scale(13))),
        ],
      ),
    );
  }

  void _showStopHiringDialog(BuildContext context, Color purpleColor) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Are you sure you want to Stop Hiring?",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "( This job will no longer be visible to candidates )",
              style: GoogleFonts.poppins(color: Colors.red, fontSize: 13),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text("No",
                      style: GoogleFonts.poppins(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const RecHome()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purpleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text("Yes, Stop Hiring",
                      style: GoogleFonts.poppins(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}