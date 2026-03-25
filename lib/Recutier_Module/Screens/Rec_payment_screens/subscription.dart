import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/Recutier_Module/Screens/Rec_payment_screens/payment.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  int selectedPlan = 0; // 0 for Basic, 1 for Premium

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 600;
    final horizontalPadding = isMobile ? mediaQuery.size.width * 0.05 : 32.0;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/hand.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withValues(alpha: 0.3), // dark overlay
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    _buildHeader(isMobile),
                    const SizedBox(height: 24),
                    _buildPlanCard(
                      'Basic Plan',
                      599.0, // price
                      [
                        '5 active job posts',
                        '100 applications per month',
                        'Open 10 candidate profiles (uses 10 credits)',
                        'Basic matching tools',
                        'Company profile listing',
                        'Email support (within 48 hrs)',
                      ],
                      0,
                      isMobile,
                    ),
                    const SizedBox(height: 16),
                    _buildPlanCard(
                      'Premium Plan',
                      1199.0, // price
                      [
                        'Unlimited job posts',
                        'Unlimited applications',
                        'Open 20 candidate profiles (uses 20 credits)',
                        'Advanced matching tools',
                        'Featured company profile',
                        'Priority support (within 12 hrs)',
                      ],
                      1,
                      isMobile,
                    ),
                    const SizedBox(height: 24),
                    _buildCreditInfo(isMobile),
                    const SizedBox(height: 16),
                    _buildProceedButton(isMobile),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ---------- HEADER ----------
  Widget _buildHeader(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 8),
            Text(
              'Subscription plans',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 16,
                height: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Center(
          child: Column(
            children: [
              Text(
                '"Get More Value With Smarter\nJob Posting!"',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: isMobile ? 20.0 : 28.0,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: isMobile ? 60 : 80,
                height: isMobile ? 60 : 80,
                child: Image.asset('assets/plane.gif'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Choose a plan',
          style: GoogleFonts.poppins(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 14,
            height: 1,
          ),
        ),
      ],
    );
  }

  // ---------- PLAN CARD ----------
  Widget _buildPlanCard(
    String title,
    double price,
    List<String> features,
    int planIndex,
    bool isMobile,
  ) {
    final isSelected = selectedPlan == planIndex;
    final primaryColor = planIndex == 0
        ? Colors.green
        : const Color(0xFF7C329B);
    final cardImage = planIndex == 0
        ? 'assets/basic.png'
        : 'assets/premium.png';

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = planIndex;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.white24,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- LEFT SIDE ----------
            Column(
              children: [
                SizedBox(
                  width: isMobile ? 70 : 90,
                  height: isMobile ? 70 : 90,
                  child: Image.asset(cardImage),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16,
                    height: 1,
                  ),
                ),
                Text(
                  '@ ₹${price.toInt()}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 14,
                    height: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),

            // ---------- RIGHT SIDE ----------
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color: isSelected ? primaryColor : Colors.white,
                      size: isMobile ? 26 : 30,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...features.map((f) => _buildFeatureRow(f, isMobile)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- FEATURE ROW ----------
  Widget _buildFeatureRow(String text, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.fiber_manual_record,
            color: Colors.white,
            size: isMobile ? 10 : 12,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- CREDIT INFO ----------
  Widget _buildCreditInfo(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        children: [
          SizedBox(
            width: isMobile ? 40 : 50,
            height: isMobile ? 40 : 50,
            child: Image.asset('assets/coin.gif'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '1 credit will be spent to open 1 candidate profile',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- BUTTON ----------
  Widget _buildProceedButton(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(12.0), // spacing from screen edges
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            String planName = selectedPlan == 0 ? 'Basic Plan' : 'Premium Plan';
            double price = selectedPlan == 0 ? 599.0 : 1199.0;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Payment(
                  planName: planName,
                  price: price,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF7C329B),
            padding: EdgeInsets.symmetric(vertical: isMobile ? 16.0 : 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
          ),
          child: Text(
            'Proceed To Payment',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
