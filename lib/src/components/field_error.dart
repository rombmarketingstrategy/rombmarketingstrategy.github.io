import 'package:flutter/material.dart';
import 'package:rombmarketingstrategy/src/utils/paddings.dart';

class FieldError extends StatelessWidget {
  final String? error;
  const FieldError(this.error);

  @override
  Widget build(BuildContext context) {
    if (error == null) return const SizedBox();

    return Container(
      padding: Paddings.a8,
      alignment: Alignment.centerLeft,
      child: Text(
        error ?? '',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
