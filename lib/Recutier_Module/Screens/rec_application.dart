import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/Recutier_Module/Screens/rec_application_details.dart';
import 'package:true_jobs/Recutier_Module/Widgets/bottom_nav.dart';
import 'package:true_jobs/Recutier_Module/Widgets/custom_drawer.dart';

class ApplicationScreen1 extends StatefulWidget {
  const ApplicationScreen1({super.key});

  @override
  State<ApplicationScreen1> createState() => _ApplicationScreen1State();
}

class _ApplicationScreen1State extends State<ApplicationScreen1> {
  DateTime? selectedDate;
  static const Color primaryColor = Color(0xFF7C329B);

  void _openJobDetails(_RecruiterApplication job) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecApplicationActiveScreen(
          title: job.title,
          company: job.company,
          salary: job.salary,
          postedDate: job.postedDate,
          lastDate: job.lastDate,
          planName: job.planName,
          applicantsCount: int.parse(job.applicants),
          status: job.status,
          statusColor: job.statusColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    final List<_RecruiterApplication> todayJobs = [
      _RecruiterApplication(
        title: 'Flutter Developer',
        company: 'Smart Global Solutions',
        salary: '8,000 - 1,000 monthly',
        postedDate: '22/01/2025',
        lastDate: '05/02/2025',
        planName: 'Basic',
        experience: 'Experience: 0-2 Years',
        interview: 'Interview: Tiruppur',
        applicants: '18',
        status: 'Active',
        statusColor: const Color(0xFF2FA84F),
        cardColor: primaryColor,
      ),
      _RecruiterApplication(
        title: 'Flutter Developer',
        company: 'Smart Global Solutions',
        salary: '8,000 - 1,000 monthly',
        postedDate: '22/01/2025',
        lastDate: '05/02/2025',
        planName: 'Basic',
        experience: 'Experience: 0-2 Years',
        interview: 'Interview: Tiruppur',
        applicants: '18',
        status: 'Active',
        statusColor: const Color(0xFF2FA84F),
        cardColor: primaryColor,
      ),
    ];

    final List<_RecruiterApplication> pastJobs = [
      _RecruiterApplication(
        title: 'UI/UX Designer',
        company: 'Smart Global Solutions',
        salary: '12,000 - 18,000 monthly',
        postedDate: '18/01/2025',
        lastDate: '28/01/2025',
        planName: 'Basic',
        experience: 'Experience: 0-2 Years',
        interview: 'Interview: Tiruppur',
        applicants: '18',
        status: 'Expired',
        statusColor: Colors.redAccent,
        cardColor: primaryColor,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0.5,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: 'Open Menu',
            );
          },
        ),
        title: Text(
          'Applications',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            height: 1,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
            tooltip: 'Alerts',
          ),
        ],
      ),
      drawer: const SmartGlobalDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: media.width * 0.04,
          vertical: media.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF6F6F6F),
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: media.width * 0.04,
                      vertical: media.height * 0.013,
                    ),
                  ),
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      setState(() {
                        selectedDate = date;
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Pick Date',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (selectedDate != null) ...[
              SizedBox(height: media.height * 0.08),
              Center(
                child: Image.asset(
                  'assets/empty_content.gif',
                  width: media.width * 0.55,
                  height: media.width * 0.55,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: media.height * 0.04),
              Center(
                child: Text(
                  'No Applications Yet',
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.01),
              Center(
                child: Text(
                  'Check back later',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.05),
              Center(
                child: SizedBox(
                  width: media.width * 0.85,
                  height: 46,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Post Jobs',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ] else ...[
              ...todayJobs.map(_buildJobCard),
              const SizedBox(height: 16),
              Text(
                '22/01/2025',
                style: GoogleFonts.poppins(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              ...pastJobs.map(_buildJobCard),
            ],
          ],
        ),
      ),
      bottomNavigationBar: const RecruiterBottomNav(currentIndex: 1),
    );
  }

  Widget _buildJobCard(_RecruiterApplication job) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => _openJobDetails(job),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: job.cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.08),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    job.title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _openJobDetails(job),
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: job.statusColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      job.status,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              job.experience,
              style: GoogleFonts.poppins(
                color: Colors.white.withValues(alpha: 0.95),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white70,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          job.interview,
                          style: GoogleFonts.poppins(
                            color: Colors.white.withValues(alpha: 0.95),
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _AppliedCountBadge(count: job.applicants),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AppliedCountBadge extends StatelessWidget {
  const _AppliedCountBadge({required this.count});

  final String count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            count,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: _ApplicationScreen1State.primaryColor,
              height: 1,
            ),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          'Applied',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1,
          ),
        ),
      ],
    );
  }
}

class _RecruiterApplication {
  const _RecruiterApplication({
    required this.title,
    required this.company,
    required this.salary,
    required this.postedDate,
    required this.lastDate,
    required this.planName,
    required this.experience,
    required this.interview,
    required this.applicants,
    required this.status,
    required this.statusColor,
    required this.cardColor,
  });

  final String title;
  final String company;
  final String salary;
  final String postedDate;
  final String lastDate;
  final String planName;
  final String experience;
  final String interview;
  final String applicants;
  final String status;
  final Color statusColor;
  final Color cardColor;
}
