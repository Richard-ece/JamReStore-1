import 'package:flutter/material.dart';
import 'package:jam_re_store/components/interaction_bar.dart';
import 'package:jam_re_store/components/post_user_header.dart';

class CardPost extends StatelessWidget {
  const CardPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PostUserHeader(),
          MultimediaContainer(),
          TitlePreview(),
          InteractionBar(),
        ],
      ),
    );
  }
}

class MultimediaContainer extends StatelessWidget {
  const MultimediaContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TitlePreview extends StatelessWidget {
  const TitlePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
