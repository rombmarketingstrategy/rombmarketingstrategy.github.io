import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rombmarketingstrategy/src/components/field_error.dart';
import 'package:rombmarketingstrategy/src/utils/custom_controller.dart';
import 'package:rombmarketingstrategy/src/utils/paddings.dart';
import 'package:rombmarketingstrategy/src/utils/spacers.dart';

class DatePicker extends StatefulWidget {
  final CustomController<String> controller;
  final String? error;
  const DatePicker({required this.controller, this.error});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;
  @override
  void initState() {
    super.initState();
    if (widget.controller.value != null) selectedDate = DateTime.parse(widget.controller.value!);
  }

  Future<void> onDateClick() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked == null) return;
    setState(() => selectedDate = picked);
    widget.controller.value = picked.toString();
  }

  String get dateStr {
    if (selectedDate == null) return '';
    return '${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.a16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacers.h8,
          Text(
            tr('fields.birthday'),
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Spacers.h8,
          InkWell(
            onTap: onDateClick,
            borderRadius: BorderRadius.circular(200.0),
            child: Ink(
              padding: Paddings.a14,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200.0),
                color: Theme.of(context).colorScheme.surface,
                border: widget.error == null
                    ? null
                    : Border.all(
                        color: Theme.of(context).errorColor,
                      ),
              ),
              child: Text(
                dateStr,
                style: Theme.of(context).textTheme.overline,
              ),
            ),
          ),
          FieldError(widget.error),
        ],
      ),
    );
  }
}
