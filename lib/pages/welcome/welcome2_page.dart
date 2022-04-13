import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/dont_have_account_button.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';
import 'package:jam_re_store/utils/constants/assets.dart';

class Welcome2Page extends HookWidget {
  const Welcome2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(AppLocalizations.of(context)!.signIn),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TellingIcon(),
            TextWelcome(),
            TextIntroduction(),
            ButtonGoogle(),
            ButtonApple(),
            ButtonFacebook(),
            ButtonSignInEmail(),
            Padding(
              padding: const EdgeInsets.only(bottom: 26),
              child: DontHaveAccountButton(),
            ),
            TextTermsAndConditions(),
          ],
        ),
      ),
    );
  }
}

class TextIntroduction extends StatelessWidget {
  const TextIntroduction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 32, 0),
      child: Text(
        "Inicia sesion con tu usuario o email, y tu contraseña.",
        style: TextStyleApp.bodyBase(ColorTheme.grey6),
      ),
    );
  }
}

class TextWelcome extends StatelessWidget {
  const TextWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 4),
      child: Text(
        "Bienvenido de vuelta a Telling.",
        style: TextStyleApp.labelXl(ColorTheme.grey11),
      ),
    );
  }
}

class TellingIcon extends StatelessWidget {
  const TellingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 61, 18, 16),
      child: Image.asset(
        Assets.tellinIcon,
        width: 36,
      ),
      // Lottie.asset(Assets.tellinIcon, width: 2),
    );
  }
}

class TextTermsAndConditions extends StatelessWidget {
  const TextTermsAndConditions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Center(
        child: Text(
          "Al registrarte, aceptas los Términos de Uso, la Política de Privacidad y la Política de Cookies de Telling.",
          style: TextStyleApp.bodyXs(ColorTheme.grey7),
          textAlign: TextAlign.center,
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
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 16,
        right: 16,
        bottom: 20,
      ),
      child: Button(
        icon: Image.asset(
          Assets.facebookIcon,
          scale: 15,
        ),
        labelText: 'Ingresa con Correo',
        backgroudColor: ColorTheme.blue,
      ),
    );
  }
}

class ButtonFacebook extends StatelessWidget {
  const ButtonFacebook({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Button(
        icon: Image.asset(
          Assets.facebookIcon,
          scale: 15,
        ),
        labelText: 'Ingresa con Facebook',
        backgroudColor: ColorTheme.facebook,
      ),
    );
  }
}

class ButtonApple extends StatelessWidget {
  const ButtonApple({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Button(
        icon: Image.asset(
          Assets.facebookIcon,
          scale: 15,
        ),
        labelText: 'Ingresa con Apple',
        backgroudColor: ColorTheme.grey11,
      ),
    );
  }
}

class ButtonGoogle extends StatelessWidget {
  const ButtonGoogle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, left: 16, right: 16),
      child: Button(
        icon: Image.asset(
          Assets.googleIcon,
          scale: 15,
        ),
        labelText: 'Ingresa con Google',
        textColor: ColorTheme.textBlack,
        backgroudColor: ColorTheme.white,
      ),
    );
  }
}
