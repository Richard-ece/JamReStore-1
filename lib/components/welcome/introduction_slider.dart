import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jam_re_store/components/welcome/footer_auth.dart';
import 'package:lottie/lottie.dart';

class IntroductionSlider extends StatelessWidget {
  const IntroductionSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: AppLocalizations.of(context)!.welcomeTittleOne,
          body: AppLocalizations.of(context)!.welcomeDescriptionOne,
          image: Center(
            child: Lottie.asset(
                "assets/94323-jaroob-app-onboarding-animation.json"),
          ),
        ),
        PageViewModel(
          title: AppLocalizations.of(context)!.welcomeTittleTwo,
          body: AppLocalizations.of(context)!.welcomeDescriptionTwo,
          image: Center(
            child: Lottie.asset("assets/86590-growing-plant.json"),
          ),
        ),
        PageViewModel(
          title: AppLocalizations.of(context)!.welcomeTittleThree,
          body: AppLocalizations.of(context)!.welcomeDescriptionThree,
          image: Center(
            child: Lottie.asset("assets/88958-shopping-green.json"),
          ),
        ),
      ],
      showSkipButton: false,
      showDoneButton: false,
      showNextButton: true,
      next: Text(AppLocalizations.of(context)!.next),
      globalFooter: const FooterAuth(),
    );
  }
}
