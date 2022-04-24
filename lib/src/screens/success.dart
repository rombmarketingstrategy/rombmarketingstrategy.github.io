import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rombmarketingstrategy/src/components/button.dart';
import 'package:rombmarketingstrategy/src/screens/form.dart';
import 'package:rombmarketingstrategy/src/utils/app_navigator.dart';
import 'package:rombmarketingstrategy/src/utils/constants.dart';
import 'package:rombmarketingstrategy/src/utils/spacers.dart';

class SuccessScreen extends StatefulWidget {
  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  Timer? timer;
  int timerValue = 30;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() => timerValue--);
      if (timerValue <= 0) onDone(context);
    });
  }

  void onDone(BuildContext context) {
    timer?.cancel();
    AppNavigator.off(context, () => FormScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacers.expanded,
            LottieBuilder.asset(
              kPathAnimationsSuccess,
              width: 240.sp,
              height: 240.sp,
              repeat: false,
            ),
            Text(
              tr('thank_you'),
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            Spacers.expanded,
            AnimatedOpacity(
              opacity: timerValue > 10 ? 0 : 1,
              duration: const Duration(milliseconds: 400),
              child: Text('${tr('automatic_return')} $timerValue'),
            ),
            Button(text: '${tr('return')}', onClick: () => onDone(context)),
          ],
        ),
      ),
    );
  }
}
