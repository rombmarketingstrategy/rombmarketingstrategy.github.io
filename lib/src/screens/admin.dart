import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rombmarketingstrategy/src/components/button.dart';
import 'package:rombmarketingstrategy/src/components/custom_scaffold.dart';
import 'package:rombmarketingstrategy/src/components/small_icon_button.dart';
import 'package:rombmarketingstrategy/src/services/form_service.dart';
import 'package:rombmarketingstrategy/src/services/local_storage_service.dart';
import 'package:rombmarketingstrategy/src/utils/app_navigator.dart';
import 'package:rombmarketingstrategy/src/utils/constants.dart';
import 'package:rombmarketingstrategy/src/utils/paddings.dart';
import 'package:rombmarketingstrategy/src/utils/spacers.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  bool isLoading = false;

  String get remainingText {
    if (LocalStorageService.dataIsEmpty) return tr('admin.all_sent');
    return tr('admin.remaining') + ':';
  }

  void onBack() => AppNavigator.back(context);

  Future<void> onSave() async {
    setState(() => isLoading = true);
    await FormService.addSavedFormData();
    setState(() => isLoading = false);
    onBack();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isLoading: isLoading,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: Paddings.a16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallIconButton(
                    onTap: onBack,
                    icon: Icons.chevron_left_rounded,
                    size: 48,
                  ),
                  Hero(
                    child: SvgPicture.asset(
                      kPathLogo,
                      width: 80.sp,
                    ),
                    tag: 'Logo',
                  ),
                ],
              ),
            ),
            Spacers.expanded,
            Text(
              remainingText,
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            if (LocalStorageService.dataIsEmpty) ...[
              Spacers.expanded,
              Spacers.h64,
            ] else ...[
              Text(
                '${LocalStorageService.dataLength}',
                style: Theme.of(context).textTheme.headline1?.copyWith(color: Theme.of(context).colorScheme.primary),
                textAlign: TextAlign.center,
              ),
              Spacers.expanded,
              Button(text: tr('admin.save'), onClick: onSave),
              Spacers.h16,
            ],
          ],
        ),
      ),
    );
  }
}
