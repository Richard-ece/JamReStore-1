import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jam_re_store/styles/color_theme.dart';

class AppTextTheme extends TextTheme {
  static final _baseTheme = GoogleFonts.nunitoSansTextTheme();
  static final _bodyTheme = GoogleFonts.merriweatherTextTheme();
  AppTextTheme()
      : super(
          headline1: _baseTheme.headline1?.copyWith(
              fontSize: 28.0,
              fontWeight: FontWeight.w800,
              color: ColorTheme.black),
          headline2: _baseTheme.headline2?.copyWith(
              fontSize: 24.0,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.96,
              color: ColorTheme.black),
          headline3: _baseTheme.headline3?.copyWith(
              fontSize: 18.0,
              fontWeight: FontWeight.w800,
              color: ColorTheme.text),
          headline4: _baseTheme.headline4?.copyWith(
              fontSize: 14.0,
              letterSpacing: 0.07,
              fontWeight: FontWeight.w700,
              color: ColorTheme.text),
          headline5: _baseTheme.headline5?.copyWith(
              fontSize: 19.0,
              fontWeight: FontWeight.w400,
              color: ColorTheme.grey),
          headline6: _baseTheme.headline6?.copyWith(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: ColorTheme.grey),
          //
          bodyText1: _bodyTheme.bodyText1?.copyWith(
            fontSize: 16.0,
            color: ColorTheme.black,
            fontWeight: FontWeight.w400,
            height: 1.7,
            letterSpacing: 0.08,
          ),
          bodyText2: _baseTheme.headline6?.copyWith(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: ColorTheme.grey),
          //
          caption: _baseTheme.caption?.copyWith(
              fontSize: 10.0,
              fontWeight: FontWeight.normal,
              color: ColorTheme.grey2),
          //
          subtitle1: _baseTheme.subtitle1?.copyWith(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.065,
              color: Colors.grey),
          subtitle2: _baseTheme.subtitle2?.copyWith(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.065,
              color: ColorTheme.text),
          //
          button: _baseTheme.button?.copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: ColorTheme.white),
          //
          overline: _baseTheme.overline,
        );
}
