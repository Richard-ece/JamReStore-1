import 'package:flutter/material.dart';
import 'package:jam_re_store/pages/auth/otp/components/otp_form.dart';
import 'package:jam_re_store/pages/welcome/welcome2_page.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../sign_up/create_password_page.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(AppLocalizations.of(context)!.signUp),
        ),
      ),
      body: Container(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: (18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TellingIcon(),
                TextIntroduction(),
                TextIntroduction2(),
                //SizedBox(height, 0.05),
                OtpForm(),
                ContinueButton(),
                SizedBox(height: 0.1),
                GestureDetector(
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
                        child: Text('Volver a enviar'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
        "Revisa tu correo",
        style: TextStyleApp.labelXl(ColorTheme.textBlack),
      ),
    );
  }
}

class TextIntroduction2 extends StatelessWidget {
  const TextIntroduction2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 32, 0),
      child: Text(
        "Te enviamos un código a tu correo, ingresalo debajo para verificar tu email.",
        style: TextStyleApp.bodyBase(ColorTheme.grey6),
      ),
    );
  }
}
