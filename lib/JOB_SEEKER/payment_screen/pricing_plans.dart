// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:true_jobs/JOB_SEEKER/profile_creation/profile_setting_page.dart';

class PricingPlansScreen extends StatelessWidget {
  const PricingPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 380;
    final isMediumScreen = screenWidth >= 380 && screenWidth < 600;
    final isLargeScreen = screenWidth >= 600;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A1B9A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ProfilePage())),
        ),
        title: Text(
          'Pricing Plans',
          style: TextStyle(
            color: Colors.white,
            fontSize: isSmallScreen ? 18 : 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 12 : (isMediumScreen ? 16 : 24),
            vertical: isSmallScreen ? 12 : 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              Text(
                'Apply Without Limits',
                style: TextStyle(
                  fontSize: isSmallScreen ? 18 : (isMediumScreen ? 20 : 24),
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: isSmallScreen ? 4 : 8),
              Text(
                'Get full access to all job applications. Choose a plan that fits you!',
                style: TextStyle(
                  fontSize: isSmallScreen ? 13 : (isMediumScreen ? 14 : 16),
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
              SizedBox(height: isSmallScreen ? 16 : 24),

              // Basic Job Seeker Plan
              _buildPlanCard(
                context: context,
                title: 'Basic Job Seeker',
                price: '₹0',
                priceSubtext: '/forever',
                features: [
                  _PlanFeature('Free job browsing', true),
                  _PlanFeature('Create profile', true),
                  _PlanFeature('Save job listings', true),
                  _PlanFeature('CV templates', false),
                  _PlanFeature('Apply for jobs', false),
                ],
                backgroundColor: Colors.white,
                titleColor: Colors.black87,
                priceColor: const Color(0xFF4CAF50),
                buttonText: '',
                buttonColor: Colors.transparent,
                buttonTextColor: Colors.transparent,
                showButton: false,
                isSmallScreen: isSmallScreen,
                isMediumScreen: isMediumScreen,
              ),

              SizedBox(height: isSmallScreen ? 12 : 16),

              // Pro Job Seeker Plan
              Stack(
                children: [
                  _buildPlanCard(
                    context: context,
                    title: 'Pro Job Seeker',
                    price: '₹100',
                    priceSubtext: '/one-time',
                    features: [
                      _PlanFeature('Everything in Basic', true),
                      _PlanFeature('Unlimited job applications', true),
                      _PlanFeature('Premium CV templates', true),
                      _PlanFeature('Profile visibility control', true),
                      _PlanFeature('Apply for jobs', true),
                    ],
                    backgroundColor: const Color.fromARGB(255, 12, 12, 12),
                    titleColor: Colors.white,
                    priceColor: const Color(0xFF4CAF50),
                    buttonText: 'Buy Now',
                    buttonColor: Colors.white,
                    buttonTextColor: Colors.black87,
                    showButton: true,
                    isSmallScreen: isSmallScreen,
                    isMediumScreen: isMediumScreen,
                  ),
                  // Popular badge
                  Positioned(
                    top: isSmallScreen ? 12 : 16,
                    right: isSmallScreen ? 12 : 16,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 8 : 12,
                        vertical: isSmallScreen ? 4 : 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Popular',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isSmallScreen ? 10 : 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: isSmallScreen ? 12 : 16),

              // Booster Pack
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF610505), // dark red (left)
                      Color(0xFFB80000), // bright red (center)
                      Color(0xFF610505), // dark red (right)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ), // match card shape
                ),
                child: _buildPlanCard(
                  context: context,
                  title: 'Booster Pack',
                  subtitle: 'Give your profile an extra push!',
                  price: '₹100',
                  priceSubtext: '/one-time',
                  features: [
                    _PlanFeature('Boost at the top of recruiters', true),
                    _PlanFeature('Highlighted visibility for 7 days', true),
                    _PlanFeature('Get noticed 3x faster', true),
                  ],
                  backgroundColor:
                      Colors.transparent, // 👈 make inner bg transparent
                  titleColor: Colors.white,
                  priceColor: Colors.white,
                  buttonText: 'Activate Booster',
                  buttonColor: Colors.white,
                  buttonTextColor: Color(0xFFA0392A),
                  showButton: true,
                  isSmallScreen: isSmallScreen,
                  isMediumScreen: isMediumScreen,
                ),
              ),

              SizedBox(height: isSmallScreen ? 12 : 16),

              // Info note
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: isSmallScreen ? 3 : 1),
                    child: Icon(
                      Icons.info_outline,
                      size: isSmallScreen ? 16 : 18,
                      color: Color(0xFF6A1B9A),
                    ),
                  ),
                  SizedBox(width: isSmallScreen ? 6 : 8),
                  Expanded(
                    child: Text(
                      'Booster Pack is available once you go Pro!',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 14,
                        color: Color(0xFF6A1B9A),
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: isSmallScreen ? 20 : 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required BuildContext context,
    required String title,
    String? subtitle,
    required String price,
    required String priceSubtext,
    required List<_PlanFeature> features,
    required Color backgroundColor,
    required Color titleColor,
    required Color priceColor,
    required String buttonText,
    required Color buttonColor,
    required Color buttonTextColor,
    required bool showButton,
    required bool isSmallScreen,
    required bool isMediumScreen,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isSmallScreen ? 16 : (isMediumScreen ? 20 : 24)),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(isSmallScreen ? 12 : 16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and subtitle
          Text(
            title,
            style: TextStyle(
              fontSize: isSmallScreen ? 18 : (isMediumScreen ? 20 : 22),
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          if (subtitle != null) ...[
            SizedBox(height: isSmallScreen ? 4 : 6),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: isSmallScreen ? 12 : (isMediumScreen ? 13 : 14),
                color: titleColor.withOpacity(0.8),
              ),
            ),
          ],
          SizedBox(height: isSmallScreen ? 8 : 12),

          // Price
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: isSmallScreen ? 24 : (isMediumScreen ? 28 : 32),
                  fontWeight: FontWeight.bold,
                  color: priceColor,
                ),
              ),
              SizedBox(width: isSmallScreen ? 4 : 6),
              Padding(
                padding: EdgeInsets.only(bottom: isSmallScreen ? 2 : 4),
                child: Text(
                  priceSubtext,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 12 : (isMediumScreen ? 13 : 14),
                    color: titleColor.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isSmallScreen ? 12 : 16),

          // Features
          ...features.map(
            (feature) => Padding(
              padding: EdgeInsets.symmetric(vertical: isSmallScreen ? 3 : 4),
              child: Row(
                children: [
                  Icon(
                    feature.isIncluded ? Icons.check : Icons.close,
                    size: isSmallScreen ? 16 : 18,
                    color: feature.isIncluded
                        ? const Color(0xFF4CAF50)
                        : Colors.red,
                  ),
                  SizedBox(width: isSmallScreen ? 8 : 12),
                  Expanded(
                    child: Text(
                      feature.text,
                      style: TextStyle(
                        fontSize: isSmallScreen
                            ? 13
                            : (isMediumScreen ? 14 : 15),
                        color: titleColor.withOpacity(
                          feature.isIncluded ? 1.0 : 0.6,
                        ),
                        decoration: feature.isIncluded
                            ? TextDecoration.none
                            : TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Button
          if (showButton) ...[
            SizedBox(height: isSmallScreen ? 16 : 20),
            SizedBox(
              width: double.infinity,
              height: isSmallScreen ? 44 : (isMediumScreen ? 48 : 52),
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: buttonTextColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(isSmallScreen ? 8 : 12),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : (isMediumScreen ? 15 : 16),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PlanFeature {
  final String text;
  final bool isIncluded;

  _PlanFeature(this.text, this.isIncluded);
}
