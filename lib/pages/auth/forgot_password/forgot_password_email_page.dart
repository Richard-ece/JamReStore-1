import 'package:flutter/material.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jam_re_store/utils/constants/assets.dart';
import 'package:lottie/lottie.dart';

class forgotPasswordEmailPage extends StatelessWidget {
  const forgotPasswordEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void forgot() {
      Navigator.pushNamed(context, NamesRoutes.forgotPassword);
    }

    void cancelar() {
      Navigator.pushNamed(context, NamesRoutes.forgotPassword);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("¿Olvidaste tu contraseña?"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: (20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Lottie.asset(Assets.signInAnimation, width: 200),
                  ),
                  Padding(padding: const EdgeInsets.all(16.0)),
                  //SizedBox(height, 0.05),
                  Text(
                    "Recupera tu cuenta",
                  ),
                  Padding(padding: const EdgeInsets.all(16.0)),
                  //SizedBox(height, 0.05),
                  Text(
                    "Ingresa tu correo electrónico para buscar tu cuenta.",
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.email,
                        icon: Icon(Icons.email_outlined),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        child: Text("Buscar"),
                        onPressed: forgot,
                      ),
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
