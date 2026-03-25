import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    super.key,
    required this.company,
    required this.title,
    required this.location,
    required this.salary,
    required this.posted,
    required this.monthly,
    required this.cardTitleFontSize,
    required this.cardSubTitleFontSize,
    required this.iconSize,
    required this.isApplied,
    required this.isInprogress,
    required this.isRejected,
    required this.isSaved,
    required this.assetImage,
    required this.onSavedTap,
  });

  final String company;
  final String title;
  final String location;
  final String salary;
  final String posted;
  final bool monthly;
  final double cardTitleFontSize;
  final double cardSubTitleFontSize;
  final double iconSize;
  final bool isApplied;
  final bool isInprogress;
  final bool isRejected;
  final bool isSaved;
  final String assetImage;
  final VoidCallback onSavedTap;

  @override
  Widget build(BuildContext context) {
    final statusLabel = isRejected
        ? 'Rejected'
        : isInprogress
            ? 'In Progress'
            : isApplied
                ? 'Applied'
                : null;
    final statusColor = isRejected
        ? const Color(0xFFE74C3C)
        : isInprogress
            ? const Color(0xFFF39C12)
            : const Color(0xFF2FA84F);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE6E6E6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              assetImage,
              width: iconSize * 1.4,
              height: iconSize * 1.4,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
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
                          fontSize: cardTitleFontSize,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          height: 1.15,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onSavedTap,
                      child: Icon(
                        isSaved ? Icons.bookmark : Icons.bookmark_border,
                        color: const Color(0xFF7C329B),
                        size: iconSize * 0.9,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  company,
                  style: GoogleFonts.poppins(
                    fontSize: cardSubTitleFontSize,
                    color: const Color(0xFF5E5E5E),
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: iconSize * 0.6,
                      color: const Color(0xFF7C329B),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        location,
                        style: GoogleFonts.poppins(
                          fontSize: cardSubTitleFontSize,
                          color: const Color(0xFF7C329B),
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  '$salary${monthly ? ' /month' : ''}',
                  style: GoogleFonts.poppins(
                    fontSize: cardSubTitleFontSize,
                    color: Colors.black87,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      posted,
                      style: GoogleFonts.poppins(
                        fontSize: cardSubTitleFontSize * 0.95,
                        color: const Color(0xFF8A8A8A),
                        height: 1,
                      ),
                    ),
                    if (statusLabel != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          statusLabel,
                          style: GoogleFonts.poppins(
                            fontSize: cardSubTitleFontSize * 0.9,
                            color: statusColor,
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
