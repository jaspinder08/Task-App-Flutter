import 'package:flutter/material.dart';
import 'package:task_app_flutter/utility/color_constants.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    this.text = '',
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: ElevatedButton(
          onPressed: onTap, // Correctly handles onTap
          style: ElevatedButton.styleFrom(
            backgroundColor: Appcolors.primaryColor, // Button color
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Appcolors.white,
            ),
          ),
        ),
      ),
    );
  }
}
