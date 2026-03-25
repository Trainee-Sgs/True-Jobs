import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_SEEKER/Home_screens/home.dart';
import 'package:true_jobs/login_pages/Register/reg_login.dart';
import 'package:true_jobs/login_pages/forgot.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final purpleColor = const Color(0xFF7C329B);
    final mediaQuery = MediaQuery.of(context);
    final isTablet = mediaQuery.size.width > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () {
            // This is a placeholder for the language selection page.
            // You will need to replace this with the actual navigation.
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: isTablet ? 100 : 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight - AppBar().preferredSize.height),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      // Logo
                      Image.asset(
                        'assets/TrueJobs logo.png',
                        height: isTablet ? 90 : 60,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 16),
                      // Subtitle
                      Text(
                        "Discover Opportunities with Our\nReliable Community.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: isTablet ? 18 : 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Login Title
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 30 : 24,
                            color: purpleColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Mobile number field
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          style: GoogleFonts.poppins(fontSize: isTablet ? 20 : 16),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: isTablet ? 20 : 15,
                              horizontal: 10,
                            ),
                            hintText: 'Mobile number',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Password field
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          obscureText: !_passwordVisible,
                          style: GoogleFonts.poppins(fontSize: isTablet ? 20 : 16),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: isTablet ? 20 : 15,
                              horizontal: 10,
                            ),
                            hintText: 'Password',
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Remember me & Forgot password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Transform.scale(
                                scale: isTablet ? 1.5 : 1.0,
                                child: Checkbox(value: false, onChanged: (bool? value) {}),
                              ),
                              Text(
                                "Remember me",
                                style: GoogleFonts.poppins(fontSize: isTablet ? 18 : 14),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Forgot()));
                            },
                            child: Text(
                              "Forgot password",
                              style: GoogleFonts.poppins(
                                fontSize: isTablet ? 18 : 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: isTablet ? 60 : 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                          },
                          child: Text(
                            'Login',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: isTablet ? 22 : 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // or continue with
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "or continue with",
                              style: GoogleFonts.poppins(
                                fontSize: isTablet ? 18 : 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Social logins
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google_login.png',
                            height: isTablet ? 60 : 48,
                            width: isTablet ? 60 : 48,
                          ),
                          SizedBox(width: isTablet ? 40 : 32),
                          Image.asset(
                            'assets/apple_login.png',
                            height: isTablet ? 60 : 48,
                            width: isTablet ? 60 : 48,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // New registration
                      GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> RegLogin()));},
                        child: Text.rich(
                          TextSpan(
                            text: "New registration! ",
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 18 : 14,
                              color: Colors.black87,
                            ),
                            children: [
                              TextSpan(
                                text: "Register Now",
                                style: GoogleFonts.poppins(
                                  decoration: TextDecoration.underline,
                                  color: const Color(0xFF43A047),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Terms and Privacy
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text.rich(
                          TextSpan(
                            text: 'By clicking Continue, you agree to True Jobs ',
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 16 : 12,
                              color: Colors.black54,
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: GoogleFonts.poppins(
                                  decoration: TextDecoration.underline,
                                  color: purpleColor,
                                ),
                              ),
                              TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy.',
                                style: GoogleFonts.poppins(
                                  decoration: TextDecoration.underline,
                                  color: purpleColor,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 24),
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
