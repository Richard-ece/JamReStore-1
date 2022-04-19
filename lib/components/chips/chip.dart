import 'package:flutter/material.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class TagChip extends StatelessWidget {
  const TagChip(
    this.text, {
    Key? key,
    this.onTap,
    this.selected = false,
    this.selectedColor,
    required this.backgroudColor,
    required this.labelText,
    this.textColor = ColorTheme.grey11,
    this.busy = false,
  }) : super(key: key);

  final String text;
  final bool selected;
  final void Function()? onTap;

  final Color? selectedColor;
  final Color textColor;
  final bool busy;
  final Color backgroudColor;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ElevatedButton(
        onPressed: () {
          if (!busy && onTap != null) {
            onTap!();
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: selected ? backgroudColor : ColorTheme.grey8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                labelText,
                style: TextStyleApp.labelS(textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TagChipStatus {
  String id;
  String name;
  bool selected;

  TagChipStatus({
    required this.id,
    this.name = "",
    this.selected = false,
  });
}
