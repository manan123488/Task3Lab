import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loginsignup/features/app/splash_screen/splash_screen.dart';
import 'package:loginsignup/features/user_auth/presentation/pages/login_page.dart';
import 'package:loginsignup/features/user_auth/presentation/pages/home_page.dart'; // Import HomePage

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized

  // Initialize Firebase
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCdqWgLIrTJ-oTtaUEbQda2Pte_iGw1VtA",
        appId: "1:826389376340:web:7f2f6ffb84b5074250ecc1",
        messagingSenderId: "826389376340",
        projectId: "loginsignup-656a7",
      ),
    );
  } else {
    await Firebase.initializeApp(); // Initialize Firebase for non-web platforms
  }

  runApp(const MyApp()); // Run the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Add a const constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set a default theme
      ),
      home: SplashScreen(
        child: LoginPage(),
      ),
      // Define named routes
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(), // Define the home route
      },
    );
  }
}