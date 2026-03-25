import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/login_pages/Register/create_reg.dart';

class RegOtp extends StatefulWidget {
  const RegOtp({super.key});

  @override
  State<RegOtp> createState() => _RegOtpState();
}

class _RegOtpState extends State<RegOtp> {
  final int otpLength = 6;
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final FocusNode _focusNode = FocusNode();
  int seconds = 29;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    seconds = 29;
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted && seconds > 0) {
        setState(() => seconds--);
        return true;
      }
      return false;
    });
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final purpleColor = const Color(0xFF7C329B);

    // MediaQuery sizes
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.12),
                      Center(
                        child: Image.asset(
                          'assets/TrueJobs logo.png',
                          height: height * 0.07,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: height * 0.08),
                      Center(
                        child: Text(
                          "Discover Opportunities with Our\nReliable Community.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: width * 0.045,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),

                      // OTP Boxes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(otpLength, (i) {
                          return Container(
                            width: width * 0.11,
                            height: height * 0.06,
                            margin: EdgeInsets.symmetric(
                                horizontal: width * 0.015),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade500,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: TextField(
                                controller: _controllers[i],
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: width * 0.06,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                ),
                                onChanged: (val) {
                                  if (val.length == 1 && i < otpLength - 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: height * 0.025),

                      Text(
                        "We sent an OTP to the given mail id/mobile number ",
                        style: GoogleFonts.poppins(
                          fontSize: width * 0.032,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: height * 0.04),

                      Row(
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: "Didn't receive OTP? ",
                                style: GoogleFonts.poppins(
                                  fontSize: width * 0.035,
                                  color: Colors.black87,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Resend now",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: width * 0.035,
                                      color: purpleColor,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text("00:"),
                              Text(
                                seconds.toString().padLeft(2, '0'),
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: width * 0.035,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.08),

                      // Proceed Button
                      SizedBox(
                        width: double.infinity,
                        height: height * 0.07,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreateReg(),
                              ),
                            );
                          },
                          child: Text(
                            'Verify OTP',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.025),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

