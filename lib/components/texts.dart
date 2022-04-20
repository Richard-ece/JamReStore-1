import 'package:flutter/material.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyleApp.labelXl(ColorTheme.grey11),
    );
  }
}

class SubTitlePage extends StatelessWidget {
  const SubTitlePage({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyleApp.bodyBase(ColorTheme.grey6),
    );
  }
}
