import 'package:flutter/material.dart';
import 'package:task_app_flutter/utility/color_constants.dart';

class InputField extends StatelessWidget {
  InputField({
    super.key,
    this.obsecureText = false,
    this.email = false,
    this.hint = '',
    this.inputType = TextInputType.text,
    required this.icon,
    this.isPassword = false,
    this.suffixIcon = false,
  });

  final String hint;
  final bool email;
  final bool obsecureText;
  final TextInputType inputType;
  final IconData icon;
  final bool isPassword;
  final bool suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint, // Changed from labelText to hintText
          prefixIcon: Icon(icon, color: Colors.white),
          suffixIcon: suffixIcon
              ? const Icon(
                  Icons.arrow_circle_right,
                  color: Appcolors.white,
                )
              : null,
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.white.withOpacity(0.7),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
        ),
        obscureText: isPassword,
        keyboardType: inputType,
      ),
    );
  }
}
