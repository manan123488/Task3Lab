// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Page"),
//         // To remove the back button explicitly
//         automaticallyImplyLeading: false,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Welcome Home",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: () async {
//                 await FirebaseAuth.instance.signOut();
//                 Navigator.pushNamedAndRemoveUntil(
//                   context,
//                   "/login",
//                       (Route<dynamic> route) => false,
//                 );
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text("Successfully signed out"),
//                     backgroundColor: Colors.green,
//                   ),
//                 );
//               },
//               child: Container(
//                 height: 45,
//                 width: 100,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "Sign out",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // When navigating to HomePage, use pushAndRemoveUntil
// void navigateToHomePage(BuildContext context) {
//   Navigator.of(context).pushAndRemoveUntil(
//     MaterialPageRoute(builder: (context) => const HomePage()),
//         (Route<dynamic> route) => false, // This removes all routes from the stack
// );
// }











import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.brown), // Change AppBar text color
        ),
        backgroundColor: Colors.blueGrey, // Change AppBar background color
        automaticallyImplyLeading: false, // Remove the back button
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/pic.jpeg"), // Replace with your image path
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome Home",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey, // Change text color for visibility
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    "/login",
                        (Route<dynamic> route) => false,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Successfully signed out"),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: Container(
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple, // Change button color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Sign out",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
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

// When navigating to HomePage, use pushAndRemoveUntil
void navigateToHomePage(BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const HomePage()),
        (Route<dynamic> route) => false, // This removes all routes from the stack
  );
}