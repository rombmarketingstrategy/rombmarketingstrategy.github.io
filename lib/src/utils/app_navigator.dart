import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static Future<dynamic> to(BuildContext context, ValueGetter<Widget> screenBuilder) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => screenBuilder(),
      ),
    );
  }

  static void offAll(BuildContext context, ValueGetter<Widget> screenBuilder, [RoutePredicate? predicate]) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) => screenBuilder(),
      ),
      predicate ?? (_) => false,
    );
  }

  static void off(BuildContext context, ValueGetter<Widget> screenBuilder) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => screenBuilder(),
      ),
    );
  }

  static void back(BuildContext context, [result]) {
    Navigator.of(context).pop(result);
  }
}
