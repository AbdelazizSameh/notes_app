import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
    this.controller,
    this.onChanged,
    this.suffixIcon,
  });
  final String hintText;
  final int maxLines;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value?.trim().isEmpty ?? true) {
          return 'The field cannot be empty';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        suffixIcon: Icon(suffixIcon),
        hintText: hintText,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(color: kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
