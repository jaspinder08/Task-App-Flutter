import 'package:flutter/material.dart';
import 'package:task_app_flutter/components/input_field.dart';
import 'package:task_app_flutter/submit_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 150,
                  width: 150,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Create your Account',
                  style: TextStyle(
                    fontFamily: 'OpenSans', // Specify the font family
                    fontSize: 18,
                    // color: Appcolors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const InputField(
              label: 'Email',
            ),
            const InputField(
              label: 'Password',
            ),
            const InputField(
              label: 'Confirm Password',
            ),
            const SubmitButton()
          ],
        ),
      ),
    );
  }
}
