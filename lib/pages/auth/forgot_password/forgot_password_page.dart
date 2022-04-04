import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/utils/constants/assets.dart';
import 'package:lottie/lottie.dart';

class forgotPasswordPage extends HookWidget {
  const forgotPasswordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void email() {
      Navigator.pushNamed(context, NamesRoutes.forgotpasswordEmail);
    }

    void phone() {
      Navigator.pushNamed(context, NamesRoutes.otpNumber);
    }

    void cancelar() {
      Navigator.pushNamed(context, NamesRoutes.signIn);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("¿Olvidaste tu contraseña?"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Lottie.asset(Assets.signInAnimation, width: 200),
          ),
          Padding(padding: const EdgeInsets.all(16.0)),
          Text("Recibirás un código de verificación"),
          Padding(padding: const EdgeInsets.all(10.0)),
          Text("Elige como quieres recibir el codigo"),
          Padding(padding: const EdgeInsets.all(32.0)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: (20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: email,
                          child: Text(AppLocalizations.of(context)!.email),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: phone,
                          child: Text(
                              AppLocalizations.of(context)!.otpNumberPhone),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        child: Text("Cancelar"),
                        onPressed: cancelar,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
