import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/components/app_bar_simple.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/inputs/input.dart';
import 'package:jam_re_store/components/telling_icon.dart';
import 'package:jam_re_store/components/texts.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/components/dont_have_account_button.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/styles/color_theme.dart';

class SignInMailPage extends HookWidget {
  const SignInMailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();

    void signIn() {
      context.read<AuthBloc>().add(
            SignInRequest(
              userSignIn: UserSignIn(
                password: _passwordController.value.text,
                email: _emailController.value.text,
              ),
            ),
          );
      Navigator.pushNamed(context, NamesRoutes.otpNumber);
    }

    return Scaffold(
      appBar: AppBarSimple(
        text: AppLocalizations.of(context)!.signIn,
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
              child: TitlePage(text: "Bienvenido de vuelta a Telling."),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SubTitlePage(
                  text:
                      "Inicia sesion con tu usuario o email, y tu contraseña."),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 29),
              child: InputEmailOrUser(emailController: _emailController),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: InputPassword(passwordController: _passwordController),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: ContinueButton(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 34),
              child: DontHaveAccountButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class InputEmailOrUser extends StatelessWidget {
  const InputEmailOrUser({
    Key? key,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Input(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      labelText: AppLocalizations.of(context)!.email,
    );
  }
}

class InputPassword extends StatelessWidget {
  const InputPassword({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Input(
      controller: _passwordController,
      keyboardType: TextInputType.emailAddress,
      labelText: AppLocalizations.of(context)!.email,
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
      backgroudColor: ColorTheme.blue,
      onPressed: () {
        Navigator.pushNamed(context, NamesRoutes.home);
      },
    );
  }
}
