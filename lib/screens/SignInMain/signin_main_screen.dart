import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:task_app_flutter/components/input_field.dart';
import 'package:task_app_flutter/screens/RegisterEmail.dart/register_with_email.dart';
import 'package:task_app_flutter/utility/color_constants.dart';
import 'package:task_app_flutter/utility/custom_fonts.dart';

class SignInMainScreen extends StatefulWidget {
  const SignInMainScreen({super.key});

  @override
  State<SignInMainScreen> createState() => _SignInMainScreenState();
}

class _SignInMainScreenState extends State<SignInMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Appcolors.primaryColor,
                  Appcolors.white,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 40, // Subtract SafeArea padding
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Appcolors.white.withOpacity(0.1),
                                  )),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/logo_white.png',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Hello Again!",
                              style: CustomFonts.heading(
                                color: Appcolors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Welcome back, you've been missed!",
                              style: CustomFonts.subheading(
                                color: Appcolors.white,
                              ),

                              // textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            InputField(
                              hint: 'Sign in with Google',
                              suffixIcon: true,
                              suffixImagePath: 'assets/icons/google.png',
                              onTap: () {},
                              readOnly: true,
                            ),
                            InputField(
                              suffixIcon: true,
                              suffixImagePath: 'assets/icons/facebook.png',
                              isPassword: true,
                              hint: 'Sign in with Facebook',
                              onTap: () {},
                              readOnly: true,
                            ),
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
                              child: const Text.rich(
                                TextSpan(
                                  text: "Already have account? ",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Sign in",
                                      style: TextStyle(
                                        color: Colors.white,
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
                                    color: Appcolors.white,
                                    fontSize: 12,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: 'Before signing in, you can read the ',
                                    ),
                                    TextSpan(
                                      text: 'Terms and Conditions',
                                      style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        // fontWeight: FontWeight.bold,
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
                                      style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        // fontWeight: FontWeight.bold,
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
        ],
      ),
    );
  }
}
