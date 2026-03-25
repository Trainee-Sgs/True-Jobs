import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_RECRUITER/Main_Screens/profiles/candidate_profile_1.dart';
import 'package:true_jobs/JOB_RECRUITER/functions_rec/Search/rec_search.dart';

class RecSavedProfileDetails extends StatefulWidget {
  const RecSavedProfileDetails({super.key});

  @override
  State<RecSavedProfileDetails> createState() => _RecSavedProfileDetailsState();
}

class _RecSavedProfileDetailsState extends State<RecSavedProfileDetails> {
  static const Color primaryColor = Color(0xFF7C329B);
  static const Color borderColor = Color(0xFFE6E3EA);
  static const Color mutedTextColor = Color(0xFF6F6F6F);

  final List<_SavedProfileModel> _profiles = [
    _SavedProfileModel(
      name: 'Marvin McKinney',
      location: 'Coimbatore',
      role: 'Ui/Ux Designer',
      experience: '2 Yr Exp',
      education: 'UG',
      expected: '25,000',
      language: 'English (Advanced)',
      status: 'Opened',
      avatarColor: const Color(0xFFF1E1B5),
      avatarAccentColor: const Color(0xFF9A5F2D),
    ),
    _SavedProfileModel(
      name: 'Robert Fox',
      location: 'Coimbatore',
      role: 'Ui/Ux Designer',
      experience: '2 Yr Exp',
      education: 'UG',
      expected: '25,000',
      language: 'English (Advanced)',
      avatarColor: const Color(0xFFF8BE2C),
      avatarAccentColor: const Color(0xFF743617),
    ),
    _SavedProfileModel(
      name: 'Priscilla',
      location: 'Coimbatore',
      role: 'Ui/Ux Designer',
      experience: '2 Yr Exp',
      education: 'UG',
      expected: '25,000',
      language: 'English (Advanced)',
      avatarColor: const Color(0xFFD6ECE2),
      avatarAccentColor: const Color(0xFF7A3F1C),
    ),
  ];

  bool _selectionMode = false;

  int get _selectedCount => _profiles.where((profile) => profile.isSelected).length;

  void _openSearchJobs() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RecSearch()),
    );
  }

  void _openCandidateProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CandidateProfile1()),
    );
  }

  void _onRemoveTapped() {
    if (_profiles.isEmpty) {
      return;
    }

    setState(() {
      if (!_selectionMode) {
        _selectionMode = true;
        return;
      }

      if (_selectedCount == 0) {
        return;
      }

      _profiles.removeWhere((profile) => profile.isSelected);
      _selectionMode = _profiles.isNotEmpty;
    });
  }

  void _toggleSelection(int index) {
    if (!_selectionMode) {
      return;
    }

    setState(() {
      _profiles[index].isSelected = !_profiles[index].isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: screenHeight * 0.086,
        title: Text(
          'Saved Profiles',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
      body: _profiles.isEmpty
          ? _buildEmptyState(
              context: context,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              horizontalPadding: horizontalPadding,
            )
          : Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: screenHeight * 0.015,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _openSearchJobs,
                    child: Container(
                      height: screenHeight * 0.064,
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.036),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(screenWidth * 0.024),
                        border: Border.all(color: const Color(0xFFB8B8B8)),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: screenWidth * 0.052,
                            color: const Color(0xFF9A9A9A),
                          ),
                          SizedBox(width: screenWidth * 0.022),
                          Text(
                            'Enter Job Title/Role',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFF9A9A9A),
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.020),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Roles',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                      GestureDetector(
                        onTap: _onRemoveTapped,
                        child: Text(
                          _selectionMode && _selectedCount > 0
                              ? 'Remove($_selectedCount)'
                              : 'Remove',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: _selectionMode ? Colors.red : const Color(0xFF9A9A9A),
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.011),
                  Expanded(
                    child: ListView.separated(
                      itemCount: _profiles.length,
                      separatorBuilder: (_, _) =>
                          SizedBox(height: screenHeight * 0.014),
                      itemBuilder: (context, index) {
                        final profile = _profiles[index];
                        return _SavedProfileCard(
                          profile: profile,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          showSelector: _selectionMode,
                          onTap: () {
                            if (_selectionMode) {
                              _toggleSelection(index);
                            } else {
                              _openCandidateProfile();
                            }
                          },
                          onSelectTap: () => _toggleSelection(index),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildEmptyState({
    required BuildContext context,
    required double screenWidth,
    required double screenHeight,
    required double horizontalPadding,
  }) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/walkthrough.gif',
                height: screenHeight * 0.19,
                fit: BoxFit.contain,
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                'No Profile Saved Yet!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  height: 1,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Container(
                width: screenWidth * 0.78,
                height: 1,
                color: Colors.black54,
              ),
              SizedBox(height: screenHeight * 0.015),
              Text(
                "Browse listings and save the ones you're\ninterested in for easy access later!",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.1,
                ),
              ),
              SizedBox(height: screenHeight * 0.06),
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.055,
                child: ElevatedButton(
                  onPressed: _openSearchJobs,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.015),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Search Jobs',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SavedProfileCard extends StatelessWidget {
  const _SavedProfileCard({
    required this.profile,
    required this.screenWidth,
    required this.screenHeight,
    required this.showSelector,
    required this.onTap,
    required this.onSelectTap,
  });

  final _SavedProfileModel profile;
  final double screenWidth;
  final double screenHeight;
  final bool showSelector;
  final VoidCallback onTap;
  final VoidCallback onSelectTap;

  @override
  Widget build(BuildContext context) {
    final isOpened = profile.status.toLowerCase() == 'opened';

    return InkWell(
      borderRadius: BorderRadius.circular(screenWidth * 0.03),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          screenWidth * 0.034,
          screenWidth * 0.032,
          screenWidth * 0.034,
          screenWidth * 0.032,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.033),
          border: Border.all(color: _RecSavedProfileDetailsState.borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.025),
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
                _ProfileAvatar(
                  name: profile.name,
                  size: screenWidth * 0.125,
                  backgroundColor: profile.avatarColor,
                  accentColor: profile.avatarAccentColor,
                ),
                SizedBox(width: screenWidth * 0.034),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.name,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.0025),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: screenWidth * 0.033,
                            color: _RecSavedProfileDetailsState.mutedTextColor,
                          ),
                          SizedBox(width: screenWidth * 0.006),
                          Text(
                            profile.location,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: _RecSavedProfileDetailsState.mutedTextColor,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.004),
                      Text(
                        '${profile.role} | ${profile.experience} | ${profile.education}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: _RecSavedProfileDetailsState.primaryColor,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                if (showSelector)
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.003,
                      left: screenWidth * 0.01,
                    ),
                    child: GestureDetector(
                      onTap: onSelectTap,
                      child: Container(
                        width: screenWidth * 0.041,
                        height: screenWidth * 0.041,
                        decoration: BoxDecoration(
                          color: profile.isSelected
                              ? _RecSavedProfileDetailsState.primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(screenWidth * 0.007),
                          border: Border.all(
                            color: _RecSavedProfileDetailsState.primaryColor,
                            width: 1.15,
                          ),
                        ),
                        child: profile.isSelected
                            ? Icon(
                                Icons.check,
                                size: screenWidth * 0.026,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.009),
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
                SizedBox(width: screenWidth * 0.015),
                Icon(
                  Icons.currency_rupee,
                  size: screenWidth * 0.034,
                  color: _RecSavedProfileDetailsState.primaryColor,
                ),
                Text(
                  profile.expected,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1,
                  ),
                ),
                SizedBox(width: screenWidth * 0.008),
                Text(
                  '/month',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: _RecSavedProfileDetailsState.mutedTextColor,
                    height: 1,
                  ),
                ),
                const Spacer(),
                if (isOpened)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                      vertical: screenHeight * 0.0035,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE4F8E5),
                      borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    ),
                    child: Text(
                      'Opened',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: const Color(0xFF4CAF50),
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: screenHeight * 0.005),
            Row(
              children: [
                Text(
                  'Language:',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1,
                  ),
                ),
                SizedBox(width: screenWidth * 0.015),
                Expanded(
                  child: Text(
                    profile.language,
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

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({
    required this.name,
    required this.size,
    required this.backgroundColor,
    required this.accentColor,
  });

  final String name;
  final double size;
  final Color backgroundColor;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final initials = name
        .trim()
        .split(' ')
        .where((part) => part.isNotEmpty)
        .take(2)
        .map((part) => part[0].toUpperCase())
        .join();

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      alignment: Alignment.center,
      child: Text(
        initials.isEmpty ? 'P' : initials,
        style: GoogleFonts.poppins(
          fontSize: size * 0.32,
          fontWeight: FontWeight.w700,
          color: accentColor,
        ),
      ),
    );
  }
}

class _SavedProfileModel {
  _SavedProfileModel({
    required this.name,
    required this.location,
    required this.role,
    required this.experience,
    required this.education,
    required this.expected,
    required this.language,
    required this.avatarColor,
    required this.avatarAccentColor,
    this.status = '',
    this.isSelected = false,
  });

  final String name;
  final String location;
  final String role;
  final String experience;
  final String education;
  final String expected;
  final String language;
  final String status;
  final Color avatarColor;
  final Color avatarAccentColor;
  bool isSelected;
}
