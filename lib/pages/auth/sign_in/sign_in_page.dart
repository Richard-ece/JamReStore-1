import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/inputs/input.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/components/dont_have_account_button.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';
import 'package:jam_re_store/utils/constants/assets.dart';

class SignInPage extends HookWidget {
  const SignInPage({Key? key}) : super(key: key);

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
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signIn),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TellingIcon(),
            TextWelcome(),
            TextIntroduction(),
            InputEmailOrUser(
              emailController: _emailController,
            ),
            InputPassword(passwordController: _passwordController),
            ContinueButton(),
            DontHaveAccountButton(),
          ],
        ),
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
        Assets.tellinBlack,
        width: 36,
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

class InputEmailOrUser extends StatelessWidget {
  const InputEmailOrUser({
    Key? key,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Input(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          labelText: AppLocalizations.of(context)!.email,
        ));
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
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Input(
          controller: _passwordController,
          keyboardType: TextInputType.emailAddress,
          labelText: AppLocalizations.of(context)!.email,
        ));
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
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
        labelText: 'Continuar',
        backgroudColor: ColorTheme.blue,
      ),
    );
  }
}
