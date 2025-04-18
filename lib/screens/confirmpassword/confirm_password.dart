import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_app_flutter/components/input_field.dart';
import 'package:task_app_flutter/components/submit_button.dart';
import 'package:task_app_flutter/screens/home/home.dart';
import 'package:task_app_flutter/utility/color_constants.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
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
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                    padding: const EdgeInsets.all(20),
                    width: 400,
                    height: 600,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Align(
                            alignment: Alignment.topLeft,
                            child: Icon(
                              Icons.arrow_back,
                              color: Appcolors.white,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            const Text(
                              "Confirm Password",
                              style: TextStyle(
                                fontSize: 35,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Make new password",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15),
                            InputField(
                              // icon: Icons.lock_open_outlined,
                              isPassword: true,
                              hint: 'Password',
                            ),
                            const SizedBox(height: 15),
                            InputField(
                              // icon: Icons.lock_open_outlined,
                              isPassword: true,
                              hint: 'Confirm Password',
                            ),
                            const SizedBox(height: 10),
                            SubmitButton(
                              text: 'Change Password',
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
                      ],
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
