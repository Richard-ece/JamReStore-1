import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/bloc/auth/auth_bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/styles/color_theme.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
    borderSide: BorderSide(color: ColorTheme.blue),
  );
}

class OtpForm extends HookWidget {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _codeController1 = useTextEditingController();
    final _codeController2 = useTextEditingController();
    final _codeController3 = useTextEditingController();
    final _codeController4 = useTextEditingController();
    final _codeController5 = useTextEditingController();
    final _codeController6 = useTextEditingController();

    final pin2FocusNode = useFocusNode();
    final pin3FocusNode = useFocusNode();
    final pin4FocusNode = useFocusNode();
    final pin5FocusNode = useFocusNode();
    final pin6FocusNode = useFocusNode();

    void otpCode() {
      print(_codeController1.value.text +
          _codeController2.value.text +
          _codeController3.value.text +
          _codeController4.value.text +
          _codeController5.value.text +
          _codeController6.value.text);
      context.read<AuthBloc>().add(
            ValidationCodeRequest(
              code: Code(
                  code: _codeController1.value.text +
                      _codeController2.value.text +
                      _codeController3.value.text +
                      _codeController4.value.text +
                      _codeController5.value.text +
                      _codeController6.value.text),
            ),
          );
    }

    SizeConfig().init(context);
    return Column(
      children: [
        Form(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InputOtp(
                controller: _codeController1,
                focusNode: pin2FocusNode,
              ),
              InputOtp(
                controller: _codeController2,
                focusNode: pin3FocusNode,
              ),
              InputOtp(
                controller: _codeController3,
                focusNode: pin4FocusNode,
              ),
              InputOtp(
                controller: _codeController4,
                focusNode: pin5FocusNode,
              ),
              InputOtp(
                controller: _codeController5,
                focusNode: pin6FocusNode,
              ),
              InputOtp(
                controller: _codeController6,
                focusNode: null,
                isUnfocus: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InputOtp extends StatelessWidget {
  const InputOtp(
      {Key? key,
      required this.controller,
      this.focusNode,
      this.isUnfocus = false})
      : super(key: key);
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool isUnfocus;

  void nextField(String value, FocusNode? focusNode) {
    print("Next field");
    if (value.length == 1) {
      print("Next field 2");

      if (isUnfocus) {
        print("Next field 3");

        focusNode!.unfocus();
      } else {
        print("Next field 4");

        focusNode!.requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        constraints: BoxConstraints(maxWidth: 51.33),
        height: 60,
        child: TextFormField(
          autofocus: true,
          obscureText: true,
          style: TextStyle(fontSize: 24),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: otpInputDecoration,
          onChanged: (value) {
            nextField(value, focusNode);
          },
          controller: controller,
        ),
      ),
    );
  }
}
