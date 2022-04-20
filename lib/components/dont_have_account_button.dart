import 'package:flutter/material.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class DontHaveAccountButton extends StatelessWidget {
  const DontHaveAccountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppLocalizations.of(context)!.dontHaveAccount,
          style: TextStyleApp.labelS(ColorTheme.grey11),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, NamesRoutes.signUp);
          },
          child: Text(AppLocalizations.of(context)!.signUp),
        ),
      ],
    );
  }
}
