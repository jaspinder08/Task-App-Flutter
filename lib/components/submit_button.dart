import 'package:flutter/material.dart';
import 'package:task_app_flutter/utility/color_constants.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: MaterialButton(
          color: Appcolors.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 20),
          onPressed: () {},
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          child: const Text(
            'Submit',
            style: TextStyle(
              fontSize: 15,
              color: Appcolors.white,
            ),
          ),
        ),
      ),
    );
  }
}
