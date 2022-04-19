import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/components/inputs/input.dart';
import 'package:jam_re_store/models/error_input.dart';

class InputPassword extends HookWidget {
  const InputPassword({
    Key? key,
    required this.controller,
    required this.labelText,
    this.enabled = true,
    this.errorInput = const ErrorInput(error: null),
    this.hintText,
    this.focusNode,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool enabled;
  final ErrorInput errorInput;
  final FocusNode? focusNode;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    var obscureText = useState(true);
    var suffixIcon = useState<Widget?>(SizedBox.shrink());

    Widget? getWidgetSeePassword() {
      if (controller.value.text == "") return SizedBox.shrink();
      if (obscureText.value) return Icon(Icons.remove_red_eye_outlined);
      return Icon(Icons.remove_red_eye);
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
      errorInput: errorInput,
      hintText: hintText,
      suffixIcon: GestureDetector(
        child: suffixIcon.value,
        onTap: () {
          obscureText.value = !obscureText.value;
        },
      ),
    );
  }
}
