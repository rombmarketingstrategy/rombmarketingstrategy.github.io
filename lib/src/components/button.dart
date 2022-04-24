import 'package:flutter/material.dart';
import 'package:rombmarketingstrategy/src/utils/paddings.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  const Button({required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: Paddings.a16,
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(200.0),
        child: Ink(
          padding: Paddings.a16,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200.0),
            color: colorScheme.surface,
            border: Border.all(color: colorScheme.primary),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.button,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
