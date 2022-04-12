import 'package:flutter/material.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.backgroudColor,
    this.textColor = ColorTheme.white,
  }) : super(key: key);

  final String labelText;
  final Widget icon;
  final Color backgroudColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 58),
        primary: backgroudColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon,
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
