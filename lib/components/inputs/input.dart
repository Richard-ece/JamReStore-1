import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/models/error_input.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class Input extends HookWidget {
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
    this.textInputAction = TextInputAction.next,
    this.loading = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final bool enabled;
  final bool loading;
  final ErrorInput errorInput;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final String? hintText;
  final IconData? suffixIcon;
  final TextInputAction textInputAction;
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
    var showErrorState = useState(true);

    useEffect(() {
      if (loading && showErrorState.value == false) {
        showErrorState.value = true;
      }
      return null;
    }, [loading]);

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
            onChanged: (_) {
              if (errorInput.error == true && showErrorState.value == true) {
                showErrorState.value = false;
              }
            },
            decoration: InputDecoration(
              labelStyle: TextStyleApp.labelS(ColorTheme.grey7),
              hintStyle: TextStyleApp.bodyS(ColorTheme.grey6),
              errorStyle: TextStyleApp.bodyXs(ColorTheme.errorRed),
              errorText:
                  showErrorState.value && !loading ? errorInput.message : null,
              suffixIcon: GestureDetector(
                child: Icon(suffixIcon, color: ColorTheme.black),
                onTap: onTapIcon,
              ),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: getBorderColor(showErrorState.value && !loading
                      ? errorInput.error
                      : null),
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
            textInputAction: textInputAction,
          ),
        ],
      ),
    );
  }
}
