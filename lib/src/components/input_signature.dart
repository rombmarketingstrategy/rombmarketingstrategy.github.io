import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rombmarketingstrategy/src/components/field_error.dart';
import 'package:rombmarketingstrategy/src/utils/paddings.dart';
import 'package:rombmarketingstrategy/src/utils/spacers.dart';
import 'package:signature/signature.dart';

class InputSignature extends StatelessWidget {
  final SignatureController controller;
  final String? error;

  const InputSignature({required this.controller, this.error});

  void onClear() => controller.clear();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.h16,
      child: Column(
        children: [
          Spacers.h8,
          Row(
            children: [
              Expanded(child: Text(tr('fields.signature'), style: Theme.of(context).textTheme.bodyText1)),
              InkWell(
                onTap: controller.clear,
                borderRadius: BorderRadius.circular(100),
                child: Ink(
                  padding: Paddings.a4,
                  child: Icon(
                    Icons.refresh,
                    size: 24.sp,
                  ),
                ),
              ),
            ],
          ),
          Spacers.h4,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: error == null ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.error,
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Signature(
                controller: controller,
                width: double.infinity,
                height: 160.sp,
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          FieldError(error),
        ],
      ),
    );
  }
}
