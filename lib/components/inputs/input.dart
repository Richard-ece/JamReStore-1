import 'package:flutter/material.dart';
import 'package:jam_re_store/models/error_input.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class Input extends StatelessWidget {
  const Input(
      {Key? key,
      required this.controller,
      required this.keyboardType,
      this.focusNode,
      this.obscureText = false,
      this.enabled = true,
      required this.labelText,
      this.errorInput = const ErrorInput(error: null),
      this.hintText,
      this.suffixIcon})
      : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final bool obscureText;
  final bool enabled;
  final ErrorInput errorInput;
  final String labelText;
  final String? hintText;
  final Icon? suffixIcon;

  Color getBorderColor(bool? error) {
    switch (error) {
      case null:
        return ColorTheme.grey2;

      case false:
        return ColorTheme.successGreen;

      case true:
        return ColorTheme.errorRed;

      default:
        return ColorTheme.grey2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              labelText,
              style: TextStyleApp.labelS(ColorTheme.grey7),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              errorText: errorInput.message,
              suffixIcon: suffixIcon,
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: getBorderColor(errorInput.error),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: ColorTheme.blue,
                  width: 1,
                ),
              ),
            ),
            controller: controller,
            keyboardType: keyboardType,
            focusNode: focusNode,
            obscureText: obscureText,
            enableSuggestions: false,
            autocorrect: false,
            enabled: enabled,
          ),
        ],
      ),
    );
  }
}
