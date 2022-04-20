import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/components/app_bar_simple.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/inputs/input.dart';
import 'package:jam_re_store/components/inputs/input_password.dart';
import 'package:jam_re_store/components/telling_icon.dart';
import 'package:jam_re_store/components/texts.dart';
import 'package:jam_re_store/styles/color_theme.dart';

class CreatePasswordPage extends HookWidget {
  const CreatePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _passwordController = useTextEditingController();
    final _confirmedpasswordController = useTextEditingController();
    return Scaffold(
      appBar: AppBarSimple(text: AppLocalizations.of(context)!.signUp),
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
              child: TitlePage(text: "Elige tu contraseña."),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SubTitlePage(
                  text:
                      "Deberá tener al menos 8 caracteres, una mayúscula y un número."),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 29),
              child:
                  InputCreatePassword(passwordController: _passwordController),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: InputConfirmedPassword(
                  confirmedpasswordController: _confirmedpasswordController),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ContinueButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class InputCreatePassword extends StatelessWidget {
  const InputCreatePassword({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return InputPassword(
      controller: _passwordController,
      labelText: 'Contraseña',
    );
  }
}

class InputConfirmedPassword extends StatelessWidget {
  const InputConfirmedPassword({
    Key? key,
    required TextEditingController confirmedpasswordController,
  })  : _confirmedpasswordController = confirmedpasswordController,
        super(key: key);

  final TextEditingController _confirmedpasswordController;

  @override
  Widget build(BuildContext context) {
    return Input(
      controller: _confirmedpasswordController,
      labelText: 'Confirmar contraseña',
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      labelText: 'Continuar',
      backgroudColor: ColorTheme.blue4,
    );
  }
}
