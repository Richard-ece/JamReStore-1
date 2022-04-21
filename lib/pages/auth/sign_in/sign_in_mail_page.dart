import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/bloc/auth/auth_state.dart';
import 'package:jam_re_store/components/app_bar_simple.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/inputs/input.dart';
import 'package:jam_re_store/components/telling_icon.dart';
import 'package:jam_re_store/components/texts.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/components/dont_have_account_button.dart';
import 'package:jam_re_store/models/error_input.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/components/inputs/input_password.dart';
import 'package:jam_re_store/utils/helpers/cool_functions.dart';

class SignInMailPage extends HookWidget {
  const SignInMailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();
    final _passwordListen = useValueListenable(_passwordController);
    final _emailListen = useValueListenable(_emailController);

    var disabled = useState(true);

    useEffect(() {
      if (_emailController.value.text.isNotEmpty &&
          _passwordController.value.text.isNotEmpty) {
        disabled.value = false;
      } else {
        disabled.value = true;
      }
      return null;
    }, [_emailListen, _passwordListen]);

    void signIn() {
      context.read<AuthBloc>().add(
            SignInRequest(
              userSignIn: UserSignIn(
                password: _passwordController.value.text,
                email: _emailController.value.text,
              ),
            ),
          );
      // Navigator.pushNamed(context, NamesRoutes.home);
    }

    return Scaffold(
      appBar: AppBarSimple(
        text: AppLocalizations.of(context)!.signIn,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
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
                  child: TitlePage(
                      text: AppLocalizations.of(context)!.signInTittle),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: SubTitlePage(
                      text: AppLocalizations.of(context)!.signInDescription),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 29),
                  child: InputEmailOrUser(
                    controller: _emailController,
                    errorInput: ErrorInput(
                      error: getErrorInput(
                          "email", state.signInRequestError?.errors),
                      message: getMessageErrorInput(
                          "email", state.signInRequestError?.errors),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: InputPasswordSignIn(
                    controller: _passwordController,
                    errorInput: ErrorInput(
                      error: getErrorInput(
                          "password", state.signInRequestError?.errors),
                      message: getMessageErrorInput(
                          "password", state.signInRequestError?.errors),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: ContinueButton(
                    disabled: disabled.value,
                    onPressed: signIn,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 34),
                  child: DontHaveAccountButton(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class InputEmailOrUser extends StatelessWidget {
  const InputEmailOrUser({
    Key? key,
    required this.controller,
    required this.errorInput,
  }) : super(key: key);

  final TextEditingController controller;
  final ErrorInput errorInput;

  @override
  Widget build(BuildContext context) {
    return Input(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      labelText: AppLocalizations.of(context)!.email,
      errorInput: errorInput,
    );
  }
}

class InputPasswordSignIn extends StatelessWidget {
  const InputPasswordSignIn({
    Key? key,
    required this.controller,
    required this.errorInput,
  }) : super(key: key);

  final TextEditingController controller;
  final ErrorInput errorInput;

  @override
  Widget build(BuildContext context) {
    return InputPassword(
      controller: controller,
      labelText: AppLocalizations.of(context)!.password,
      errorInput: errorInput,
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
    required this.onPressed,
    required this.disabled,
  }) : super(key: key);

  final void Function() onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Button(
      labelText: AppLocalizations.of(context)!.continueButton,
      backgroudColor: ColorTheme.blue,
      onPressed: onPressed,
      disabled: disabled,
    );
  }
}
