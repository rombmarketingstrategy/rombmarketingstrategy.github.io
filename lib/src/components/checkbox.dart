import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rombmarketingstrategy/src/utils/custom_controller.dart';
import 'package:rombmarketingstrategy/src/utils/paddings.dart';
import 'package:rombmarketingstrategy/src/utils/spacers.dart';

class CheckBox extends StatefulWidget {
  final String textKey;
  final CustomController<bool> controller;
  const CheckBox({required this.textKey, required this.controller});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.controller.value ?? false;
  }

  void toggleCheck() {
    widget.controller.value = !isChecked;
    setState(() => isChecked = !isChecked);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: Paddings.a16,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: toggleCheck,
            borderRadius: BorderRadius.circular(200.0),
            child: Ink(
              padding: Paddings.a4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200.0),
                color: colorScheme.surface,
                border: Border.all(color: colorScheme.primary),
              ),
              child: Icon(
                Icons.check,
                color: isChecked ? colorScheme.primary : colorScheme.surface,
                size: 40,
              ),
            ),
          ),
          Spacers.w8,
          Expanded(
            child: Text(
              tr('checkboxes.${widget.textKey}'),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
