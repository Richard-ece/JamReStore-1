import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/components/app_bar_simple.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/have_account_button.dart';
import 'package:jam_re_store/components/telling_icon.dart';
import 'package:jam_re_store/components/text_terms_conditions.dart';
import 'package:jam_re_store/components/texts.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/utils/constants/assets.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSimple(
        text: AppLocalizations.of(context)!.signUp,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 61),
              child: TellingIcon(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TitlePage(text: "Únete a Telling."),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SubTitlePage(
                  text:
                      "Lee y escribe contenido de calidad, crea una comunidad y obten ganancias con tu audiencia."),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 4, right: 4),
              child: ButtonGoogle(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 4, right: 4),
              child: ButtonApple(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 4, right: 4),
              child: ButtonFacebook(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 4, right: 4),
              child: ButtonSignInEmail(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: HaveAccountButton(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26),
              child: TextTermsAndConditions(),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonSignInEmail extends StatelessWidget {
  const ButtonSignInEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      icon: Icon(Icons.mail_outline),
      labelText: 'Registrarse con Correo',
      backgroudColor: ColorTheme.blue,
      onPressed: () {
        Navigator.pushNamed(context, NamesRoutes.signUpMail);
      },
    );
  }
}

class ButtonFacebook extends StatelessWidget {
  const ButtonFacebook({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      icon: Icon(Icons.facebook),
      labelText: 'Registrarse con Facebook',
      backgroudColor: ColorTheme.facebook,
      onPressed: () {
        Navigator.pushNamed(context, NamesRoutes.selectTopics);
      },
    );
  }
}

class ButtonApple extends StatelessWidget {
  const ButtonApple({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      icon: Icon(Icons.apple),
      labelText: 'Registrarse con Apple',
      backgroudColor: ColorTheme.grey11,
      onPressed: () {
        Navigator.pushNamed(context, NamesRoutes.selectTopics);
      },
    );
  }
}

class ButtonGoogle extends StatelessWidget {
  const ButtonGoogle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      icon: Image.asset(
        Assets.googleIcon,
        scale: 1,
      ),
      labelText: 'Registrarse con Google',
      textColor: ColorTheme.textBlack,
      outline: true,
      borderColor: ColorTheme.grey2,
      onPressed: () {
        Navigator.pushNamed(context, NamesRoutes.selectTopics);
      },
    );
  }
}
