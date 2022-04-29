import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rombmarketingstrategy/src/components/button.dart';
import 'package:rombmarketingstrategy/src/components/checkbox.dart';
import 'package:rombmarketingstrategy/src/components/custom_scaffold.dart';
import 'package:rombmarketingstrategy/src/components/date_picker.dart';
import 'package:rombmarketingstrategy/src/components/input_field.dart';
import 'package:rombmarketingstrategy/src/components/responsive_container.dart';
import 'package:rombmarketingstrategy/src/components/subtitle.dart';
import 'package:rombmarketingstrategy/src/models/form_data.dart';
import 'package:rombmarketingstrategy/src/screens/success.dart';
import 'package:rombmarketingstrategy/src/services/form_service.dart';
import 'package:rombmarketingstrategy/src/utils/app_navigator.dart';
import 'package:rombmarketingstrategy/src/utils/constants.dart';
import 'package:rombmarketingstrategy/src/utils/custom_controller.dart';
import 'package:rombmarketingstrategy/src/utils/paddings.dart';
import 'package:rombmarketingstrategy/src/utils/spacers.dart';

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
  String? errRecommendation,
      errDeviceCode,
      errLocation,
      errCity,
      errName,
      errPhone,
      errEmail,
      errCityCustomer,
      errBirthday;
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

    if (controllerRecommendation.value.text.isEmpty) errRecommendation = tr('error.missing_field');
    if (controllerDeviceCode.value.text.isEmpty) errDeviceCode = tr('error.missing_field');
    if (controllerLocation.value.text.isEmpty) errLocation = tr('error.missing_field');
    if (controllerCity.value.text.isEmpty) errCity = tr('error.missing_field');
    if (controllerName.value.text.isEmpty) errName = tr('error.missing_field');
    if (controllerPhone.value.text.isEmpty) errPhone = tr('error.missing_field');
    if (controllerEmail.value.text.isEmpty) errEmail = tr('error.missing_field');
    if (controllerCityCustomer.value.text.isEmpty) errCityCustomer = tr('error.missing_field');
    if (controllerBirthday.value?.isEmpty ?? true) errBirthday = tr('error.missing_field');

    setState(() {});
  }

  void onClick(BuildContext context) {
    validateData();
    if (errRecommendation != null ||
        errDeviceCode != null ||
        errLocation != null ||
        errCity != null ||
        errName != null ||
        errPhone != null ||
        errEmail != null ||
        errCityCustomer != null ||
        errBirthday != null) return;
    setState(() => isLoading = true);

    FormService.addFormData(FormData.fromControllers(
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
    ));

    setState(() => isLoading = false);
    AppNavigator.off(context, () => SuccessScreen());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isLoading: isLoading,
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
                // TODO: Add signature area
                CheckBox(textKey: 'i_read_everything', controller: controllerReadEverything),
                CheckBox(textKey: 'send_info', controller: controllerSendInfo),
                CheckBox(textKey: 'contact_me', controller: controllerContactMe),
                CheckBox(textKey: 'use_my_data', controller: controllerUseData),
                CheckBox(textKey: 'exclusive', controller: controllerExclusive),
                CheckBox(textKey: 'not_want_ads', controller: controllerNotWantAds),
                Button(text: tr('send'), onClick: () => onClick(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
