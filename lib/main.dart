import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:true_jobs/login_pages/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Disable back navigation globally
        return false;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'True Jobs App',
        theme: ThemeData(
          // fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // Set the home to your SplashScreen
        home: const SplashScreen(),
      ),
    );
  }
}

//creaate the feature enhancement kavi
