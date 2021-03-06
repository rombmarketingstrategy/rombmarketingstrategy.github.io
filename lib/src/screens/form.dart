import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rombmarketingstrategy/src/components/button.dart';
import 'package:rombmarketingstrategy/src/components/checkbox.dart';
import 'package:rombmarketingstrategy/src/components/custom_scaffold.dart';
import 'package:rombmarketingstrategy/src/components/date_picker.dart';
import 'package:rombmarketingstrategy/src/components/field_error.dart';
import 'package:rombmarketingstrategy/src/components/input_field.dart';
import 'package:rombmarketingstrategy/src/components/input_signature.dart';
import 'package:rombmarketingstrategy/src/components/responsive_container.dart';
import 'package:rombmarketingstrategy/src/components/small_icon_button.dart';
import 'package:rombmarketingstrategy/src/components/subtitle.dart';
import 'package:rombmarketingstrategy/src/models/form_data.dart';
import 'package:rombmarketingstrategy/src/screens/admin.dart';
import 'package:rombmarketingstrategy/src/screens/success.dart';
import 'package:rombmarketingstrategy/src/services/form_service.dart';
import 'package:rombmarketingstrategy/src/utils/app_navigator.dart';
import 'package:rombmarketingstrategy/src/utils/constants.dart';
import 'package:rombmarketingstrategy/src/utils/custom_controller.dart';
import 'package:rombmarketingstrategy/src/utils/paddings.dart';
import 'package:rombmarketingstrategy/src/utils/spacers.dart';
import 'package:signature/signature.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController controllerRecommendation = TextEditingController();
  final TextEditingController controllerDeviceCode = TextEditingController();
  final TextEditingController controllerLocation = TextEditingController();
  final TextEditingController controllerCity = TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerCityCustomer = TextEditingController();
  final CustomController<String> controllerBirthday = CustomController();
  final CustomController<bool> controllerReadEverything = CustomController();
  final CustomController<bool> controllerSendInfo = CustomController();
  final CustomController<bool> controllerContactMe = CustomController();
  final CustomController<bool> controllerUseData = CustomController();
  final CustomController<bool> controllerExclusive = CustomController();
  final CustomController<bool> controllerNotWantAds = CustomController();
  final SignatureController controllerSignature =
      SignatureController(penStrokeWidth: 2, penColor: Colors.blue.shade900);
  String? errRecommendation,
      errDeviceCode,
      errLocation,
      errCity,
      errName,
      errPhone,
      errEmail,
      errCityCustomer,
      errBirthday,
      errSignature,
      errCheckboxes;
  bool isLoading = false;

  void validateData() {
    errRecommendation = null;
    errDeviceCode = null;
    errLocation = null;
    errCity = null;
    errName = null;
    errPhone = null;
    errEmail = null;
    errCityCustomer = null;
    errBirthday = null;
    errSignature = null;
    errCheckboxes = null;

    if (controllerRecommendation.value.text.isEmpty) errRecommendation = tr('error.missing_field');
    if (controllerDeviceCode.value.text.isEmpty) errDeviceCode = tr('error.missing_field');
    if (controllerLocation.value.text.isEmpty) errLocation = tr('error.missing_field');
    if (controllerCity.value.text.isEmpty) errCity = tr('error.missing_field');
    if (controllerName.value.text.isEmpty) errName = tr('error.missing_field');
    if (controllerPhone.value.text.isEmpty) errPhone = tr('error.missing_field');
    if (controllerEmail.value.text.isEmpty) errEmail = tr('error.missing_field');
    if (controllerCityCustomer.value.text.isEmpty) errCityCustomer = tr('error.missing_field');
    if (controllerBirthday.value?.isEmpty ?? true) errBirthday = tr('error.missing_field');
    if (controllerSignature.isEmpty) errSignature = tr('error.missing_field');
    if (!(controllerReadEverything.value ?? false) ||
        !(controllerSendInfo.value ?? false) ||
        !(controllerContactMe.value ?? false) ||
        !(controllerUseData.value ?? false) ||
        !(controllerExclusive.value ?? false) ||
        !(controllerNotWantAds.value ?? false)) errCheckboxes = tr('error.checkboxes_required');

    setState(() {});
  }

  Future<void> onClick(BuildContext context) async {
    validateData();
    try {
      if (errRecommendation != null ||
          errDeviceCode != null ||
          errLocation != null ||
          errCity != null ||
          errName != null ||
          errPhone != null ||
          errEmail != null ||
          errCityCustomer != null ||
          errBirthday != null ||
          errSignature != null ||
          errCheckboxes != null) return;
      setState(() => isLoading = true);
      final Uint8List? png = await controllerSignature.toPngBytes();
      if (png == null) return showSomethingWentWrong();

      final bool success = await FormService.addFormData(
        FormData.fromControllers(
          controllerRecommendation,
          controllerDeviceCode,
          controllerLocation,
          controllerCity,
          controllerName,
          controllerPhone,
          controllerEmail,
          controllerCityCustomer,
          controllerBirthday,
          controllerReadEverything,
          controllerSendInfo,
          controllerContactMe,
          controllerUseData,
          controllerExclusive,
          controllerNotWantAds,
          png,
        ),
      );
      if (!success) return showSomethingWentWrong();

      AppNavigator.off(context, () => SuccessScreen());
    } catch (e) {
      showSomethingWentWrong();
    }
  }

  void showSomethingWentWrong() {
    setState(() => isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).errorColor,
        content: Text(tr('error.something_went_wrong')),
      ),
    );
  }

  void onClickAdmin() {
    AppNavigator.to(context, () => const AdminScreen());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isLoading: isLoading,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: Paddings.a16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    child: SvgPicture.asset(
                      kPathLogo,
                      width: 80.sp,
                    ),
                    tag: 'Logo',
                  ),
                  if (!kIsWeb)
                    SmallIconButton(
                      onTap: onClickAdmin,
                      icon: Icons.admin_panel_settings_sharp,
                      color: Theme.of(context).colorScheme.onPrimary,
                    )
                ],
              ),
            ),
            Spacers.h16,
            Text(tr('title'), style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.center),
            Spacers.h32,
            ResponsiveContainer(
              children: [
                const Subtitle('salesperson'),
                InputField(
                    textKey: 'recommendation_code', controller: controllerRecommendation, error: errRecommendation),
                InputField(textKey: 'device_code', controller: controllerDeviceCode, error: errDeviceCode),
                InputField(textKey: 'location', controller: controllerLocation, error: errLocation),
                InputField(textKey: 'city', controller: controllerCity, error: errCity),
                Spacers.h8,
                const Subtitle('customer'),
                InputField(textKey: 'name_and_surname', controller: controllerName, error: errName),
                InputField(
                  textKey: 'phone',
                  controller: controllerPhone,
                  keyboardType: TextInputType.phone,
                  error: errPhone,
                ),
                InputField(
                  textKey: 'email',
                  controller: controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  error: errEmail,
                ),
                InputField(textKey: 'city', controller: controllerCityCustomer, error: errCityCustomer),
                DatePicker(controller: controllerBirthday, error: errBirthday),
                InputSignature(controller: controllerSignature, error: errSignature),
                CheckBox(textKey: 'i_read_everything', controller: controllerReadEverything),
                CheckBox(textKey: 'send_info', controller: controllerSendInfo),
                CheckBox(textKey: 'contact_me', controller: controllerContactMe),
                CheckBox(textKey: 'use_my_data', controller: controllerUseData),
                CheckBox(textKey: 'exclusive', controller: controllerExclusive),
                CheckBox(textKey: 'not_want_ads', controller: controllerNotWantAds),
                FieldError(errCheckboxes),
                Button(text: tr('send'), onClick: () => onClick(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
