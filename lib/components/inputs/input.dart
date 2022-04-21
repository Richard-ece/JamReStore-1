import 'package:flutter/material.dart';
import 'package:jam_re_store/models/error_input.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.enabled = true,
    this.errorInput = const ErrorInput(error: null),
    this.keyboardType,
    this.hintText,
    this.suffixIcon,
    this.focusNode,
    this.onTapIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final bool enabled;
  final ErrorInput errorInput;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final String? hintText;
  final IconData? suffixIcon;
  final void Function()? onTapIcon;

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
            style: TextStyleApp.bodyBase(ColorTheme.grey10),
            decoration: InputDecoration(
              labelStyle: TextStyleApp.labelS(ColorTheme.grey7),
              hintStyle: TextStyleApp.bodyS(ColorTheme.grey6),
              errorStyle: TextStyleApp.bodyXs(ColorTheme.errorRed),
              errorText: errorInput.message,
              suffixIcon: GestureDetector(
                child: Icon(suffixIcon, color: ColorTheme.black),
                onTap: onTapIcon,
              ),
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
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: ColorTheme.errorRed,
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
