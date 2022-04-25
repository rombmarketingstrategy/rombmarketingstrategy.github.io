import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const _kColorBlack = Color(0xFF221F1F);
const _kColorWhite = Color(0xFFEDEDED);
const _kColorVeryWhite = Color(0xFFFFFFFF);
const _kColorOrange = Color(0xFFEF682C);
const _kColorYellow = Color(0xFFD08A17);
const _kColorRed = Color(0xFFFE2C2C);
final kThemeData = ThemeData(
  colorScheme: const ColorScheme(
    primary: _kColorOrange,
    onPrimary: _kColorVeryWhite,
    secondary: _kColorYellow,
    onSecondary: _kColorVeryWhite,
    surface: _kColorVeryWhite,
    onSurface: _kColorBlack,
    background: _kColorWhite,
    onBackground: _kColorBlack,
    error: _kColorRed,
    onError: _kColorRed,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: _kColorWhite,
  fontFamily: 'Montserrat',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700, color: _kColorBlack),
    subtitle1: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600, color: _kColorWhite),
    bodyText1: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: _kColorBlack),
    bodyText2: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: _kColorRed),
    overline: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, color: _kColorBlack),
    button: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, color: _kColorBlack),
  ),
);
