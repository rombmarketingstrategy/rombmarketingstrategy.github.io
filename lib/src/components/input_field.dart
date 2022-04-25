import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rombmarketingstrategy/src/utils/paddings.dart';
import 'package:rombmarketingstrategy/src/utils/spacers.dart';

class InputField extends StatelessWidget {
  final String textKey;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  const InputField({required this.textKey, required this.controller, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.a16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacers.h8,
          Text(
            tr('fields.$textKey'),
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Spacers.h8,
          TextField(
            style: Theme.of(context).textTheme.overline,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              contentPadding: Paddings.h16,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(200.0),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
            ),
          ),
          Spacers.h8,
        ],
      ),
    );
  }
}
