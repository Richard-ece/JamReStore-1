import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class OtpForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller1 = useTextEditingController();
    final controller2 = useTextEditingController();
    final controller3 = useTextEditingController();
    final controller4 = useTextEditingController();
    final controller5 = useTextEditingController();
    final controller6 = useTextEditingController();

    final focusNode1 = useFocusNode();
    final focusNode2 = useFocusNode();
    final focusNode3 = useFocusNode();
    final focusNode4 = useFocusNode();
    final focusNode5 = useFocusNode();
    final focusNode6 = useFocusNode();

    void sendOtpCode() {
      context.read<AuthBloc>().add(
            ValidationCodeRequest(
              code: Code(
                  code: controller1.value.text +
                      controller2.value.text +
                      controller3.value.text +
                      controller4.value.text +
                      controller5.value.text +
                      controller6.value.text),
            ),
          );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InputOtp(
          controller: controller1,
          nextFocusNode: focusNode2,
          actualFocusNode: focusNode1,
          autofocus: true,
        ),
        InputOtp(
          controller: controller2,
          nextFocusNode: focusNode3,
          actualFocusNode: focusNode2,
        ),
        InputOtp(
          controller: controller3,
          nextFocusNode: focusNode4,
          actualFocusNode: focusNode3,
        ),
        InputOtp(
          controller: controller4,
          nextFocusNode: focusNode5,
          actualFocusNode: focusNode4,
        ),
        InputOtp(
          controller: controller5,
          nextFocusNode: focusNode6,
          actualFocusNode: focusNode5,
        ),
        InputOtp(
          controller: controller6,
          nextFocusNode: focusNode1,
          actualFocusNode: focusNode6,
          isUnfocus: true,
        ),
      ],
    );
  }
}

class InputOtp extends StatelessWidget {
  const InputOtp({
    Key? key,
    required this.controller,
    required this.nextFocusNode,
    required this.actualFocusNode,
    this.isUnfocus = false,
    this.autofocus = false,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode actualFocusNode;
  final FocusNode nextFocusNode;
  final bool isUnfocus;
  final bool autofocus;

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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorTheme.grey2),
            ),
            enabledBorder: OutlineInputBorder(
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
