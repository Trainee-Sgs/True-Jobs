import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  static const Color primaryColor = Color(0xFF7C329B);
  static const Color borderColor = Color(0xFFC7BCCF);
  static const Color lightBorderColor = Color(0xFFE5E1E8);

  String selectedEntries = '10';
  String selectedHistory = '1 week';

  final List<String> entriesOptions = ['10', '20', '30'];
  final List<String> historyOptions = ['1 week', '1 month', '3 month'];

  final List<Map<String, String>> paymentItems = const [
    {
      'title': 'To job post',
      'role': '-Flutter developer',
      'amount': '₹ 799',
      'plan': 'Subscription: Basic plan',
      'status': 'Paid',
      'statusType': 'paid',
      'date': '24/03/2024  2:40 pm',
      'icon': 'history',
    },
    {
      'title': 'To job post',
      'role': '-Flutter developer',
      'amount': '₹ 799',
      'plan': 'Subscription: Basic plan',
      'status': 'Failed',
      'statusType': 'failed',
      'date': '24/03/2024  2:40 pm',
      'icon': 'download',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          'Payment History',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.016,
        ),
        child: Column(
          children: [
            Row(
              children: [
                _buildFilterLabel('Entries:', width),
                SizedBox(width: width * 0.012),
                _buildCustomDropdown(
                  context: context,
                  value: selectedEntries,
                  options: entriesOptions,
                  onSelected: (value) {
                    setState(() {
                      selectedEntries = value;
                    });
                  },
                  width: 62,
                  menuWidth: 62,
                ),
                SizedBox(width: width * 0.250),
                _buildFilterLabel('History', width),
                SizedBox(width: width * 0.012),
                _buildCustomDropdown(
                  context: context,
                  value: selectedHistory,
                  options: historyOptions,
                  onSelected: (value) {
                    setState(() {
                      selectedHistory = value;
                    });
                  },
                  width: 98,
                  menuWidth: 98,
                ),
              ],
            ),
            SizedBox(height: height * 0.026),
            Expanded(
              child: ListView.separated(
                itemCount: paymentItems.length,
                separatorBuilder: (_, _) => Divider(
                  height: height * 0.03,
                  thickness: 1,
                  color: lightBorderColor,
                ),
                itemBuilder: (context, index) {
                  final item = paymentItems[index];
                  return _buildHistoryCard(item, width, height);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterLabel(String label, double width) {
    return Text(
      label,
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF5B5B5B),
        height: 1,
        letterSpacing: 0.28,
      ),
    );
  }

  Widget _buildCustomDropdown({
    required BuildContext context,
    required String value,
    required List<String> options,
    required ValueChanged<String> onSelected,
    required double width,
    required double menuWidth,
  }) {
    return PopupMenuButton<String>(
      onSelected: onSelected,
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      splashRadius: 0.1,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      position: PopupMenuPosition.under,
      constraints: BoxConstraints.tightFor(width: menuWidth),
      itemBuilder: (context) => options
          .map(
            (option) => PopupMenuItem<String>(
              value: option,
              padding: EdgeInsets.zero,
              child: Container(
                alignment: Alignment.center,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: borderColor),
                ),
                child: Text(
                  option,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: primaryColor,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    letterSpacing: 0.28,
                  ),
                ),
              ),
            ),
          )
          .toList(),
      child: Container(
        width: width,
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: primaryColor,
                fontWeight: FontWeight.w400,
                height: 1,
                letterSpacing: 0.28,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_up,
              size: 18,
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryCard(Map<String, String> item, double width, double height) {
    final isPaid = item['statusType'] == 'paid';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width * 0.09,
          height: width * 0.09,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor,
          ),
          child: Icon(
            item['icon'] == 'download' ? Icons.download_outlined : Icons.history,
            color: Colors.white,
            size: width * 0.042,
          ),
        ),
        SizedBox(width: width * 0.03),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      item['title'] ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF4B4B4B),
                        height: 1,
                      ),
                    ),
                  ),
                  Text(
                    item['amount'] ?? '',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF4B4B4B),
                      height: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.005),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item['role'] ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: primaryColor,
                        height: 1,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.open_in_new,
                    color: primaryColor,
                    size: 14,
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item['plan'] ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF5E5E5E),
                        height: 1,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: isPaid
                          ? const Color(0xFFE5F7E7)
                          : const Color(0xFFFFE7E7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      item['status'] ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: isPaid
                            ? const Color(0xFF33A852)
                            : const Color(0xFFFF4B4B),
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.012),
              Row(
                children: [
                  if (isPaid)
                    Container(
                      height: 22,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1FA64A),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.download_outlined,
                            color: Colors.white,
                            size: 13,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Invoice',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const Spacer(),
                  Text(
                    item['date'] ?? '',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFB2B2B2),
                      height: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
