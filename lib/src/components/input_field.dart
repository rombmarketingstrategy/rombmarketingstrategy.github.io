import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rombmarketingstrategy/src/utils/paddings.dart';
import 'package:rombmarketingstrategy/src/utils/spacers.dart';

class InputField extends StatelessWidget {
  final String textKey;
  final String? error;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  const InputField({required this.textKey, this.error, required this.controller, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: Paddings.a16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacers.h8,
          Text(
            tr('fields.$textKey'),
            style: textTheme.bodyText1,
          ),
          Spacers.h8,
          TextField(
            style: textTheme.overline,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              errorText: error,
              errorStyle: textTheme.bodyText2,
              filled: true,
              fillColor: colorScheme.surface,
              contentPadding: Paddings.h16,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(200.0),
                borderSide: BorderSide(
                  width: error == null ? 0 : 2,
                  style: error == null ? BorderStyle.none : BorderStyle.solid,
                ),
              ),
              // errorBorder:colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}
