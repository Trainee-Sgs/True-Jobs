import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({
    super.key,
    required this.job,
  });

  final Map<String, dynamic> job;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final title = (job['title'] ?? 'Job Details').toString();
    final company = (job['company'] ?? 'Company').toString();
    final location = (job['location'] ?? 'Location').toString();
    final salary = (job['salary'] ?? 'Not specified').toString();
    final posted = (job['posted'] ?? 'Recently').toString();
    final image = (job['assetImage'] ?? 'assets/demo.png').toString();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7C329B),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Job Details',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(media.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    image,
                    width: media.width * 0.18,
                    height: media.width * 0.18,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: media.width * 0.04),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          height: 1.15,
                        ),
                      ),
                      SizedBox(height: media.height * 0.006),
                      Text(
                        company,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color(0xFF6F6F6F),
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: media.height * 0.03),
            _DetailRow(label: 'Location', value: location),
            _DetailRow(label: 'Salary', value: salary),
            _DetailRow(label: 'Posted', value: posted),
            SizedBox(height: media.height * 0.03),
            Text(
              'About this job',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                height: 1,
              ),
            ),
            SizedBox(height: media.height * 0.012),
            Text(
              'This is a sample job details screen for the selected role. You can extend this widget with full description, skills, benefits, and company details as needed.',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xFF4F4F4F),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                height: 1.2,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xFF5F5F5F),
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
