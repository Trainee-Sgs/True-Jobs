import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'terms_and_conditions.dart';


class RecSettings extends StatefulWidget {
  const RecSettings({super.key});

  @override
  State<RecSettings> createState() => _RecSettingsState();
}

class _RecSettingsState extends State<RecSettings> {
  static const Color primaryColor = Color(0xFF7C329B);

  bool _isOnline = true;
  bool _isWhatsappNotificationOn = false;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: screenHeight * 0.065,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, size: screenWidth * 0.052),
        ),
        titleSpacing: 0,
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.008),
            _buildToggleRow(
              screenWidth: screenWidth,
              title: "Show I'm online",
              icon: Icons.wifi,
              value: _isOnline,
              onChanged: (value) {
                setState(() {
                  _isOnline = value;
                });
              },
            ),
            _buildDivider(screenWidth),
            _buildToggleRow(
              screenWidth: screenWidth,
              title: 'WhatsApp notification',
              icon: Icons.whatshot_outlined,
              value: _isWhatsappNotificationOn,
              onChanged: (value) {
                setState(() {
                  _isWhatsappNotificationOn = value;
                });
              },
            ),
            _buildDivider(screenWidth),
            _buildInfoRow(
              screenWidth: screenWidth,
              title: 'App language',
              icon: Icons.language,
              trailingText: _selectedLanguage,
              onTap: _showLanguageDialog,
            ),
            _buildDivider(screenWidth),
            _buildInfoRow(
              screenWidth: screenWidth,
              title: 'Terms & condition',
              icon: Icons.assignment_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsAndConditionsScreen(),
                  ),
                );
              },
            ),
            _buildDivider(screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleRow({
    required double screenWidth,
    required String title,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          Icon(icon, color: primaryColor, size: 22),
          SizedBox(width: screenWidth * 0.035),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF505050),
                height: 1,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onChanged(!value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 52,
              height: 26,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: value
                    ? const Color(0xFFD0B1DA)
                    : const Color(0xFFD8D8D8),
                borderRadius: BorderRadius.circular(screenWidth * 0.08),
              ),
              child: Align(
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required double screenWidth,
    required String title,
    required IconData icon,
    String? trailingText,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            Icon(icon, color: primaryColor, size: 22),
            SizedBox(width: screenWidth * 0.035),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF505050),
                  height: 1,
                ),
              ),
            ),
            if (trailingText != null)
              Text(
                trailingText,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: primaryColor,
                  height: 1,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(double screenWidth) {
    return Divider(
      height: 1,
      thickness: 1,
      color: const Color(0xFFB7B7B7),
    );
  }

  Future<void> _showLanguageDialog() async {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    String tempLanguage = _selectedLanguage;

    final result = await showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.05),
              ),
              insetPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.03,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05,
                  screenHeight * 0.02,
                  screenWidth * 0.05,
                  screenHeight * 0.03,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(dialogContext),
                        child: Icon(
                          Icons.cancel_outlined,
                          size: screenWidth * 0.07,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.3,
                      height: screenWidth * 0.3,
                      child: Image.asset(
                        'assets/earth.gif',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Select your app language',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF4F4F4F),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    Wrap(
                      spacing: screenWidth * 0.06,
                      runSpacing: screenHeight * 0.03,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildLanguageCard(
                          screenWidth: screenWidth,
                          symbol: 'A',
                          label: 'English',
                          selected: tempLanguage == 'English',
                          onTap: () {
                            setDialogState(() {
                              tempLanguage = 'English';
                            });
                          },
                        ),
                        _buildLanguageCard(
                          screenWidth: screenWidth,
                          symbol: 'அ',
                          label: 'தமிழ்',
                          selected: tempLanguage == 'தமிழ்',
                          onTap: () {
                            setDialogState(() {
                              tempLanguage = 'தமிழ்';
                            });
                          },
                        ),
                        _buildLanguageCard(
                          screenWidth: screenWidth,
                          symbol: 'अ',
                          label: 'हिन्दी',
                          selected: tempLanguage == 'हिन्दी',
                          onTap: () {
                            setDialogState(() {
                              tempLanguage = 'हिन्दी';
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    SizedBox(
                      width: screenWidth * 0.48,
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(dialogContext, tempLanguage);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              screenWidth * 0.02,
                            ),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Save',
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.048,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    if (result != null && mounted) {
      setState(() {
        _selectedLanguage = result;
      });
    }
  }

  Widget _buildLanguageCard({
    required double screenWidth,
    required String symbol,
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.25,
        height: screenWidth * 0.29,
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? primaryColor : primaryColor.withValues(alpha: 0.5),
            width: selected ? screenWidth * 0.005 : screenWidth * 0.0035,
          ),
          color: selected ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                symbol,
                style: TextStyle(
                  fontSize: screenWidth * 0.1,
                  fontWeight: FontWeight.bold,
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                label,
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w500,
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
