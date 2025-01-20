import 'package:flutter/material.dart';
import 'package:task_app_flutter/utility/color_constants.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.obsecureText = false,
    this.label = '',
  });

  final String label;
  final bool obsecureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black45,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Appcolors.primaryColor,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        obscureText: true,
      ),
    );
  }
}
