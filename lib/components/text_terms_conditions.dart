import 'package:flutter/material.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class TextTermsAndConditions extends StatelessWidget {
  const TextTermsAndConditions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Al registrarte, aceptas los Términos de Uso, la Política de Privacidad y la Política de Cookies de Telling.",
        style: TextStyleApp.bodyXs(ColorTheme.grey7),
        textAlign: TextAlign.center,
      ),
    );
  }
}
