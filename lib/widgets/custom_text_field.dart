import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, this.hintText, this.onChanged ,this.inputType, this.obscureText =false, required TextEditingController controller});
  Function(String)? onChanged;
  String? hintText;
  TextInputType?inputType;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText:obscureText!,
  keyboardType: inputType,

      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8)
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(8)

        ),
      ),
    );
  }
}
