// ignore_for_file: unused_local_variable

import 'package:ehoa/app/service/user_onboarding_controller.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

import 'app/data/local/my_shared_pref.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_service.dart';
import 'config/theme/my_theme.dart';
import 'config/translations/localization_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppService());
}

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  String storageLocation = (await getApplicationDocumentsDirectory()).path;
   UserOnboardingController userOnboardingController = Get.put(UserOnboardingController());
  await FastCachedImageConfig.init(subDir: storageLocation, clearCacheAfter: const Duration(days: 15));

  // await MyHive.init(adapters: [UserModelAdapter()]);

  await MySharedPref.init();

  // await FcmHelper.initFcm();

  runApp(
    
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: RebuildFactors.all,
      builder: (context, widget) {
        return GetMaterialApp(
          title: "Ehoa",
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          transitionDuration: Duration(milliseconds: 300),
          defaultTransition: Transition.rightToLeftWithFade,
          builder: (context, widget) {
            bool themeIsLight = MySharedPref.getThemeIsLight();
            return Theme(
              data: MyTheme.getThemeData(isLight: themeIsLight),
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              ),
            );
          },

          initialRoute: AppPages.INITIAL, // first screen to show when app is running
          getPages: AppPages.routes, // app screens
          locale: MySharedPref.getCurrentLocal(), // app language
          navigatorKey: locator<AppService>().navigationKey,
          translations:
              LocalizationService(), // localization services in app (controller app language)
        );
      },
    ),
  );
}
