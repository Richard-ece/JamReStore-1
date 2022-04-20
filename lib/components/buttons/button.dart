import 'package:flutter/material.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.labelText,
    this.backgroudColor = ColorTheme.blue,
    this.borderColor = Colors.transparent,
    this.textColor = ColorTheme.white,
    this.outline = false,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final String labelText;
  final Widget? icon;
  final Color backgroudColor;
  final Color borderColor;
  final Color textColor;
  final bool outline;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: Size(double.infinity, 58),
        primary: outline ? Colors.transparent : backgroudColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
            side: BorderSide(color: borderColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon ?? Container(),
          Text(
            labelText,
            style: TextStyleApp.labelS(textColor),
          ),
          Container()
        ],
      ),
    );
  }
}
