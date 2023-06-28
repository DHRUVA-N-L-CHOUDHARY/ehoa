// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ehoa/utils/asset_list.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/translations/localization_service.dart';

class MySharedPref {
  // prevent making instance
  MySharedPref._();

  // get storage
  static late SharedPreferences _sharedPreferences;

  // STORING KEYS
  static const String _fcmTokenKey = 'fcm_token';
  static const String _currentLocalKey = 'current_local';
  static const String _lightThemeKey = 'is_theme_light';
  static const String _userId = "userId";
  static const String _token = "token";
  static const String _refToken = "refToken";
  static const String _name = "_name";
  static const String _email = "email";
  static const String _image = "image";
  static const String _language = "lang";
  static const String _periodLen = "periodLen";
  static const String _periodDay = "periodDay";
  static const String _cycleLen = "cycleLen";
  static const String _ispro = "is_pro";
  static const String _height = "height";
  static const String _year = "dob";
  static const String _weight = "weight";
  static const String _pronoun = "pronoun";
  static const String _gender = "gender";
  static const String _help = "help";
  static const String _privacypolicy = "privacypolicy";
  static const String _termsdata = "termsdata";
  static const String _aboutshort = "aboutshort";
  static const String _aboutlong = "aboutlong";
  static const String _cmssingletitle = "cmssingletitle";
  static const String _cmssingledescri = "cmssingledescri";
  static const String _remlst = "remlist";
  static const String _animasset = "";
  static const String _animenergy = "";
  static const String _animenergydescri = "";

  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// set theme current type as light theme
  static void setName(String name) => _sharedPreferences.setString(_name, name);

  static String getName() => _sharedPreferences.getString(_name) ?? "";

  static void setLang(String lang) =>
      _sharedPreferences.setString(_language, lang);

  static String getLang() => _sharedPreferences.getString(_language) ?? "";

  /// set theme current type as light theme
  static void setEmail(String email) =>
      _sharedPreferences.setString(_email, email);

  static String getEmail() => _sharedPreferences.getString(_email) ?? "";

  /// set theme current type as light theme
  static void setThemeIsLight(bool lightTheme) =>
      _sharedPreferences.setBool(_lightThemeKey, lightTheme);

  /// get if the current theme type is light
  static bool getThemeIsLight() =>
      _sharedPreferences.getBool(_lightThemeKey) ?? true;

  /// save current locale
  static void setCurrentLanguage(String languageCode) =>
      _sharedPreferences.setString(_currentLocalKey, languageCode);

  /// get current locale
  static Locale getCurrentLocal() {
    String? langCode = _sharedPreferences.getString(_currentLocalKey);
    // default language is english
    if (langCode == null) {
      return LocalizationService.defaultLanguage;
    }
    return LocalizationService.supportedLanguages[langCode]!;
  }

  /// save generated fcm token
  static void setFcmToken(String token) =>
      _sharedPreferences.setString(_fcmTokenKey, token);

  /// get generated fcm token
  static String? getFcmToken() => _sharedPreferences.getString(_fcmTokenKey);

  //Userid getter setter
  static void setUserId(String userId) =>
      _sharedPreferences.setString(_userId, userId);

  static String? getUserId() => _sharedPreferences.getString(_userId);

  //Token getter setter
  static void setToken(String accessToken) =>
      _sharedPreferences.setString(_token, accessToken);

  static String? getToken() => _sharedPreferences.getString(_token);

  //Refresh Token getter setter
  static void setRefreshToken(String refToken) =>
      _sharedPreferences.setString(_refToken, refToken);

  static String? getRefreshToken() => _sharedPreferences.getString(_refToken);

  static void setPeriodDay(String periodDay) =>
      _sharedPreferences.setString(_periodDay, periodDay);

  static String? getPeriodDay() => _sharedPreferences.getString(_periodDay);

  static void setPeriodLen(int periodLen) =>
      _sharedPreferences.setInt(_periodLen, periodLen);

  static int? getPeriodLen() => _sharedPreferences.getInt(_periodLen);

  static void setCycleLen(int cycleLen) =>
      _sharedPreferences.setInt(_cycleLen, cycleLen);

  static int? getCycleLen() => _sharedPreferences.getInt(_cycleLen);

  static void setProtype(String ispro) =>
      _sharedPreferences.setString(_ispro, ispro);
  static String? getProtype() => _sharedPreferences.getString(_ispro);

  static void setdob(String year) => _sharedPreferences.setString(_year, year);
  static String? getdob() => _sharedPreferences.getString(_year);

  static void setweight(String weight) =>
      _sharedPreferences.setString(_weight, weight);

  static String? getweight() => _sharedPreferences.getString(_weight);

  static void setheight(String height) =>
      _sharedPreferences.setString(_height, height);

  static String? getheight() => _sharedPreferences.getString(_height);

  static void setpronun(String pronoun) =>
      _sharedPreferences.setString(_pronoun, pronoun);

  static String? getpronoun() => _sharedPreferences.getString(_pronoun);

  static void setgender(String gender) =>
      _sharedPreferences.setString(_gender, gender);

  static String? getgender() => _sharedPreferences.getString(_gender);

  static void sethelp(String help) => _sharedPreferences.setString(_help, help);

  static String? gethelp() => _sharedPreferences.getString(_help);

  static void setaboutshort(String aboutshort) =>
      _sharedPreferences.setString(_aboutshort, aboutshort);

  static String? getaboutshort() => _sharedPreferences.getString(_aboutshort);

  static void setaboutlong(String aboutlong) =>
      _sharedPreferences.setString(_aboutlong, aboutlong);

  static String? getaboutlong() => _sharedPreferences.getString(_aboutlong);

  static void setprivacypolicy(String privacyPolicy) =>
      _sharedPreferences.setString(_privacypolicy, privacyPolicy);

  static String? getprivacypolicy() =>
      _sharedPreferences.getString(_privacypolicy);

  static void settermsdata(String termsdata) =>
      _sharedPreferences.setString(_termsdata, termsdata);

  static String? gettermsdata() => _sharedPreferences.getString(_termsdata);

  static void setcmssingletitle(String cmssingletitle) =>
      _sharedPreferences.setString(_cmssingletitle, cmssingletitle);

  static String? getcmssingletitle() =>
      _sharedPreferences.getString(_cmssingletitle);

  static void setcmssingledescri(String cmssingledescri) =>
      _sharedPreferences.setString(_cmssingledescri, cmssingledescri);

  static String? getsingledescri() =>
      _sharedPreferences.getString(_cmssingledescri);

  static void setanimasset(String animasset) =>
      _sharedPreferences.setString(_animasset, animasset);

  static String? getanimasset() => _sharedPreferences.getString(_animasset);

  static void setanimenergy(String animenergy) =>
      _sharedPreferences.setString(_animenergy, animenergy);

  static String? getanimenergy() => _sharedPreferences.getString(_animenergy);

  static void setanimenergydescri(String animenergydescri) =>
      _sharedPreferences.setString(animenergydescri, _animenergydescri);

  static String? getanimenergydescri() =>
      _sharedPreferences.getString(_animenergydescri);

  static void clearSession() {
    _sharedPreferences.clear();
  }
}
