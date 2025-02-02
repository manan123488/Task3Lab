// import 'package:flutter/material.dart';
// class SplashScreen extends StatefulWidget {
//   final Widget? child;
//   const SplashScreen({super.key, required this.child}); // Mark child as required
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState(); // Call super.initState() first
//
//     // Navigate to the provided child widget after 3 seconds
//     Future.delayed(
//       const Duration(seconds: 3),
//           () {
//         if (widget.child != null) {
//           Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(builder: (context) => widget.child!),
//                 (route) => false,
//           );
//         } else {
//           // Handle the case where child is not provided
//           debugPrint("Error: Child widget is not provided.");
//         }
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           "Welcome To Flutter Firebase",
//           style: TextStyle(
//             color: Colors.blue,
//             fontWeight: FontWeight.bold,
//             fontSize: 24, // Added fontSize for better visibility
//           ),
//         ),
//       ),
//   );
// }
// }

















import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, required this.child}); // Mark child as required

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState(); // Call super.initState() first

    // Navigate to the provided child widget after 3 seconds
    Future.delayed(
      const Duration(seconds: 3),
          () {
        if (widget.child != null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => widget.child!),
                (route) => false,
          );
        } else {
          // Handle the case where child is not provided
          debugPrint("Error: Child widget is not provided.");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/image.jpg"), // Replace with your image path
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Center(
          child: Text(
            "Welcome To Flutter Firebase",
            style: TextStyle(
              color: Colors.lime,
              fontWeight: FontWeight.bold,
              fontSize: 24, // Added fontSize for better visibility
            ),
          ),
        ),
      ),
    );
  }
}