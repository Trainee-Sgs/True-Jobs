import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/Recutier_Module/Screens/rec_notification.dart';
import 'package:true_jobs/Recutier_Module/Screens/profiles/rec_saved_profile_details.dart';
import 'active.dart';
import 'pending.dart';
import 'expired.dart';

class PostingStatusScreen extends StatefulWidget {
  const PostingStatusScreen({super.key});

  @override
  State<PostingStatusScreen> createState() => _PostingStatusScreenState();
}

class _PostingStatusScreenState extends State<PostingStatusScreen>
    with SingleTickerProviderStateMixin {
  static const Color primaryColor = Color(0xFF6A3085);

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  double textScale(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 350) return 0.85;
    if (width > 600) return 1.1;
    return 1.0;
  }

  double paddingScale(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 350) return 0.8;
    if (width > 600) return 1.2;
    return 1.0;
  }

  @override
  Widget build(BuildContext context) {
    final double tScale = textScale(context);
    final double pScale = paddingScale(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Posting Status',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16 * tScale,
            color: Colors.white,
            height: 1,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecSavedProfileDetails(),
                ),
              );

            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=> RecNotification()));
              
            },
          ),
          SizedBox(width: 8 * pScale),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 2,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          labelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16 * tScale,
            height: 1,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 14 * tScale,
            height: 1,
          ),
          tabs: const [
            Tab(text: 'Active'),
            Tab(text: 'Pending'),
            Tab(text: 'Expired'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ActiveJobs(tScale: tScale, pScale: pScale),
          PendingJobs(tScale: tScale, pScale: pScale),
          ExpiredJobs(tScale: tScale, pScale: pScale),
        ],
      ),
    );
  }
}
