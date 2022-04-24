import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rombmarketingstrategy/src/utils/custom_controller.dart';
import 'package:rombmarketingstrategy/src/utils/paddings.dart';
import 'package:rombmarketingstrategy/src/utils/spacers.dart';

class DatePicker extends StatefulWidget {
  final CustomController<String> controller;
  const DatePicker({required this.controller});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime selectedDate;
  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.parse(widget.controller.value!);
  }

  Future<void> onDateClick() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked == null) return;
    setState(() => selectedDate = picked);
    widget.controller.value = picked.toString();
  }

  String get dateStr => '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.a16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacers.h8,
          Text(
            tr('fields.birthday') + '*',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Spacers.h8,
          InkWell(
            onTap: onDateClick,
            borderRadius: BorderRadius.circular(200.0),
            child: Ink(
              padding: Paddings.a16,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200.0),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Text(
                dateStr,
                style: Theme.of(context).textTheme.overline,
              ),
            ),
          ),
          Spacers.h8,
        ],
      ),
    );
  }
}
