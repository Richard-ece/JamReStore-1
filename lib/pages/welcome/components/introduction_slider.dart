import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jam_re_store/pages/welcome/components/footer_auth.dart';
import 'package:jam_re_store/utils/constants/assets.dart';
import 'package:lottie/lottie.dart';

class IntroductionSlider extends StatelessWidget {
  const IntroductionSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: AppLocalizations.of(context)!.welcomeTittleOne,
            body: AppLocalizations.of(context)!.welcomeDescriptionOne,
            image: Center(
              child: Lottie.asset(Assets.welcomeAnimationOne),
            ),
          ),
          PageViewModel(
            title: AppLocalizations.of(context)!.welcomeTittleTwo,
            body: AppLocalizations.of(context)!.welcomeDescriptionTwo,
            image: Center(
              child: Lottie.asset(Assets.welcomeAnimationTwo),
            ),
          ),
          PageViewModel(
            title: AppLocalizations.of(context)!.welcomeTittleThree,
            body: AppLocalizations.of(context)!.welcomeDescriptionThree,
            image: Center(
              child: Lottie.asset(Assets.welcomeAnimationThree),
            ),
          ),
        ],
        dotsDecorator: DotsDecorator(
          activeColor: Theme.of(context).primaryColor,
        ),
        showSkipButton: false,
        showDoneButton: false,
        showNextButton: true,
        next: Text(AppLocalizations.of(context)!.next),
        globalFooter: const FooterAuth(),
      ),
    );
  }
}
