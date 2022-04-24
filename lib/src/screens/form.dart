import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rombmarketingstrategy/src/components/checkbox.dart';
import 'package:rombmarketingstrategy/src/components/date_picker.dart';
import 'package:rombmarketingstrategy/src/components/input_field.dart';
import 'package:rombmarketingstrategy/src/components/subtitle.dart';
import 'package:rombmarketingstrategy/src/utils/constants.dart';
import 'package:rombmarketingstrategy/src/utils/custom_controller.dart';
import 'package:rombmarketingstrategy/src/utils/paddings.dart';
import 'package:rombmarketingstrategy/src/utils/spacers.dart';

class FormScreen extends StatelessWidget {
  FormScreen({Key? key}) : super(key: key);
  final TextEditingController controllerRecommendation = TextEditingController();
  final TextEditingController controllerDeviceCode = TextEditingController();
  final TextEditingController controllerLocation = TextEditingController();
  final TextEditingController controllerCity = TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerCityCustomer = TextEditingController();
  final CustomController<String> controllerBirthday = CustomController(initialValue: DateTime.now().toString());
  final CustomController<bool> controllerReadEverything = CustomController();
  final CustomController<bool> controllerSendInfo = CustomController();
  final CustomController<bool> controllerContactMe = CustomController();
  final CustomController<bool> controllerUseData = CustomController();
  final CustomController<bool> controllerExclusive = CustomController();
  final CustomController<bool> controllerNotWantAds = CustomController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: Paddings.a16,
              alignment: Alignment.centerLeft,
              child: Hero(
                child: SvgPicture.asset(
                  kPathLogo,
                  width: 80.sp,
                ),
                tag: 'Logo',
              ),
            ),
            Spacers.h16,
            Text(
              tr('title'),
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            Spacers.h32,
            const Subtitle('salesperson'),
            InputField(textKey: 'recommendation_code', controller: controllerRecommendation),
            InputField(textKey: 'device_code', controller: controllerDeviceCode),
            InputField(textKey: 'location', controller: controllerLocation),
            InputField(textKey: 'city', controller: controllerCity),
            Spacers.h8,
            const Subtitle('customer'),
            InputField(textKey: 'name_and_surname', isRequired: true, controller: controllerName),
            InputField(textKey: 'phone', controller: controllerPhone, keyboardType: TextInputType.phone),
            InputField(textKey: 'email', controller: controllerEmail, keyboardType: TextInputType.emailAddress),
            InputField(textKey: 'city', controller: controllerCityCustomer),
            DatePicker(controller: controllerBirthday),
            CheckBox(textKey: 'i_read_everything', controller: controllerReadEverything),
            CheckBox(textKey: 'send_info', controller: controllerSendInfo),
            CheckBox(textKey: 'contact_me', controller: controllerContactMe),
            CheckBox(textKey: 'use_my_data', controller: controllerUseData),
            CheckBox(textKey: 'exclusive', controller: controllerExclusive),
            CheckBox(textKey: 'not_want_ads', controller: controllerNotWantAds),
          ],
        ),
      ),
    );
  }
}
