import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/Recutier_Module/Screens/profiles/candidate_profile_1.dart';

class RecApplicationActiveScreen extends StatelessWidget {
  const RecApplicationActiveScreen({
    super.key,
    required this.title,
    required this.company,
    required this.salary,
    required this.postedDate,
    required this.lastDate,
    required this.planName,
    required this.applicantsCount,
    required this.status,
    required this.statusColor,
  });

  final String title;
  final String company;
  final String salary;
  final String postedDate;
  final String lastDate;
  final String planName;
  final int applicantsCount;
  final String status;
  final Color statusColor;

  static const Color primaryColor = Color(0xFF7C329B);
  static const Color borderColor = Color(0xFFE2E2E2);
  static const Color mutedTextColor = Color(0xFF6F6F6F);

  bool get isExpired => status.toLowerCase() == 'expired';

  void _showActionDialog({
    required BuildContext context,
    required String title,
    required String highlightedText,
    required String description,
    required String cancelText,
    required String confirmText,
    required Color highlightColor,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        final media = MediaQuery.of(dialogContext).size;

        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: media.width * 0.08),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              media.width * 0.05,
              media.height * 0.016,
              media.width * 0.05,
              media.height * 0.018,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => Navigator.of(dialogContext).pop(),
                    borderRadius: BorderRadius.circular(20),
                    child: const Icon(
                      Icons.cancel_outlined,
                      size: 20,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: media.height * 0.004),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.black87,
                      height: 1.45,
                    ),
                    children: [
                      TextSpan(text: title),
                      TextSpan(
                        text: highlightedText,
                        style: TextStyle(color: highlightColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.height * 0.002),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: mutedTextColor,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: media.height * 0.024),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 38,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(dialogContext).pop(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF1F1F1),
                            foregroundColor: const Color(0xFF555555),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Text(
                            cancelText,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: media.width * 0.03),
                    Expanded(
                      child: SizedBox(
                        height: 38,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(dialogContext).pop(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Text(
                            confirmText,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showStopHiringDialog(BuildContext context) {
    _showActionDialog(
      context: context,
      title: 'Are you sure you want to\n',
      highlightedText: 'Stop Hiring?',
      description: '(This job will no longer be visible to\ncandidates)',
      cancelText: 'No',
      confirmText: 'Yes, Stop Hiring',
      highlightColor: Colors.red,
    );
  }

  void _showRepostJobDialog(BuildContext context) {
    _showActionDialog(
      context: context,
      title: 'This job post has ',
      highlightedText: 'expired.',
      description: 'Click repost and attract new\napplicants!',
      cancelText: 'Cancel',
      confirmText: 'Repost Job',
      highlightColor: Colors.red,
    );
  }

  void _showDeleteJobDialog(BuildContext context) {
    _showActionDialog(
      context: context,
      title: 'Are you sure you want to\n',
      highlightedText: 'Delete Job?',
      description: 'This job post will be removed from\nyour applications list.',
      cancelText: 'Cancel',
      confirmText: 'Delete Job',
      highlightColor: Colors.red,
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.poppins(fontSize: 13),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static const List<String> _applicantNames = [
    'Marvin McKinney',
    'Marjorie',
    'Mitchell',
    'Max',
    'Maya',
    'Madison',
    'Mason',
    'Mateo',
    'Miranda',
    'Morgan',
    'Melanie',
    'Mila',
    'Martin',
    'Megan',
    'Maddox',
    'Mabel',
    'Myra',
    'Monica',
  ];

  static const List<Color> _avatarBackgrounds = [
    Color(0xFFF3D8D2),
    Color(0xFFCDEBF4),
    Color(0xFFFAC24C),
    Color(0xFFE2C7BE),
    Color(0xFFD9EEDB),
    Color(0xFFF6D6A9),
  ];

  static const List<Color> _avatarForegrounds = [
    Color(0xFF7A3F1C),
    Color(0xFF215C7A),
    Color(0xFF4C2A18),
    Color(0xFF7D5448),
    Color(0xFF2D6A45),
    Color(0xFF8B4F0A),
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final applicants = List<_ApplicantData>.generate(
      applicantsCount,
      (index) => _ApplicantData(
        name: _applicantNames[index % _applicantNames.length],
        location: 'Coimbatore',
        experience: '2 Yr Exp',
        education: 'UG',
        appliedDate: index.isEven ? '03/02/2025' : '04/02/2025',
        expectedSalary: '25,000',
        language: 'English (Advanced)',
        avatarBackgroundColor:
            _avatarBackgrounds[index % _avatarBackgrounds.length],
        avatarForegroundColor:
            _avatarForegrounds[index % _avatarForegrounds.length],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Text(
          'Applications',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            tooltip: 'Info',
            position: PopupMenuPosition.under,
            offset: const Offset(0, 8),
            color: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onSelected: (value) {
              if (value == 'stop_hiring') {
                _showStopHiringDialog(context);
              } else if (value == 'repost_job') {
                _showRepostJobDialog(context);
              } else if (value == 'delete_job') {
                _showDeleteJobDialog(context);
              } else if (value == 'share_job_post') {
                _showMessage(context, 'Share Job Post tapped');
              }
            },
            itemBuilder: (context) => isExpired
                ? [
                    PopupMenuItem<String>(
                      value: 'repost_job',
                      child: Row(
                        children: [
                          const Icon(Icons.refresh_outlined,
                              size: 18, color: Color(0xFF4A4A4A)),
                          const SizedBox(width: 10),
                          Text(
                            'Repost Job',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: const Color(0xFF4A4A4A),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'delete_job',
                      child: Row(
                        children: [
                          const Icon(Icons.delete_outline,
                              size: 18, color: Color(0xFF4A4A4A)),
                          const SizedBox(width: 10),
                          Text(
                            'Delete Job',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: const Color(0xFF4A4A4A),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                : [
                    PopupMenuItem<String>(
                      value: 'stop_hiring',
                      child: Row(
                        children: [
                          const Icon(Icons.pause_circle_outline,
                              size: 18, color: Color(0xFF4A4A4A)),
                          const SizedBox(width: 10),
                          Text(
                            'Stop Hiring',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: const Color(0xFF4A4A4A),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'share_job_post',
                      child: Row(
                        children: [
                          const Icon(Icons.share_outlined,
                              size: 18, color: Color(0xFF4A4A4A)),
                          const SizedBox(width: 10),
                          Text(
                            'Share Job Post',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: const Color(0xFF4A4A4A),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            _JobSummaryCard(
              title: title,
              company: company,
              salary: salary,
              postedDate: postedDate,
              lastDate: lastDate,
              planName: planName,
              status: status,
              statusColor: statusColor,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                media.width * 0.04,
                media.height * 0.014,
                media.width * 0.04,
                media.height * 0.012,
              ),
              child: Row(
                children: [
                  _AppliedCountBadge(count: applicantsCount),
                  const Spacer(),
                  SizedBox(
                    height: media.height * 0.044,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2D9E48),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                          horizontal: media.width * 0.032,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(Icons.file_download_outlined, size: 16),
                      label: Text(
                        'Excel Report',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.fromLTRB(
                  media.width * 0.04,
                  0,
                  media.width * 0.04,
                  media.height * 0.03,
                ),
                itemCount: applicants.length,
                separatorBuilder: (_, _) =>
                    SizedBox(height: media.height * 0.0105),
                itemBuilder: (context, index) {
                  return _ApplicantCard(applicant: applicants[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _JobSummaryCard extends StatelessWidget {
  const _JobSummaryCard({
    required this.title,
    required this.company,
    required this.salary,
    required this.postedDate,
    required this.lastDate,
    required this.planName,
    required this.status,
    required this.statusColor,
  });

  final String title;
  final String company;
  final String salary;
  final String postedDate;
  final String lastDate;
  final String planName;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        media.width * 0.04,
        media.height * 0.017,
        media.width * 0.04,
        media.height * 0.018,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withValues(alpha: 0.08),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: media.width * 0.11,
                height: media.width * 0.11,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFE4E4E4)),
                ),
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(
                      'assets/smart_logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(width: media.width * 0.025),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              height: 1.2,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: media.width * 0.024,
                            vertical: media.height * 0.004,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            status,
                            style: GoogleFonts.poppins(
                              color: statusColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: media.height * 0.004),
                    Text(
                      company,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: RecApplicationActiveScreen.mutedTextColor,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: media.height * 0.014),
          Text(
            salary,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.black87,
              height: 1.15,
            ),
          ),
          SizedBox(height: media.height * 0.006),
          Text(
            'Through | Posted: $postedDate',
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: RecApplicationActiveScreen.mutedTextColor,
              height: 1.2,
            ),
          ),
          SizedBox(height: media.height * 0.005),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Plan: $planName | Expires on: $lastDate',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: RecApplicationActiveScreen.mutedTextColor,
                    height: 1.25,
                  ),
                ),
              ),
              SizedBox(width: media.width * 0.02),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: RecApplicationActiveScreen.primaryColor,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'View Job',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AppliedCountBadge extends StatelessWidget {
  const _AppliedCountBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: RecApplicationActiveScreen.primaryColor,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '$count',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          'Applied',
          style: GoogleFonts.poppins(
            color: const Color(0xFF4A4A4A),
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1,
          ),
        ),
      ],
    );
  }
}

class _ApplicantCard extends StatelessWidget {
  const _ApplicantCard({required this.applicant});

  final _ApplicantData applicant;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return InkWell(
      borderRadius: BorderRadius.circular(media.width * 0.033),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CandidateProfile1(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(
          media.width * 0.034,
          media.width * 0.032,
          media.width * 0.034,
          media.width * 0.032,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(media.width * 0.033),
          border: Border.all(color: RecApplicationActiveScreen.borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.025),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InitialAvatar(applicant: applicant),
                SizedBox(width: media.width * 0.034),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        applicant.name,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: media.height * 0.0025),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: media.width * 0.033,
                            color: RecApplicationActiveScreen.mutedTextColor,
                          ),
                          SizedBox(width: media.width * 0.006),
                          Text(
                            applicant.location,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: RecApplicationActiveScreen.mutedTextColor,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: media.height * 0.004),
                      Text(
                        '${applicant.experience} | ${applicant.education} | Applied on: ${applicant.appliedDate}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: RecApplicationActiveScreen.primaryColor,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: media.height * 0.009),
              child: Divider(
                height: 1,
                thickness: 1,
                color: const Color(0xFFE6DDEA),
              ),
            ),
            Row(
              children: [
                Text(
                  'Expected:',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1,
                  ),
                ),
                SizedBox(width: media.width * 0.015),
                Icon(
                  Icons.currency_rupee,
                  size: media.width * 0.034,
                  color: RecApplicationActiveScreen.primaryColor,
                ),
                Text(
                  applicant.expectedSalary,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1,
                  ),
                ),
                SizedBox(width: media.width * 0.008),
                Text(
                  '/month',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: RecApplicationActiveScreen.mutedTextColor,
                    height: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: media.height * 0.005),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Language:',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1,
                  ),
                ),
                SizedBox(width: media.width * 0.015),
                Expanded(
                  child: Text(
                    applicant.language,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InitialAvatar extends StatelessWidget {
  const _InitialAvatar({required this.applicant});

  final _ApplicantData applicant;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final initial = applicant.name.trim().isEmpty
        ? 'A'
        : applicant.name.trim()[0].toUpperCase();

    return Container(
      width: media.width * 0.125,
      height: media.width * 0.125,
      decoration: BoxDecoration(
        color: applicant.avatarBackgroundColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: GoogleFonts.poppins(
          color: applicant.avatarForegroundColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: 1,
        ),
      ),
    );
  }
}

class _ApplicantData {
  const _ApplicantData({
    required this.name,
    required this.location,
    required this.experience,
    required this.education,
    required this.appliedDate,
    required this.expectedSalary,
    required this.language,
    required this.avatarBackgroundColor,
    required this.avatarForegroundColor,
  });

  final String name;
  final String location;
  final String experience;
  final String education;
  final String appliedDate;
  final String expectedSalary;
  final String language;
  final Color avatarBackgroundColor;
  final Color avatarForegroundColor;
}
