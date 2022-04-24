import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const _kColorBlack = Color(0xFF221F1F);
const _kColorWhite = Color(0xFFEDEDED);
const _kColorVeryWhite = Color(0xFFFFFFFF);
const _kColorOrange = Color(0xFFEF682C);
const _kColorYellow = Color(0xFFD08A17);

final kThemeData = ThemeData(
  colorScheme: const ColorScheme(
    primary: _kColorOrange,
    primaryVariant: _kColorYellow,
    onPrimary: _kColorVeryWhite,
    secondary: _kColorOrange,
    secondaryVariant: _kColorYellow,
    onSecondary: _kColorVeryWhite,
    surface: _kColorVeryWhite,
    onSurface: _kColorBlack,
    background: _kColorWhite,
    onBackground: _kColorBlack,
    error: Color(0xFFFE2C2C),
    onError: Color(0xFFFE2C2C),
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: _kColorWhite,
  fontFamily: 'Montserrat',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700, color: _kColorBlack),
    subtitle1: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600, color: _kColorWhite),
    bodyText1: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: _kColorBlack),
    overline: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, color: _kColorBlack),
    button: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, color: _kColorVeryWhite),
  ),
);
