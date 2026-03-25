import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActiveJobs extends StatelessWidget {
  final double tScale;
  final double pScale;

  const ActiveJobs({super.key, required this.tScale, required this.pScale});

  static const Color statusColor = Color(0xFF21A366);
  static const Color primaryColor = Color(0xFF772B88);
  static const Color secondaryColor = Color(0xFF541D60);

  final List<Map<String, String>> jobs = const [
    {
      'date': 'Today',
      'title': 'Flutter Developer',
      'experience': 'Experience: 2-4 Years',
      'interview': 'Interview: RS Puram, Coimbatore',
      'status': 'Active',
    },
    {
      'date': 'Today',
      'title': 'Sales Executive',
      'experience': 'Experience: 1-3 Years',
      'interview': 'Interview: Gandhipuram, Coimbatore',
      'status': 'Active',
    },
    {
      'date': '18/03/2026',
      'title': 'HR Recruiter',
      'experience': 'Experience: 0-2 Years',
      'interview': 'Interview: Peelamedu, Coimbatore',
      'status': 'Active',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16 * pScale, vertical: 12 * pScale),
      itemCount: jobs.length,
      separatorBuilder: (_, _) => SizedBox(height: 16 * pScale),
      itemBuilder: (context, index) {
        final job = jobs[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0 || jobs[index]['date'] != jobs[index - 1]['date'])
              _buildDateRow(job['date']!),
            SizedBox(height: 6 * pScale),
            _buildJobCard(job),
          ],
        );
      },
    );
  }

  Widget _buildDateRow(String date) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8 * pScale, vertical: 4 * pScale),
        decoration: BoxDecoration(
          color: const Color(0xFFE8E8E8),
          borderRadius: BorderRadius.circular(4 * pScale),
        ),
        child: Text(
          date,
          style: GoogleFonts.poppins(
            fontSize: 12 * tScale,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            height: 1,
          ),
        ),
      ),
      if (date == 'Today')
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: primaryColor),
            padding: EdgeInsets.symmetric(horizontal: 10 * pScale, vertical: 4 * pScale),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6 * pScale),
            ),
          ),
          onPressed: () {},
          icon: Icon(Icons.calendar_today_outlined, size: 14 * tScale, color: primaryColor),
          label: Text(
            'Pick Date',
            style: GoogleFonts.poppins(
              fontSize: 12 * tScale,
              fontWeight: FontWeight.w500,
              color: primaryColor,
              height: 1,
            ),
          ),
        ),
    ],
  );

  Widget _buildJobCard(Map<String, String> job) => Material(
    elevation: 2,
    borderRadius: BorderRadius.circular(12 * pScale),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [primaryColor, secondaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12 * pScale),
          ),
          padding: EdgeInsets.all(16 * pScale),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                job['title']!,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16 * tScale,
                  height: 1,
                ),
              ),
              SizedBox(height: 6 * pScale),
              Text(
                job['experience']!,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14 * tScale,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
              SizedBox(height: 12 * pScale),
              Row(
                children: [
                  Icon(Icons.location_on_outlined, color: Colors.white, size: 16 * tScale),
                  SizedBox(width: 6 * pScale),
                  Expanded(
                    child: Text(
                      job['interview']!,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14 * tScale,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14 * tScale),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 10 * pScale,
          top: 10 * pScale,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8 * pScale, vertical: 2 * pScale),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(12 * pScale),
            ),
            child: Text(
              job['status']!,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12 * tScale,
                height: 1,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
