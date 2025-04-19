// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:task_app_flutter/components/input_field.dart';
import 'package:task_app_flutter/screens/RegisterEmail.dart/register_with_email.dart';
import 'package:task_app_flutter/utility/color_constants.dart';
import 'package:task_app_flutter/utility/custom_fonts.dart';
import 'package:task_app_flutter/services/auth_service.dart';
import 'package:task_app_flutter/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInMainScreen extends StatefulWidget {
  const SignInMainScreen({super.key});

  @override
  State<SignInMainScreen> createState() => _SignInMainScreenState();
}

class _SignInMainScreenState extends State<SignInMainScreen> {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  // ignore: unused_field
  String _testMessage = '';

  @override
  void initState() {
    super.initState();
    _checkFirebaseStatus();
  }

  Future<void> _checkFirebaseStatus() async {
    try {
      // Check if Firebase Auth is initialized
      final auth = FirebaseAuth.instance;
      setState(() {
        _testMessage = 'Firebase Auth is initialized';
      });
      print('Firebase Auth Status: ${auth.app.name}');
    } catch (e) {
      setState(() {
        _testMessage = 'Firebase Auth Error: $e';
      });
      print('Firebase Auth Error: $e');
    }
  }

  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _isLoading = true;
      _testMessage = 'Attempting Google Sign In...';
    });

    try {
      final userCredential = await _authService.signInWithGoogle();
      if (userCredential != null && mounted) {
        setState(() {
          _testMessage = 'Successfully signed in with Google';
        });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        setState(() {
          _testMessage = 'Google Sign In was cancelled or failed';
        });
      }
    } catch (e) {
      setState(() {
        _testMessage = 'Error during Google Sign In: $e';
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to sign in with Google: $e'),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Appcolors.primaryColor.withOpacity(0.1),
                                  )),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/logo_blue.png',
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Welcome Back!",
                              style: CustomFonts.heading(
                                color: Appcolors.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Welcome back, you've been missed!",
                              style: CustomFonts.subheading(
                                color: Appcolors.black.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(height: 50),
                            InputField(
                              hint: 'Sign in with Google',
                              suffixIcon: true,
                              suffixImagePath: 'assets/icons/google.png',
                              onTap: _isLoading ? null : _handleGoogleSignIn,
                              readOnly: true,
                              textColor: Appcolors.white,
                              hintColor: Appcolors.black.withOpacity(0.4),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Appcolors.black.withOpacity(0.1),
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    "OR",
                                    style: CustomFonts.subheading(
                                      color: Appcolors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Appcolors.black.withOpacity(0.1),
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            InputField(
                              suffixIcon: true,
                              suffixImagePath: 'assets/icons/mail.png',
                              isPassword: true,
                              hint: 'Sign in with Email',
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => RegisterWithEmail(),
                                  ),
                                );
                              },
                              readOnly: true,
                              textColor: Appcolors.white,
                              hintColor: Appcolors.black.withOpacity(0.4),
                            ),
                            const SizedBox(height: 15),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterWithEmail(),
                                  ),
                                );
                              },
                              child: Text.rich(
                                TextSpan(
                                  text: "Already have account? ",
                                  style: TextStyle(
                                    color: Appcolors.black.withOpacity(0.7),
                                    fontSize: 14,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Sign in",
                                      style: TextStyle(
                                        color: Appcolors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Appcolors.black.withOpacity(0.5),
                                    fontSize: 12,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: 'Before signing in, you can read the ',
                                    ),
                                    TextSpan(
                                      text: 'Terms and Conditions',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Appcolors.primaryColor,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // TODO: Navigate to Terms and Conditions
                                        },
                                    ),
                                    const TextSpan(
                                      text: ' and ',
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Appcolors.primaryColor,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // TODO: Navigate to Privacy Policy
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
