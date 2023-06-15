import 'dart:convert';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/app/routes/app_service.dart';
import 'package:ehoa/app/service/social_login_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/apiModels/MyProfileRes.dart';
import '../../../data/remote/api_service.dart';
import '../../login/controllers/login_controller.dart';
import 'package:crypto/crypto.dart';

class SplashController extends GetxController {
  SocialloginController socialloginController =
      Get.put(SocialloginController());
  bool isAnimationCompleted = false;
  double beginY = 0, endY = -30;
  bool isLoading = true;
  Auth0 auth0 = Auth0(
      'dev-xaoieegxph0mwc8w.us.auth0.com', 'Jz6KIuNPDDiWnjbeZfoU7Ecojs7gkSwN');
  RxBool socialLoader = false.obs;
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigate();
    });
  }

  Future<void> navigate() async {
    String? token = MySharedPref.getToken();
    if (AppService.isValidString(token)) {
      Get.offAllNamed(AppPages.BASE);
    } else {
      isLoading = false;
      update();
    }
  }

  @override
  void dispose() {
    super.dispose();
    socialloginController.dispose();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  parseJwt(String token) async {
    final parts = token.split('.');
    if (parts.length != 3) {
      debugPrint("invalid token");
    }

    final payload = _decodeBase64(parts[1]);
    print("jdsklfdjskfjs");
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      debugPrint("invalid payload");
    }
    String email = payloadMap['email'];
    _socialLoginApiCall(email);
    Map<String, String> data = {'type': '1', 'email': email};
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  socialRegisterApiCall(dynamic res) async {
    socialLoader(false);
    if (res.isNotEmpty) {
      MySharedPref.setToken(res['token']);
      MySharedPref.setUserId(res['user_id'].toString());
      print("dsjfldkfjdjflds");
      Map<String, dynamic> profileMap = await ApiService()
          .showProfile(id: (res['user_id'].toString()));
      if (profileMap.isNotEmpty) {
        MyProfileResponse obj = MyProfileResponse.fromJson(profileMap);
        MySharedPref.setEmail(obj.showUser?.first.email ?? "");
        MySharedPref.setName(obj.showUser?.first.name ?? "");
        MySharedPref.setPeriodDay(obj.showUser?.first.periodDay ?? "");
        MySharedPref.setPeriodLen(
            parseInt(obj.showUser?.first.averageCycleDays.toString()));
        MySharedPref.setCycleLen(
            parseInt(obj.showUser?.first.averageCycleLength.toString()));
            MySharedPref.setProtype(
              parseInt(obj.showUser?.first.ispro.toString()));
        debugPrint("sdlkjdsfkd");
        debugPrint(
            "<<< Period day ${MySharedPref.getPeriodDay()}, PeriodLen ${MySharedPref.getPeriodLen()} >>>");
      }
      socialLoader(false);
      Get.offAllNamed(AppPages.TNC);
    }
    socialLoader(false);
  }

  _socialLoginApiCall(String email) async {
    Map<String, String> data = {'email': email};
    Map res = await ApiService().loginUser(data, isSocial: true);
    socialLoader(false);

    if (res.isNotEmpty) {
      MySharedPref.setToken(res['token']);
      MySharedPref.setUserId(res['data']['user_id'].toString());
      print("dsjfldkfjdjflds");
      Map<String, dynamic> profileMap = await ApiService()
          .showProfile(id: (res['data']['user_id'].toString()));
      if (profileMap.isNotEmpty) {
        MyProfileResponse obj = MyProfileResponse.fromJson(profileMap);
        MySharedPref.setEmail(obj.showUser?.first.email ?? "");
        MySharedPref.setName(obj.showUser?.first.name ?? "");
        MySharedPref.setPeriodDay(obj.showUser?.first.periodDay ?? "");
        MySharedPref.setPeriodLen(
            parseInt(obj.showUser?.first.averageCycleDays.toString()));
        MySharedPref.setCycleLen(
            parseInt(obj.showUser?.first.averageCycleLength.toString()));
        MySharedPref.setProtype(
              parseInt(obj.showUser?.first.ispro.toString()));
        debugPrint("dsssdlkjdsfkd");

        debugPrint(
            "<<< Period day ${MySharedPref.getPeriodDay()}, PeriodLen ${MySharedPref.getPeriodLen()} >>>");
      }
      socialLoader(false);
      Get.offAllNamed(AppPages.BASE);
    }
    socialLoader(false);
  }
}
