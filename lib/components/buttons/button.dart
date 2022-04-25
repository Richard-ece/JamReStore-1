import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class Button extends HookWidget {
  const Button({
    Key? key,
    required this.labelText,
    this.backgroudColor = ColorTheme.blue,
    this.onTapColor = ColorTheme.blue8,
    this.borderColor = Colors.transparent,
    this.textColor = ColorTheme.white,
    this.outline = false,
    this.disabled = false,
    this.icon,
    this.onPressed,
    this.loading = false,
  }) : super(key: key);

  final String labelText;
  final Widget? icon;
  final Color backgroudColor;
  final Color onTapColor;
  final Color borderColor;
  final Color textColor;
  final bool outline;
  final bool disabled;
  final bool loading;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var backgroundColorState = useState(backgroudColor);
    return GestureDetector(
      onTapDown: (_) {
        backgroundColorState.value = onTapColor;
      },
      onTapUp: (_) {
        backgroundColorState.value = backgroudColor;
      },
      onTapCancel: () {
        backgroundColorState.value = backgroudColor;
      },
      onTap: () {
        backgroundColorState.value = onTapColor;
      },
      onPanDown: (_) {
        backgroundColorState.value = onTapColor;
      },
      onPanEnd: (_) {
        backgroundColorState.value = backgroudColor;
      },
      onPanCancel: () {
        backgroundColorState.value = backgroudColor;
      },
      child: ElevatedButton(
        //TODO: Hacer que se deshabilite cuando este loading pero que no cambie el color
        onPressed: disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          minimumSize: Size(double.infinity, 58),
          primary: outline ? Colors.transparent : backgroundColorState.value,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.0),
              side: BorderSide(color: borderColor)),
        ),
        child: Container(
          constraints: BoxConstraints(maxHeight: 52),
          child: !loading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    icon ?? Container(),
                    Text(
                      labelText,
                      style: TextStyleApp.labelS(textColor),
                    ),
                    Container()
                  ],
                )
              : Container(
                  constraints: BoxConstraints(maxHeight: 22, maxWidth: 22),
                  child: CircularProgressIndicator(
                    color: ColorTheme.white,
                    strokeWidth: 3,
                  ),
                ),
        ),
      ),
    );
  }
}
