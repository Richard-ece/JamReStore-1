import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/components/inputs/input.dart';
import 'package:jam_re_store/models/error_input.dart';
import 'package:jam_re_store/styles/custom_icons.dart';

class InputPassword extends HookWidget {
  const InputPassword({
    Key? key,
    required this.controller,
    required this.labelText,
    this.enabled = true,
    this.errorInput = const ErrorInput(error: null),
    this.hintText,
    this.loading = false,
    this.focusNode,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool enabled;
  final bool loading;
  final ErrorInput errorInput;
  final FocusNode? focusNode;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    var obscureText = useState(true);
    var suffixIcon = useState<IconData?>(null);

    IconData? getWidgetSeePassword() {
      if (controller.value.text == "") return null;
      if (obscureText.value) return CustomIcons.eye_closed;
      return CustomIcons.eye_open;
    }

    useEffect(() {
      suffixIcon.value = getWidgetSeePassword();
      return null;
    }, [obscureText.value]);

    useEffect(() {
      void onControllerChange() {
        suffixIcon.value = getWidgetSeePassword();
      }

      controller.addListener(onControllerChange);
      return () => controller.removeListener(onControllerChange);
    }, [controller]);

    return Input(
      controller: controller,
      labelText: labelText,
      obscureText: obscureText.value,
      keyboardType: TextInputType.visiblePassword,
      enabled: enabled,
      focusNode: focusNode,
      loading: loading,
      errorInput: errorInput,
      hintText: hintText,
      onTapIcon: () {
        obscureText.value = !obscureText.value;
      },
      suffixIcon: suffixIcon.value,
    );
  }
}
