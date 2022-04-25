import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/bloc/auth/auth_state.dart';
import 'package:jam_re_store/components/app_bar_simple.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/components/have_account_button.dart';
import 'package:jam_re_store/components/inputs/input.dart';
import 'package:jam_re_store/components/telling_icon.dart';
import 'package:jam_re_store/components/text_terms_conditions.dart';
import 'package:jam_re_store/components/texts.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';
import 'package:jam_re_store/utils/constants/enums.dart';
import 'package:jam_re_store/utils/helpers/cool_functions.dart';

class SignUpMailPage extends HookWidget {
  const SignUpMailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameController = useTextEditingController();
    final _emailController = useTextEditingController();
    final _namelisten = useValueListenable(_nameController);
    final _emailListen = useValueListenable(_emailController);

    var disabled = useState(true);

    useEffect(() {
      if (_emailController.value.text.isNotEmpty &&
          _nameController.value.text.isNotEmpty) {
        disabled.value = false;
      } else {
        disabled.value = true;
      }
      return null;
    }, [_emailListen, _namelisten]);

    void signUp() {
      context.read<AuthBloc>().add(
            SignUpRequest(
              userSignUp: UserSignUp(
                email: _emailController.value.text,
                name: _nameController.value.text,
              ),
            ),
          );
      // Navigator.pushNamed(context, NamesRoutes.otpNumber);
    }

    return Scaffold(
      appBar: AppBarSimple(text: AppLocalizations.of(context)!.signUp),
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
                      text: AppLocalizations.of(context)!.signUpTittle),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: SubTitlePage(
                      text: AppLocalizations.of(context)!.signUpDescription),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 53),
                  child: Input(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    labelText: AppLocalizations.of(context)!.nameComplete,
                    loading: state.signUpRequestStatus == RequestStatus.loading,
                    errorInput: getErrorInputComplete(
                      "name",
                      state.signUpRequestError?.errors,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 29),
                  child: Input(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    labelText: AppLocalizations.of(context)!.email,
                    loading: state.signUpRequestStatus == RequestStatus.loading,
                    errorInput: getErrorInputComplete(
                      "email",
                      state.signUpRequestError?.errors,
                    ),
                  ),
                ),
                //TODO: Este texto debe ir dentro del input (heplerText)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    AppLocalizations.of(context)!.signUpText,
                    style: TextStyleApp.bodyXs(ColorTheme.grey6),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Button(
                    labelText: AppLocalizations.of(context)!.continueButton,
                    onPressed: signUp,
                    disabled: disabled.value,
                    loading: state.signUpRequestStatus == RequestStatus.loading,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 34),
                  child: HaveAccountButton(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22, top: 26),
                  child: TextTermsAndConditions(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
