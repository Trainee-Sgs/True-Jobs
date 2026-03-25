import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationScreen1 extends StatelessWidget {
  const ApplicationScreen1({super.key});

  static const Color primaryColor = Color(0xFF7C329B);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final applications = const [
      ('Flutter Developer', '18 applicants', 'Updated today'),
      ('Sales Executive', '7 applicants', 'Updated yesterday'),
      ('HR Recruiter', '4 applicants', 'Updated 2 days ago'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: Text(
          'Applications',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: applications.length,
        separatorBuilder: (_, _) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = applications[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE5D9EE)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.$1,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.$2,
                  style: GoogleFonts.poppins(
                    color: primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.$3,
                  style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
