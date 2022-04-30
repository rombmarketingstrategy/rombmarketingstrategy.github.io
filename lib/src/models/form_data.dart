import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:rombmarketingstrategy/src/utils/custom_controller.dart';

class FormData {
  late String recommendation;
  late String deviceCode;
  late String location;
  late String city;
  late String name;
  late String phone;
  late String email;
  late String cityCustomer;
  late String birthday;
  late bool readEverything;
  late bool sendInfo;
  late bool contactMe;
  late bool useData;
  late bool exclusive;
  late bool notWantAds;
  late Timestamp timestamp;

  FormData(
    this.recommendation,
    this.deviceCode,
    this.location,
    this.city,
    this.name,
    this.phone,
    this.email,
    this.cityCustomer,
    this.birthday,
    this.readEverything,
    this.sendInfo,
    this.contactMe,
    this.useData,
    this.exclusive,
    this.notWantAds, [
    Timestamp? timestamp,
  ]) {
    this.timestamp = timestamp ?? Timestamp.now();
  }

  FormData.fromControllers(
    TextEditingController controllerRecommendation,
    TextEditingController controllerDeviceCode,
    TextEditingController controllerLocation,
    TextEditingController controllerCity,
    TextEditingController controllerName,
    TextEditingController controllerPhone,
    TextEditingController controllerEmail,
    TextEditingController controllerCityCustomer,
    CustomController<String> controllerBirthday,
    CustomController<bool> controllerReadEverything,
    CustomController<bool> controllerSendInfo,
    CustomController<bool> controllerContactMe,
    CustomController<bool> controllerUseData,
    CustomController<bool> controllerExclusive,
    CustomController<bool> controllerNotWantAds,
  ) {
    recommendation = controllerRecommendation.value.text;
    deviceCode = controllerDeviceCode.value.text;
    location = controllerLocation.value.text;
    city = controllerCity.value.text;
    name = controllerName.value.text;
    phone = controllerPhone.value.text;
    email = controllerEmail.value.text;
    cityCustomer = controllerCityCustomer.value.text;
    birthday = controllerBirthday.value ?? '';
    readEverything = controllerReadEverything.value ?? false;
    sendInfo = controllerSendInfo.value ?? false;
    contactMe = controllerContactMe.value ?? false;
    useData = controllerUseData.value ?? false;
    exclusive = controllerExclusive.value ?? false;
    notWantAds = controllerNotWantAds.value ?? false;
    timestamp = Timestamp.now();
  }

  Map<String, dynamic> toMap() {
    return {
      'recommendation': recommendation,
      'deviceCode': deviceCode,
      'location': location,
      'city': city,
      'name': name,
      'phone': phone,
      'email': email,
      'cityCustomer': cityCustomer,
      'birthday': birthday,
      'readEverything': readEverything,
      'sendInfo': sendInfo,
      'contactMe': contactMe,
      'useData': useData,
      'exclusive': exclusive,
      'notWantAds': notWantAds,
      'timestamp': timestamp.microsecondsSinceEpoch,
    };
  }

  Map<String, dynamic> toMapForFirebase() {
    return {
      ...toMap(),
      'timestamp': timestamp,
    };
  }

  factory FormData.fromMap(Map<String, dynamic> map) {
    return FormData(
      map['recommendation'] as String,
      map['deviceCode'] as String,
      map['location'] as String,
      map['city'] as String,
      map['name'] as String,
      map['phone'] as String,
      map['email'] as String,
      map['cityCustomer'] as String,
      map['birthday'] as String,
      map['readEverything'] as bool,
      map['sendInfo'] as bool,
      map['contactMe'] as bool,
      map['useData'] as bool,
      map['exclusive'] as bool,
      map['notWantAds'] as bool,
      Timestamp.fromMicrosecondsSinceEpoch(map['timestamp'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory FormData.fromJson(String source) => FormData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FormData(recommendation: $recommendation, deviceCode: $deviceCode, location: $location, city: $city, name: $name, phone: $phone, email: $email, cityCustomer: $cityCustomer, birthday: $birthday, readEverything: $readEverything, sendInfo: $sendInfo, contactMe: $contactMe, useData: $useData, exclusive: $exclusive, notWantAds: $notWantAds, timestamp: $timestamp)';
  }
}
