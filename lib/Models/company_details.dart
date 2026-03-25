import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/Models/job_card.dart';


class SeekerCompanyDetails extends StatefulWidget {
  const SeekerCompanyDetails({super.key});

  @override
  State<SeekerCompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<SeekerCompanyDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Color purpleColor = const Color(0xFF7C329B);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              color: purpleColor,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: screenW * 0.04),
              child: SafeArea(
                bottom: false,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: Colors.white, size: screenW * 0.06),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: screenW * 0.04, vertical: screenH * 0.015),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: screenW * 0.08,
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: AssetImage("assets/demo.png"),
                  ),
                  SizedBox(width: screenW * 0.03),
                  Expanded(
                    child: Text(
                      "Smart Global Solutions",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: screenW * 0.05,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                labelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: screenW * 0.035,
                ),
                unselectedLabelColor: Colors.black54,
                labelColor: purpleColor,
                indicatorColor: purpleColor,
                indicatorWeight: 3,
                tabs: const [
                  Tab(text: "About Us"),
                  Tab(text: "What we do"),
                  Tab(text: "Job listings"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _aboutUsTab(screenW, screenH),
                  _whatWeDoTab(screenW, screenH),
                  _jobListingsTab(screenW, screenH),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _aboutUsTab(double screenW, double screenH) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(screenW * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Company details",
            style: GoogleFonts.poppins(
              fontSize: screenW * 0.05,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenH * 0.02),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: Colors.grey,
                width: 1.5,
              ),

            ),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(screenW * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _detailItem("Industry/domain", "IT Servicing & Consulting", screenW),
                  _detailItem("Company size", "20 - 35 Members", screenW),
                  _detailItem("Year of establishment", "2017", screenW),
                  _detailItem("Mail id", "hr@smartglobalsolutions.in", screenW),
                  _detailItem("Website", "https://smartglobalsolutions.in",
                      screenW, isLink: true),
                  _detailItem("GST no.", "33ADWF521640128", screenW),
                  _detailItem("Location",
                      "9th Street, Sri Krishna Nagar, Tiruppur, Tamil Nadu 641103", screenW),
                  SizedBox(height: screenH * 0.015),
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: purpleColor,
                        minimumSize: Size(screenW * 0.4, screenH * 0.05),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        "Show on map",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: screenW * 0.04,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _whatWeDoTab(double screenW, double screenH) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(screenW * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What we do",
            style: GoogleFonts.poppins(
              fontSize: screenW * 0.05,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenH * 0.02),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: Colors.grey,
                width: 1.5,
              ),

            ),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(screenW * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "At Smart Global Solutions, we specialize in delivering cutting-edge IT solutions that drive business growth and efficiency. Our expert team harnesses the power of technology and innovation to meet the unique needs of our clients.",
                    style: GoogleFonts.poppins(
                      fontSize: screenW * 0.035,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: screenH * 0.02),
                  _bulletPoint(
                    "Custom Software Development:",
                    "We design and develop tailored software solutions that streamline operations and enhance productivity.",
                    screenW,
                  ),
                  _bulletPoint(
                    "Web & Mobile App Development:",
                    "Our skilled developers create user-friendly, high-performance apps that offer seamless experiences across platforms.",
                    screenW,
                  ),
                  _bulletPoint(
                    "Cloud Solutions:",
                    "We help businesses transition to the cloud, ensuring scalability, security, and flexibility.",
                    screenW,
                  ),
                  _bulletPoint(
                    "IT Consulting & Support:",
                    "We provide expert consulting and ongoing support, helping you make informed tech decisions.",
                    screenW,
                  ),
                  _bulletPoint(
                    "Data Analytics & AI:",
                    "Leverage the power of data-driven insights and AI to boost business performance.",
                    screenW,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _jobListingsTab(double screenW, double screenH) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(screenW * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
        "Job Listings",
        style: GoogleFonts.poppins(
          fontSize: screenW * 0.05,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(height: screenH * 0.02),
      Padding(
        padding: EdgeInsets.symmetric(vertical: screenH * 0.01),
        child: Column(
          children: [
            JobCard(
              company: "Smart Global Solutions",
              title: "Flutter Developer",
              location: "Tiruppur",
              salary: "8,000 – 10,000",
              posted: "5 days ago",
              monthly: true,
              assetImage: "assets/demo.png",
              urgent: false,
              physicallyChallenged: false,
              isApplied: false,
              isInprogress: false,
              isRejected: false,
              isSaved: true,
            
              cardTitleFontSize: screenW * 0.04,
              cardSubTitleFontSize: screenW * 0.035,
              iconSize: screenW * 0.055,
            ),
            JobCard(
              company: "Smart Global Solutions",
              title: "UI/UX Designer",
              location: "Tiruppur",
              salary: "8,000 – 10,000",
              posted: "5 days ago",
              monthly: true,
              assetImage: "assets/demo.png",
              urgent: true,
              physicallyChallenged: false,
              isApplied: false,
              isInprogress: false,
              isRejected: false,
              isSaved: false,
             
              cardTitleFontSize: screenW * 0.04,
              cardSubTitleFontSize: screenW * 0.035,
              iconSize: screenW * 0.055,
            ),
            JobCard(
              company: "Smart Global Solutions",
              title: "PHP Developer",
              location: "Tiruppur",
              salary: "8,000 – 10,000",
              posted: "5 days ago",
              monthly: true,
              assetImage: "assets/demo.png",
              urgent: true,
              physicallyChallenged: false,
              isApplied: false,
              isInprogress: false,
              isRejected: false,
              isSaved: false,
              
              cardTitleFontSize: screenW * 0.04,
              cardSubTitleFontSize: screenW * 0.035,
              iconSize: screenW * 0.055,
            ),
          ],
        ),
      ),
    ])
    );
  }
  Widget _detailItem(String label, String value, double screenW, {bool isLink = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenW * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: screenW * 0.038,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF7C329B)
            ),
          ),
          SizedBox(height: screenW * 0.01),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: screenW * 0.035,
              color: isLink ? Colors.blue : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
Widget _bulletPoint(String title, String description, double screenW) {
  return Padding(
    padding: EdgeInsets.only(bottom: screenW * 0.04),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_box, color: Colors.green, size: 20),
        SizedBox(width: screenW * 0.02),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title ",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: screenW * 0.035,
                  ),
                ),
                TextSpan(
                  text: description,
                  style: GoogleFonts.poppins(
                    fontSize: screenW * 0.035,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}