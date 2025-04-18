import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:task_app_flutter/components/input_field.dart';
import 'package:task_app_flutter/components/submit_button.dart';
import 'package:task_app_flutter/screens/home/home.dart';
import 'package:task_app_flutter/utility/color_constants.dart';
import 'package:task_app_flutter/utility/custom_fonts.dart';

class RegisterWithEmail extends StatefulWidget {
  const RegisterWithEmail({super.key});

  @override
  State<RegisterWithEmail> createState() => _RegisterWithEmailState();
}

class _RegisterWithEmailState extends State<RegisterWithEmail> {
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
                  Appcolors.black,
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
                        padding: const EdgeInsets.only(top: 30.0),
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
                            const SizedBox(height: 15),
                            Text(
                              "Create Account",
                              style: CustomFonts.heading(
                                color: Appcolors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Quickly make your account",
                              style: CustomFonts.subheading(
                                color: Appcolors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            InputField(
                              hint: 'Enter your first and last name',
                            ),
                            InputField(
                              hint: 'syz@gmail.com',
                            ),
                            SubmitButton(
                              text: 'Sign up',
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: CustomFonts.minitext(
                              color: Appcolors.white,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Before signing up, you can read the ',
                              ),
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
