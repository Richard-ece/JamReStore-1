import 'package:flutter/material.dart';
import 'package:jam_re_store/components/welcome/introduction_slider.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroductionSlider(),
    );
  }
}
