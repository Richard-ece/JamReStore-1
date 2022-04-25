import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/bloc/auth/auth_state.dart';
import 'package:jam_re_store/components/buttons/button.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/models/error_input.dart';
import 'package:jam_re_store/routes/names.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jam_re_store/utils/constants/enums.dart';

class OtpForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller1 = useTextEditingController();
    final controller2 = useTextEditingController();
    final controller3 = useTextEditingController();
    final controller4 = useTextEditingController();
    final controller5 = useTextEditingController();
    final controller6 = useTextEditingController();

    final listen1 = useValueListenable(controller1);
    final listen2 = useValueListenable(controller2);
    final listen3 = useValueListenable(controller3);
    final listen4 = useValueListenable(controller4);
    final listen5 = useValueListenable(controller5);
    final listen6 = useValueListenable(controller6);

    final focusNode1 = useFocusNode();
    final focusNode2 = useFocusNode();
    final focusNode3 = useFocusNode();
    final focusNode4 = useFocusNode();
    final focusNode5 = useFocusNode();
    final focusNode6 = useFocusNode();

    var disabled = useState(true);

    useEffect(() {
      if (controller1.value.text.isNotEmpty &&
          controller2.value.text.isNotEmpty &&
          controller3.value.text.isNotEmpty &&
          controller4.value.text.isNotEmpty &&
          controller5.value.text.isNotEmpty &&
          controller6.value.text.isNotEmpty) {
        disabled.value = false;
      } else {
        disabled.value = true;
      }
      return null;
    }, [
      listen1,
      listen2,
      listen3,
      listen4,
      listen5,
      listen6,
    ]);

    void sendOtpCode() {
      context.read<AuthBloc>().add(
            ValidateCodeRequest(
              code: Code(
                  code: controller1.value.text +
                      controller2.value.text +
                      controller3.value.text +
                      controller4.value.text +
                      controller5.value.text +
                      controller6.value.text),
            ),
          );
      // Navigator.pushNamed(context, NamesRoutes.selectTopics);
    }

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputOtp(
                  controller: controller1,
                  errorInput: ErrorInput(
                    error: state.validateCodeRequestError?.error,
                    message: null,
                  ),
                  nextFocusNode: focusNode2,
                  actualFocusNode: focusNode1,
                  autofocus: true,
                ),
                InputOtp(
                  controller: controller2,
                  nextFocusNode: focusNode3,
                  actualFocusNode: focusNode2,
                  errorInput: ErrorInput(
                    error: state.validateCodeRequestError?.error,
                    message: null,
                  ),
                ),
                InputOtp(
                  controller: controller3,
                  nextFocusNode: focusNode4,
                  actualFocusNode: focusNode3,
                  errorInput: ErrorInput(
                    error: state.validateCodeRequestError?.error,
                    message: null,
                  ),
                ),
                InputOtp(
                  controller: controller4,
                  nextFocusNode: focusNode5,
                  actualFocusNode: focusNode4,
                  errorInput: ErrorInput(
                    error: state.validateCodeRequestError?.error,
                    message: null,
                  ),
                ),
                InputOtp(
                  controller: controller5,
                  nextFocusNode: focusNode6,
                  actualFocusNode: focusNode5,
                  errorInput: ErrorInput(
                    error: state.validateCodeRequestError?.error,
                    message: null,
                  ),
                ),
                InputOtp(
                  controller: controller6,
                  nextFocusNode: focusNode1,
                  actualFocusNode: focusNode6,
                  errorInput: ErrorInput(
                    error: state.validateCodeRequestError?.error,
                    message: null,
                  ),
                  isUnfocus: true,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 34),
              child: Button(
                labelText: AppLocalizations.of(context)!.continueButton,
                onPressed: sendOtpCode,
                disabled: disabled.value,
                loading:
                    state.validateCodeRequestStatus == RequestStatus.loading,
              ),
            ),
          ],
        );
      },
    );
  }
}

class InputOtp extends StatelessWidget {
  const InputOtp({
    Key? key,
    required this.controller,
    required this.nextFocusNode,
    required this.actualFocusNode,
    required this.errorInput,
    this.isUnfocus = false,
    this.autofocus = false,
  }) : super(key: key);

  final TextEditingController controller;
  final ErrorInput errorInput;
  final FocusNode actualFocusNode;
  final FocusNode nextFocusNode;
  final bool isUnfocus;
  final bool autofocus;

  Color getBorderColor(bool? error) {
    switch (error) {
      case null:
        return ColorTheme.grey2;

      case false:
        return ColorTheme.successGreen;

      case true:
        return ColorTheme.errorRed;

      default:
        return ColorTheme.grey2;
    }
  }

  void nextField(String value) {
    if (value.length != 1) return;
    if (isUnfocus) {
      actualFocusNode.unfocus();
      return;
    }
    nextFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 45, maxHeight: 60),
        child: TextFormField(
          obscureText: false,
          autofocus: autofocus,
          focusNode: actualFocusNode,
          style: TextStyleApp.bodyBase(ColorTheme.grey11),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: getBorderColor(errorInput.error),
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: ColorTheme.errorRed,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorTheme.grey2),
            ),
          ),
          onChanged: (value) {
            nextField(value);
          },
          controller: controller,
        ),
      ),
    );
  }
}
