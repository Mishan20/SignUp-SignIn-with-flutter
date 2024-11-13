// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    this.prefixIcon,
    required this.labalText,
    required this.hintText,
    this.isPassword = false,
    this.inputType = TextInputType.text,
    required this.errorText,
  });

  final IconData? prefixIcon;
  final String labalText;
  final String hintText;
  bool isPassword;
  TextInputType inputType;
  String errorText;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = true; // Default password visibility is hidden

  @override
  void initState() {
    super.initState();
    // Set the initial state of the password visibility
    isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType,
      obscureText: widget.isPassword && isObscure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorText;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        label: Text(widget.labalText),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(widget.prefixIcon, color: Colors.blueAccent),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.blueAccent,
                ),
              )
            : null,
      ),
    );
  }
}
