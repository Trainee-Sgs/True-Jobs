import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/Settings_screen/setting_page.dart';

class AppLock extends StatefulWidget {
  const AppLock({super.key});

  @override
  State<AppLock> createState() => _AppLockState();
}

class _AppLockState extends State<AppLock> {
  bool isAppLockEnabled = false; // state variable for the switch

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final Color purpleColor = const Color(0xFF7C329B);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SettingPage()),
            );
          },
        ),
        title: Text(
          'App lock/unlock',
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 18 : 22,
            fontWeight: FontWeight.w600,
            color: purpleColor,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16.0 : screenWidth * 0.1,
          vertical: 8.0,
        ),
        child: Column(
          children: [
            SizedBox(height: isMobile ? 16 : 24),
            buildMenuItem(
              context,
              'App lock/unlock',
              const Icon(Icons.apps),
              isSwitch: true,
              switchValue: isAppLockEnabled,
              onSwitchChanged: (value) {
                setState(() {
                  isAppLockEnabled = value;
                });
              },
            ),
            SizedBox(height: 5),
            buildMenuItem(
              context,
              'Create new PIN',
              const Icon(Icons.vpn_key),
              isSwitch: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
    BuildContext context,
    String title,
    Icon icon, {
    required bool isSwitch,
    bool switchValue = false,
    ValueChanged<bool>? onSwitchChanged,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Column(
      children: [
        SizedBox(height: isMobile ? 8 : 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  SizedBox(
                    width: isMobile ? 24 : 32,
                    height: isMobile ? 24 : 32,
                    child: Icon(
                      icon.icon,
                      size: isMobile ? 20 : 28,
                      color: const Color(0xFF8B47C5),
                    ),
                  ),
                  SizedBox(width: isMobile ? 16 : 24),
                  Flexible(
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 16 : 20,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            if (isSwitch)
              Switch(
                value: switchValue,
                onChanged: onSwitchChanged,
                activeThumbColor: const Color(0xFF8B47C5),
              ),
          ],
        ),
        SizedBox(height: isMobile ? 8 : 12),
        const Divider(color: Colors.grey, height: 1),
      ],
    );
  }
}
