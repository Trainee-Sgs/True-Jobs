import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class JobCard extends StatelessWidget {
  final String company, title, location, salary, posted;
  final bool monthly, urgent, physicallyChallenged;
  final bool isApplied, isInprogress, isRejected, isSaved;
  final bool? isViewed;
  final double cardTitleFontSize;
  final double cardSubTitleFontSize;
  final double iconSize;
  final String? assetImage;
  final VoidCallback? onSavedTap;

  const JobCard({
    required this.company,
    required this.title,
    required this.location,
    required this.salary,
    required this.posted,
    
    this.monthly = false,
    this.urgent = false,
    this.physicallyChallenged = false,
    required this.cardTitleFontSize,
    required this.cardSubTitleFontSize,
    required this.iconSize,
    required this.isApplied,
    required this.isInprogress,
    required this.isRejected,
    required this.isSaved,
    this.isViewed,
    this.assetImage,
    this.onSavedTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final purpleColor = const Color(0xFF7C329B);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.01,
      ),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.07,
                backgroundColor: purpleColor.withOpacity(0.1),
                backgroundImage:
                assetImage != null ? AssetImage(assetImage!) : null,
                child: assetImage == null
                    ? Icon(Icons.business, color: purpleColor, size: iconSize)
                    : null,
              ),
              SizedBox(width: screenWidth * 0.04),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: cardTitleFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.003),

                    Text(
                      company,
                      style: GoogleFonts.poppins(
                        fontSize: cardSubTitleFontSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.008),

                    Row(
                      children: [
                        Icon(Icons.currency_rupee,
                            size: iconSize * 0.8, color: purpleColor),
                        SizedBox(width: 2),
                        Text(
                          salary,
                          style: GoogleFonts.poppins(
                            fontSize: cardSubTitleFontSize,
                            fontWeight: FontWeight.w600,
                            color: purpleColor,
                          ),
                        ),
                        if (monthly) ...[
                          SizedBox(width: 4),
                          Text(
                            "monthly",
                            style: GoogleFonts.poppins(
                              fontSize: cardSubTitleFontSize * 0.9,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ]
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.005),

                    Row(
                      children: [
                        Icon(Icons.location_on,
                            size: iconSize * 0.8, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          location,
                          style: GoogleFonts.poppins(
                            fontSize: cardSubTitleFontSize,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.005),

                    // Posted info
                    Text(
                      "Posted: $posted",
                      style: GoogleFonts.poppins(
                        fontSize: cardSubTitleFontSize * 0.9,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),

                  ],
                ),
              ),

              GestureDetector(
                onTap: onSavedTap,
                child: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_border,
                  color: isSaved ? purpleColor : Colors.grey,
                  size: iconSize,
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: Builder(
              builder: (context) {
                if (isApplied) {
                  return _statusText("Applied", Colors.green);
                } else if (isInprogress) {
                  return _statusText("In Progress", Colors.blueGrey);
                } else if (isRejected) {
                  return _statusText("Rejected", Colors.red);
                }else if (isApplied){return _statusText("Viewed", Colors.grey);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusText(String text, Color color) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: cardSubTitleFontSize * 0.9,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}