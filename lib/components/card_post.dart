import 'package:flutter/material.dart';
import 'package:jam_re_store/components/interaction_bar.dart';
import 'package:jam_re_store/components/post_user_header.dart';
import 'package:jam_re_store/styles/color_theme.dart';
import 'package:jam_re_store/styles/text_styles_app.dart';

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
  const TitlePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Column(
        children: [
          Text(
            'Esta es la vista previa del titulo de un post que tiene 3 lineas, la cual no contiene subtitulo',
            style: TextStyleApp.headlinesBase(ColorTheme.textBlack),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Es una medida tomada por el ministerio de seguridad y eventos naturales, para evitar cualquier accidente que damnifique a los tripulantes y a la carga, que proviene...',
              style: TextStyleApp.bodyBase(ColorTheme.grey),
            ),
          )
        ],
      ),
    );
  }
}
