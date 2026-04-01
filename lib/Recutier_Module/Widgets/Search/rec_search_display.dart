import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/Recutier_Module/Widgets/Search/search_filter.dart';
import 'package:true_jobs/Recutier_Module/Widgets/custom_drawer.dart';



class RecSavedProfileScreen extends StatelessWidget {
  const RecSavedProfileScreen({super.key});

  final List<Map<String, String>> profiles = const [
    {
      'name': 'Marvin McKinney',
      'location': 'Coimbatore',
      'role': 'Ui/Ux Designer',
      'experience': '2 Yr Exp',
      'education': 'UG',
      'expected': '25,000',
      'language': 'English (Advanced)',
      'status': 'Opened',
      'avatar': 'assets/demo1.png',
    },
    {
      'name': 'Robert Fox',
      'location': 'Coimbatore',
      'role': 'Ui/Ux Designer',
      'experience': '2 Yr Exp',
      'education': 'UG',
      'expected': '25,000',
      'language': 'English (Advanced)',
      'status': '',
      'avatar': 'assets/demo2.png',
    },
    {
      'name': 'Priscilla',
      'location': 'Coimbatore',
      'role': 'Ui/Ux Designer',
      'experience': '2 Yr Exp',
      'education': 'UG',
      'expected': '25,000',
      'language': 'English (Advanced)',
      'status': '',
      'avatar': 'assets/demo3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double scaleWidth(double size) => size * width / 375;

    return Scaffold(
      drawer: const SmartGlobalDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF7B2B91),
        elevation: 0,
        titleSpacing: 0,
        title: SizedBox(
          height: 56.0,
          child: Row(
            children: [
            Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          iconSize: scaleWidth(24),
          padding: EdgeInsets.symmetric(horizontal: scaleWidth(12)),
        ),
      ),
              // Expanded Search bar
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: scaleWidth(36),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(scaleWidth(8)),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: scaleWidth(8)),
                    child: Row(
                      children: [
                        Icon(Icons.search,
                            color: const Color(0xFF7B2B91), size: scaleWidth(20)),
                        SizedBox(width: scaleWidth(8)),
                        Expanded(
                          child: Text(
                            'Flutter Developer',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: const Color(0xFF7B2B91),
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(
                            minHeight: scaleWidth(24),
                            minWidth: scaleWidth(24),
                          ),
                          icon: const Icon(Icons.close, color: Color(0xFF7B2B91)),
                          iconSize: scaleWidth(18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Connect with talents',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 1,
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Save',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF7B2B91),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 1,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>const FilterScreen1()));
                      },
                      icon: const Icon(Icons.filter_alt_outlined,
                          color: Color(0xFF7B2B91)),
                      iconSize: scaleWidth(24),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: scaleWidth(4)),
            Text(
              'Faster than ever',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF7B2B91),
                height: 1,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '1 coins will be spent to open each profile',
              style: GoogleFonts.poppins(
                color: const Color(0xFF2AB930),
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 1,
              ),
            ),
            const SizedBox(height: 16),
            // Profile cards
            Column(
              children: profiles
                  .map(
                    (profile) => ProfileCard(
                  profile: profile,
                  scaleWidth: scaleWidth,
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Map<String, String> profile;
  final double Function(double) scaleWidth;

  const ProfileCard({
    super.key,
    required this.profile,
    required this.scaleWidth,
  });

  @override
  Widget build(BuildContext context) {
    final bool isOpened = (profile['status'] ?? '').toLowerCase() == 'opened';

    return Container(
      
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
         border: Border.all(color: const Color(0xFFE5E5E5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: scaleWidth(6),
            offset: Offset(0, scaleWidth(3)),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar Circle
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(profile['avatar']!),
          ),
          const SizedBox(width: 12),
          // Details Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        profile['name'] ?? '',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black,
                          height: 1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.bookmark_border,
                      color: const Color(0xFF7B2B91),
                      size: scaleWidth(24),
                    ),
                  ],
                ),
                SizedBox(height: scaleWidth(4)),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: scaleWidth(16),
                      color: const Color(0xFF7B2B91),
                    ),
                    SizedBox(width: scaleWidth(6)),
                    Text(
                      profile['location'] ?? '',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xFF7B2B91),
                        height: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: scaleWidth(6)),
                
                RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xFF7B2B91),
                      height: 1,
                    ),
                    children: [
                      TextSpan(
                        text: profile['role'] ?? '',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const TextSpan(
                          text: '  |  ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black)),
                      TextSpan(
                        text: profile['experience'] ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                      const TextSpan(
                          text: '  |  ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black)),
                      TextSpan(
                        text: profile['education'] ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: scaleWidth(12)),
                Divider(color: const Color(0xFFE1E1E1), thickness: 1.2),
                SizedBox(height: scaleWidth(12)),
                
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Expected: ',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF7B7B7B),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                    Icon(
                      Icons.currency_rupee,
                      size: scaleWidth(16),
                      color: const Color(0xFF7B2B91),
                    ),
                    SizedBox(width: scaleWidth(4)),
                    Text(
                      profile['expected'] ?? '',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 14,
                        height: 1,
                      ),
                    ),
                    SizedBox(width: scaleWidth(6)),
                    Text(
                      '/month',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF7B7B7B),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: scaleWidth(6)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Language: ',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF7B7B7B),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        profile['language'] ?? '',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 14,
                          height: 1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isOpened)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: scaleWidth(10),
                          vertical: scaleWidth(4),
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CD964).withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(scaleWidth(12)),
                        ),
                        child: Text(
                          'Opened',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF4CD964),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            height: 1,
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
