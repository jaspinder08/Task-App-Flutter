import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_app_flutter/register_screen.dart';
import 'package:task_app_flutter/utility/color_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ReisterScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 46, 153, 1),
      body: Container(
          color: Appcolors.primaryColor,
          child: Center(
            child: Image.asset(
              "assets/images/logo.png",
              height: 100,
              width: 100,
            ),
          )),
    );
  }
}
