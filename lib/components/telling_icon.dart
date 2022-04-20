import 'package:flutter/material.dart';
import 'package:jam_re_store/utils/constants/assets.dart';

class TellingIcon extends StatelessWidget {
  const TellingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.tellinBlue,
      width: 36,
    );
  }
}
