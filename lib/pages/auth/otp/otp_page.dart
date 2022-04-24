import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/components/app_bar_simple.dart';
import 'package:jam_re_store/components/telling_icon.dart';
import 'package:jam_re_store/components/texts.dart';
import 'package:jam_re_store/pages/auth/otp/components/otp_form.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpPage extends HookWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<AuthBloc>().add(SendCodeRequest());
    }, []);

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
              child: TitlePage(text: "Revisa tu correo"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SubTitlePage(
                  text:
                      "Te enviamos un código a tu correo, ingresalo debajo para verificar tu email."),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 29),
              child: OtpForm(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 34),
              child: ReSendCode(),
            ),
          ],
        ),
      ),
    );
  }
}

class ReSendCode extends StatelessWidget {
  const ReSendCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // OTP code resend
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "¿No recibiste ningún código?",
              style: TextStyleApp.labelS(ColorTheme.textBlack),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Volver a enviar',
              style: TextStyleApp.labelS(ColorTheme.blue),
            ),
          ),
        ],
      ),
    );
  }
}
