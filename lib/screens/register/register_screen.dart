import 'package:flutter/material.dart';
import 'package:task_app_flutter/components/input_field.dart';
import 'package:task_app_flutter/components/submit_button.dart';
import 'package:task_app_flutter/utility/color_constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Appcolors.white,
        leading: const Icon(
          Icons.arrow_back,
          color: Appcolors.primaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
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
              email: true,
              obsecureText: false,
              inputType: TextInputType.emailAddress,
            ),
            const InputField(
              label: 'Password',
              obsecureText: true,
              inputType: TextInputType.visiblePassword,
            ),
            const InputField(
              label: 'Confirm Password',
              obsecureText: true,
              inputType: TextInputType.visiblePassword,
            ),
            const SubmitButton()
          ],
        ),
      ),
    );
  }
}
