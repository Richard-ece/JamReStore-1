import 'package:flutter/material.dart';
import 'package:jam_re_store/components/card_post/card_post.dart';
import 'package:jam_re_store/components/card_post/post_user_header.dart';
import 'package:jam_re_store/models/post/post.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class CardPostSmall extends StatelessWidget {
  CardPostSmall({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Column(
              children: [
                PostUserHeader(
                  post: post,
                ),
                TitlePreview(
                  post: post,
                ),
              ],
            ),
          ),
          MultimediaContainer(
            imagePost: post.imagePost,
          ),
        ],
      ),
    );
  }
}

class MultimediaContainer extends StatelessWidget {
  const MultimediaContainer({Key? key, required this.imagePost})
      : super(key: key);
  final String? imagePost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 14,
      ),
      child: Container(
        width: 109,
        height: 84,
        decoration: BoxDecoration(
          color: ColorTheme.grey2,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class TitlePreview extends StatelessWidget {
  const TitlePreview({Key? key, required this.post}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        Text(
          post.titlePost,
          style: TextStyleApp.headlinesS(ColorTheme.textBlack),
        ),
      ],
    );
  }
}
