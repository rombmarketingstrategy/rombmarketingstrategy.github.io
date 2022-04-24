import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rombmarketingstrategy/src/screens/form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rombmarketingstrategy/src/utils/app_navigator.dart';
import 'package:rombmarketingstrategy/src/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const _redirectDelay = Duration(seconds: 4);

  @override
  void initState() {
    super.initState();
    Timer(
      _redirectDelay,
      () => AppNavigator.to(context, () => const FormScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          child: SvgPicture.asset(
            kPathLogo,
            width: 240.sp,
          ),
          tag: 'Logo',
        ),
      ),
    );
  }
}
