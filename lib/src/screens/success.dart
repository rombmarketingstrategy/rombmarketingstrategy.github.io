import 'package:flutter/material.dart';
import 'package:rombmarketingstrategy/src/screens/form.dart';
import 'package:rombmarketingstrategy/src/utils/app_navigator.dart';

class SuccessScreen extends StatelessWidget {
  void onClick(BuildContext context) {
    AppNavigator.off(context, () => FormScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
