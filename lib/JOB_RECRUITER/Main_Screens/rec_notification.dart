import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecNotification extends StatelessWidget {
  const RecNotification({super.key});

  static const Color primaryColor = Color(0xFF7C329B);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final notifications = const [
      (
        title: 'New candidate profile saved',
        subtitle: 'A shortlisted profile was added to your saved list.',
        time: 'Just now',
      ),
      (
        title: 'Job post is under review',
        subtitle: 'Your latest UI/UX Designer posting is pending approval.',
        time: '2h ago',
      ),
      (
        title: 'Subscription reminder',
        subtitle: 'Your recruiter credits summary is ready to review.',
        time: 'Yesterday',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: notifications.length,
        separatorBuilder: (_, _) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE7DDF0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: width * 0.025,
                  offset: Offset(0, height * 0.005),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF3ECF8),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.notifications_none,
                    color: primaryColor,
                    size: width * 0.06,
                  ),
                ),
                SizedBox(width: width * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.subtitle,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black54,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item.time,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: primaryColor,
                          height: 1,
                        ),
                      ),
                    ],
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
