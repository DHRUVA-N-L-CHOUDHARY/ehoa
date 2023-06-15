// ignore_for_file: must_be_immutable

import 'package:ehoa/app/components/Unlock_premium.dart';
import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/routes/app_pages.dart';
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
                toolbarHeight: (MySharedPref.getProtype() != 1 &&
                        (c.selectedIndex == BottomBarSelection.symptoms ||
                            c.selectedIndex == BottomBarSelection.empower))
                    ? MediaQuery.of(context).size.height * 0.025
                    : 0.h,
                backgroundColor: Colors.transparent,
              ),
              extendBodyBehindAppBar: (MySharedPref.getProtype() != 1 &&
                      (c.selectedIndex == BottomBarSelection.symptoms ||
                          c.selectedIndex == BottomBarSelection.empower))
                  ? false
                  : true,
              extendBody: true,
              backgroundColor: Colors.transparent,
              body: MySharedPref.getProtype() != 1
                  ? c.selectedIndex == BottomBarSelection.symptoms
                      ? UnlockPremium(
                          close: () {
                            c.changePage(BottomBarSelection.calendar);
                          },
                          descri: c.txts[0][1],
                          heading: c.txts[0][0])
                      : c.selectedIndex == BottomBarSelection.empower
                          ? UnlockPremium(
                              close: () {
                                c.changePage(BottomBarSelection.calendar);
                              },
                              descri: c.txts[1][1],
                              heading: c.txts[1][0])
                          : Navigator(
                              key: Get.nestedKey(1),
                              initialRoute: AppPages.CALENDAR, //profileRoute,
                              onGenerateRoute: c.onGenerateRoute,
                            )
                  : Navigator(
                      key: Get.nestedKey(1),
                      initialRoute: AppPages.CALENDAR, //profileRoute,
                      onGenerateRoute: c.onGenerateRoute,
                    ),
              bottomNavigationBar: (MySharedPref.getProtype() != 1 &&
                      (c.selectedIndex == BottomBarSelection.symptoms ||
                          c.selectedIndex == BottomBarSelection.empower))
                  ? Container()
                  : const BottomNavbar()));
    });
  }
}
