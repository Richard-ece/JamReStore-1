import 'package:flutter/material.dart';
import 'package:jam_re_store/components/card_post/interaction_bar.dart';
import 'package:jam_re_store/components/card_post/post_user_header.dart';
import 'package:jam_re_store/models/post/post.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

class CardPost extends StatelessWidget {
  const CardPost({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PostUserHeader(
            post: post,
          ),
          MultimediaContainer(
            imagePost: post.imagePost,
          ),
          TitlePreview(
            post: post,
          ),
          InteractionBar(
            post: post,
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
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: ColorTheme.grey2,
          borderRadius: BorderRadius.circular(10),
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Column(
        children: [
          Text(
            post.titlePost,
            style: TextStyleApp.headlinesBase(ColorTheme.textBlack),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              post.subTitlePost,
              style: TextStyleApp.bodyBase(ColorTheme.grey),
            ),
          )
        ],
      ),
    );
  }
}
