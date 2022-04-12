import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/dont_have_account_button.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/utils/constants/assets.dart';
import 'package:lottie/lottie.dart';

class Welcome2Page extends HookWidget {
  const Welcome2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signIn),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Lottie.asset(Assets.signInAnimation, width: 200),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Button(
              icon: Image.asset(
                Assets.googleIcon,
                scale: 15,
              ),
              labelText: 'Ingresa con Google',
              textColor: ColorTheme.textBlack,
              backgroudColor: ColorTheme.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Button(
              icon: Image.asset(
                Assets.facebookIcon,
                scale: 15,
              ),
              labelText: 'Ingresa con Apple',
              backgroudColor: ColorTheme.grey11,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Button(
              icon: Image.asset(
                Assets.facebookIcon,
                scale: 15,
              ),
              labelText: 'Ingresa con Facebook',
              backgroudColor: ColorTheme.facebook,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Button(
              icon: Image.asset(
                Assets.facebookIcon,
                scale: 15,
              ),
              labelText: 'Ingresa con Correo',
              backgroudColor: ColorTheme.blue,
            ),
          ),
          Spacer(),
          DontHaveAccountButton(),
        ],
      ),
    );
  }
}
