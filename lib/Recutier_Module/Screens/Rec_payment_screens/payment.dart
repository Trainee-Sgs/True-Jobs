// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/Recutier_Module/Screens/Rec_payment_screens/payment_success.dart';

class Payment extends StatefulWidget {
  final String planName;
  final double price;

  const Payment({super.key, required this.planName, required this.price});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String selectedPaymentMode = '';
  String selectedOtherMode = '';
  final TextEditingController upiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;

    // Responsive dimensions
    final horizontalPadding = isTablet ? screenWidth * 0.1 : 16.0;
    final cardPadding = isTablet ? 24.0 : 16.0;
    final iconSize = isTablet ? 32.0 : 24.0;
    final bodyFontSize = isTablet ? 16.0 : 14.0;

    // Calculate GST and total based on the price
    final gst = widget.price * 0.18;
    final total = widget.price + gst;
    final String cardImage = widget.planName == 'Basic Plan'
        ? 'assets/basic_payment.png'
        : 'assets/premium_payment.png';
    final Color cardColor = widget.planName == 'Basic Plan'
        ? Colors.green
        : const Color(0xFF7C329B);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7C329B),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Payment',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),

            // Chosen Plan Section
            Text(
              'Chosen Plan',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                height: 1,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),

            // Chosen Plan Card (Basic or Premium)
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.all(cardPadding),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(cardImage), // ✅ use AssetImage
                  fit: BoxFit.cover, // ✅ makes image fill container
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.025),

            // Summary Section
            Text(
              'Summary',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                height: 1,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),

            // Summary Details
            _buildSummaryRow(
              widget.planName,
              '₹ ${widget.price.toInt()}',
              bodyFontSize,
            ),
            SizedBox(height: screenHeight * 0.01),
            _buildSummaryRow('GST 18%', '₹ ${gst.toInt()}', bodyFontSize),
            SizedBox(height: screenHeight * 0.01),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: screenHeight * 0.01),
            _buildSummaryRow(
              'Total',
              '₹ ${total.toInt()}',
              bodyFontSize,
              isBold: true,
            ),

            SizedBox(height: screenHeight * 0.025),

            // Choose Payment Mode Section
            Text(
              'Choose Payment Mode',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                height: 1,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),

            // Select UPI App
            Text(
              'Select UPI App',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF7C329B),
                height: 1,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),

            // UPI Apps Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: isTablet ? 4 : 3,
              mainAxisSpacing: isTablet ? 20 : 16,
              crossAxisSpacing: isTablet ? 20 : 16,
              childAspectRatio: isTablet ? 1.2 : 1.0,
              children: [
                _buildPaymentOption(
                  'Google Pay',
                  'assets/google_pay.png',
                  'google_pay',
                  iconSize,
                ),
                _buildPaymentOption(
                  'Phone Pe',
                  'assets/phone_pe.png',
                  'phone_pe',
                  iconSize,
                ),
                _buildPaymentOption(
                  'Paytm',
                  'assets/paytm.png',
                  'paytm',
                  iconSize,
                ),
                _buildPaymentOption(
                  'Amazon Pay',
                  'assets/amazon_pay.png',
                  'amazon_pay',
                  iconSize,
                ),
                _buildPaymentOption(
                  'Apple Pay',
                  'assets/apple_pay.png',
                  'apple_pay',
                  iconSize,
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.025),

            // UPI ID Input
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: upiController,
                style: GoogleFonts.poppins(fontSize: 14, height: 1),
                decoration: InputDecoration(
                  hintText: 'Type or paste UPI ID here',
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                    height: 1,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(cardPadding),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.025),

            // Other Modes Section
            Text(
              'Other Modes',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                height: 1,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),

            // Debit/Credit Card Option
            _buildOtherModeOption(
              'Debit/Credit Card',
              Icons.credit_card,
              'debit_credit',
              bodyFontSize,
            ),
            SizedBox(height: screenHeight * 0.01),

            // Net Banking Option
            _buildOtherModeOption(
              'Net Banking',
              Icons.account_balance,
              'net_banking',
              bodyFontSize,
            ),

            SizedBox(height: screenHeight * 0.04),

            // Pay Button
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: isTablet ? 60 : 50,
          child: ElevatedButton(
            onPressed: () {
              // Handle payment
             Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentSuccess()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7C329B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Text(
              'Pay ₹ ${total.toInt()}',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String amount,
    double fontSize, {
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            color: Colors.black87,
            height: 1,
          ),
        ),
        Text(
          amount,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            color: Colors.black87,
            height: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOption(
    String title,
    String assetPath,
    String value,
    double iconSize,
  ) {
    final isSelected = selectedPaymentMode == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMode = value;
          selectedOtherMode = '';
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? const Color(0xFF7C329B) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: iconSize + 8,
              height: iconSize + 8,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              child: Image.asset(
                assetPath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.payment,
                    size: iconSize,
                    color: Colors.grey.shade600,
                  );
                },
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherModeOption(
    String title,
    IconData icon,
    String value,
    double fontSize,
  ) {
    final isSelected = selectedOtherMode == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOtherMode = value;
          selectedPaymentMode = '';
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? const Color(0xFF7C329B) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: const Color(0xFF7C329B),
            ),
            const SizedBox(width: 12),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _processPayment(double totalAmount) {
    // Add your payment processing logic here
    // print('Processing payment...');
    // print('Selected UPI App: $selectedPaymentMode');
    // print('Selected Other Mode: $selectedOtherMode');
    // print('UPI ID: ${upiController.text}');

    // Show success dialog or navigate to success page
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Payment Initiated',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          ),
          content: Text(
            'Your payment of ₹${totalAmount.toInt()} has been initiated successfully.',
            style: GoogleFonts.poppins(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF7C329B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    upiController.dispose();
    super.dispose();
  }
}
