import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/Recutier_Module/Screens/rec_home.dart';
import 'package:true_jobs/Recutier_Module/Screens/rec_application.dart';
import 'package:true_jobs/Recutier_Module/Screens/Rec_Chate_Screen/rec_chat.dart';

class RecruiterBottomNav extends StatelessWidget {
  const RecruiterBottomNav({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;
  static const Color primaryColor = Color(0xFF7C329B);

  @override
  Widget build(BuildContext context) {
    const Color borderColor = Color(0xFFE6E6E6);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: borderColor, width: 1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
          child: Row(
            children: [
              Expanded(
                child: _NavItem(
                  label: 'Job Post',
                  assetPath: 'assets/jobpost_logo.png',
                  selected: currentIndex == 0,
                  onTap: () {
                    if (currentIndex != 0) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const RecHome()),
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: _NavItem(
                  label: 'Applications',
                  assetPath: 'assets/application_logo.png',
                  selected: currentIndex == 1,
                  onTap: () {
                    if (currentIndex != 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ApplicationScreen1(),
                        ),
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: _NavItem(
                  label: 'Chats',
                  assetPath: 'assets/chat_logo.png',
                  selected: currentIndex == 2,
                  onTap: () {
                    if (currentIndex != 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const RecChat()),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.assetPath,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String assetPath;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final iconColor = selected
        ? RecruiterBottomNav.primaryColor
        : const Color(0xFF626262);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
            child: Center(
              child: ImageIcon(
                AssetImage(assetPath),
                size: 28,
                color: iconColor,
              ),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 16,
            child: selected
                ? Text(
                    label,
                    style: GoogleFonts.poppins(
                      color: iconColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          const SizedBox(height: 2),
        ],
      ),
    );
  }
}
