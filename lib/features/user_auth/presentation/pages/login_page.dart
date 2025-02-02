//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:loginsignup/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
// import 'package:loginsignup/features/user_auth/presentation/pages/home_page.dart';
// import 'package:loginsignup/features/user_auth/presentation/pages/sign_up_page.dart';
// import 'package:loginsignup/features/user_auth/presentation/widgets/form_container_widget.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final FirebaseAuthService _auth = FirebaseAuthService();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool isLoggingIn = false;
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   void _login() async {
//     setState(() {
//       isLoggingIn = true;
//     });
//
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//
//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Please fill in all fields."),
//           backgroundColor: Colors.red,
//         ),
//       );
//       setState(() {
//         isLoggingIn = false;
//       });
//       return;
//     }
//
//     try {
//       User? user = await _auth.signInWithEmailAndPassword(email, password);
//
//       if (user != null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Login successful."),
//             backgroundColor: Colors.green,
//           ),
//         );
//
//         setState(() {
//           isLoggingIn = false;
//         });
//
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const HomePage()),
//         );
//       } else {
//         setState(() {
//           isLoggingIn = false;
//         });
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         isLoggingIn = false;
//       });
//
//       String errorMessage;
//       if (e.code == 'user-not-found') {
//         errorMessage = "No user found for that email.";
//       } else if (e.code == 'wrong-password') {
//         errorMessage = "Incorrect password.";
//       } else {
//         errorMessage = "Login failed: ${e.message}";
//       }
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(errorMessage),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } catch (e) {
//       setState(() {
//         isLoggingIn = false;
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("An error occurred: ${e.toString()}"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Login"),
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Login",
//                 style: TextStyle(
//                   fontSize: 27,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 30),
//               FormContainerWidget(
//                 controller: _emailController,
//                 hintText: "Email",
//                 isPasswordField: false,
//               ),
//               const SizedBox(height: 10),
//               FormContainerWidget(
//                 controller: _passwordController,
//                 hintText: "Password",
//                 isPasswordField: true,
//               ),
//               const SizedBox(height: 30),
//               GestureDetector(
//                 onTap: isLoggingIn ? null : _login,
//                 child: Container(
//                   width: double.infinity,
//                   height: 45,
//                   decoration: BoxDecoration(
//                     color: isLoggingIn ? Colors.grey : Colors.blue,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(
//                     child: isLoggingIn
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text(
//                       "Login",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Don't have an account?"),
//                   const SizedBox(width: 5),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const SignUpPage(),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       "Sign Up",
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//   );
// }
// }
















import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginsignup/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:loginsignup/features/user_auth/presentation/pages/home_page.dart';
import 'package:loginsignup/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:loginsignup/features/user_auth/presentation/widgets/form_container_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoggingIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    setState(() {
      isLoggingIn = true;
    });

    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in all fields."),
          backgroundColor: Colors.red,
        ),
      );
      setState(() {
        isLoggingIn = false;
      });
      return;
    }

    try {
      User? user = await _auth.signInWithEmailAndPassword(email, password);

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login successful."),
            backgroundColor: Colors.green,
          ),
        );

        setState(() {
          isLoggingIn = false;
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        setState(() {
          isLoggingIn = false;
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoggingIn = false;
      });

      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password.";
      } else {
        errorMessage = "Login failed: ${e.message}";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      setState(() {
        isLoggingIn = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/pic2.jpg"), // Replace with your image path
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87, // Adjust text color for visibility
                  ),
                ),
                const SizedBox(height: 30),
                FormContainerWidget(
                  controller: _emailController,
                  hintText: "Email",
                  isPasswordField: false,
                ),
                const SizedBox(height: 10),
                FormContainerWidget(
                  controller: _passwordController,
                  hintText: "Password",
                  isPasswordField: true,
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: isLoggingIn ? null : _login,
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: isLoggingIn ? Colors.grey : Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: isLoggingIn
                          ? const CircularProgressIndicator(color: Colors.black)
                          : const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black), // Adjust text color for visibility
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}