import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_app_flutter/components/input_field.dart';
import 'package:task_app_flutter/components/submit_button.dart';
import 'package:task_app_flutter/screens/forgotpassword/forgot_password.dart';
import 'package:task_app_flutter/screens/home/home.dart';
import 'package:task_app_flutter/screens/register/register_screen.dart';
import 'package:task_app_flutter/utility/color_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    const SizedBox(height: 20),
                    // Glass container
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Hello Again!",
                          style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Welcome back, you've been missed!",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        InputField(
                          icon: Icons.person_2_outlined,
                          hint: 'Email or Username',
                          suffixIcon: true,
                          suffixImagePath: 'assets/icons/google.png',
                        ),
                        InputField(
                          icon: Icons.lock_open_outlined,
                          isPassword: true,
                          hint: 'Password',
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ForgotPassword(),
                              ),
                            );
                          },
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Recovery Password?",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        SubmitButton(
                          text: 'Login',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text.rich(
                              TextSpan(
                                text: "Not a member? ",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Register now",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
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
        ],
      ),
    );
  }
}
