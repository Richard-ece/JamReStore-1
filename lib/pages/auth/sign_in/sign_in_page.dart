import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/components/inputs/input.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/models/error_input.dart';
import 'package:jam_re_store/pages/auth/sign_in/components/dont_have_account_button.dart';
import 'package:jam_re_store/pages/auth/sign_in/components/facebook_sign_in_button.dart';
import 'package:jam_re_store/pages/auth/sign_in/components/google_sign_in_button.dart';
import 'package:jam_re_store/pages/auth/sign_in/components/or_divider.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/utils/constants/assets.dart';
import 'package:lottie/lottie.dart';

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
      Navigator.pushNamed(context, NamesRoutes.home);
    }

    void forgot() {
      Navigator.pushNamed(context, NamesRoutes.forgotpasswordEmail);
    }

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
              child: Input(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                labelText: AppLocalizations.of(context)!.email,
                suffixIcon: Icon(Icons.email_outlined),
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Input(
              labelText: AppLocalizations.of(context)!.password,
              suffixIcon: Icon(Icons.key_outlined),
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    Text("Recordarme"),
                  ],
                ),
                TextButton(
                  onPressed: forgot,
                  child: Text("¿Olvidaste la contraseña?"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                child: Text(AppLocalizations.of(context)!.signIn),
                onPressed: signIn,
              ),
            ),
          ),
          OrDivider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FacebookSignInButton(),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 8)),
                GoogleSignInButton(),
              ],
            ),
          ),
          Spacer(),
          DontHaveAccountButton(),
        ],
      ),
    );
  }
}
