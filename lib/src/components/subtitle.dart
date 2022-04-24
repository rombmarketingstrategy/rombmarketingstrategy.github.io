import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rombmarketingstrategy/src/utils/paddings.dart';

class Subtitle extends StatelessWidget {
  final String textKey;
  const Subtitle(this.textKey);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: Paddings.a16,
      margin: Paddings.v16,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            colorScheme.primary,
            colorScheme.secondary,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 64),
        child: Text(
          tr('subtitles.$textKey').toUpperCase(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
