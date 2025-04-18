import 'package:flutter/material.dart';
import 'package:task_app_flutter/utility/color_constants.dart';

class InputField extends StatelessWidget {
  InputField({
    super.key,
    this.obsecureText = false,
    this.email = false,
    this.hint = '',
    this.inputType = TextInputType.text,
    this.isPassword = false,
    this.suffixIcon = false,
    this.suffixImagePath,
    this.readOnly = false,
    this.onTap,
  });

  final String hint;
  final bool email;
  final bool obsecureText;
  final TextInputType inputType;
  final bool isPassword;
  final bool suffixIcon;
  final String? suffixImagePath; // made it strongly typed
  final bool readOnly;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: suffixIcon
              ? (suffixImagePath != null
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                        child: Image.asset(
                          suffixImagePath!,
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : const Icon(
                      Icons.arrow_circle_right,
                      color: Appcolors.white,
                    ))
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.white.withOpacity(0.7),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
        ),
        obscureText: isPassword,
        keyboardType: inputType,
      ),
    );
  }
}
