import 'package:flutter/material.dart';
import 'package:jam_re_store/components/welcome/introduction_slider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroductionSlider(),
    );
  }
}
