// ignore_for_file: must_be_immutable

import 'package:ehoa/app/components/Unlock_premium.dart';
import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/app/routes/app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../components/navbar/bottom_navbar.dart';
import '../controllers/base_controller.dart';

class BaseView extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseControlller>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kGpBkg)),
          ),
          child: Scaffold(
              appBar: AppBar(
                toolbarHeight: (c.ispo != "1" &&
                        (c.selectedIndex == BottomBarSelection.symptoms ||
                            c.selectedIndex == BottomBarSelection.empower))
                    ? MediaQuery.of(AppService.getContext()).size.height * 0.035
                    : 0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
              ),
              extendBodyBehindAppBar: (c.ispo != "1" &&
                      (c.selectedIndex == BottomBarSelection.symptoms ||
                          c.selectedIndex == BottomBarSelection.empower))
                  ? false
                  : true,
              extendBody: true,
              backgroundColor: Colors.transparent,
              body:
                  Navigator(
                      key: Get.nestedKey(1),
                      initialRoute: AppPages.CALENDAR, //profileRoute,
                      onGenerateRoute: c.onGenerateRoute,
                    ),
              bottomNavigationBar: (c.ispo != "1" &&
                      (c.selectedIndex == BottomBarSelection.symptoms ||
                          c.selectedIndex == BottomBarSelection.empower))
                  ? Container(height:0)
                  : const BottomNavbar()));
    });
  }
}
