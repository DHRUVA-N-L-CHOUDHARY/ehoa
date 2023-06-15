import 'package:ehoa/app/components/app_bar.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/my_icon_button.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/modules/menu/views/menu_view.dart';
import 'package:ehoa/app/modules/remainders/controllers/remainder_controller.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:ehoa/config/translations/strings_enum.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RemaindersView extends StatelessWidget {
  const RemaindersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RemaindersController>(builder: (c) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppImages.gradBkgPng)),
        ),
        child: Scaffold(
          appBar: MyAppBar(
            leading: [
              MyIconButton(
                  onTap: () {
                    Get.back();
                  },
                  isSvg: true,
                  icon: AppIcons.kBackArrowIcon),
            ],
            middle: [
              Text(
                Strings.remind,
                style: MyStyles.getTextStyle(
                    fontFamily: AppFonts.kInterRegular,
                    fontSize: 14,
                    color: LightThemeColors.white90),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0,).h,
                child: headingText(Strings.cyclenotif, fontSize: 24.sp),
              ),
              MyListTile(
                showTopBorder: true,
                keyName: Strings.day1to3,
                onTap: () {
                  Get.toNamed(AppPages.REMAINDERS_SET,arguments:{"data": Strings.day1to3});
                },
                valueName: "10am",
              ),
              MyListTile(
                keyName: Strings.day4to6,
                onTap: () {
                  Get.toNamed(AppPages.REMAINDERS_SET,arguments:{"data": Strings.day4to6});
                },
                valueName: "10am",
              ),
              MyListTile(
                keyName: Strings.day7to12,
                onTap: () {
                  Get.toNamed(AppPages.REMAINDERS_SET,arguments:{"data": Strings.day7to12});
                },
                valueName: "10am",
              ),
              MyListTile(
                keyName: Strings.day13to16,
                onTap: () {
                  Get.toNamed(AppPages.REMAINDERS_SET,arguments:{"data": Strings.day13to16});
                },
                valueName: "10am",
              ),
              MyListTile(
                keyName: Strings.day17to23,
                onTap: () {
                  Get.toNamed(AppPages.REMAINDERS_SET,arguments:{"data": Strings.day17to23});
                },
                valueName: "10am",
              ),
              MyListTile(
                keyName: Strings.day24to28or35,
                onTap: () {
                  Get.toNamed(AppPages.REMAINDERS_SET,arguments:{"data": Strings.day24to28or35});
                },
                valueName: "10am",
              ),
              MyListTile(
                keyName: Strings.cstmsg,
                onTap: () {
                  Get.toNamed(AppPages.REMAINDERS_SET,arguments:{"data": Strings.cstmsg});
                },
                valueName: "10am",
              ),
              sizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Padding(
                padding: const EdgeInsets.all(20.0).h,
                child: headingText(Strings.tdyblg, fontSize: 24.sp),
              ),
              MyListTile(
                showTopBorder: true,
                keyName: Strings.todaytip,
                onTap: () {
                  Get.toNamed(AppPages.REMAINDERS_SET);
                },
              ),
              MyListTile(
                keyName: Strings.newartcleforu,
                onTap: () {
                  Get.toNamed(AppPages.REMAINDERS_SET);
                },
              ),
              MyListTile(
                keyName: Strings.newcerfru,
                onTap: () {
                  Get.toNamed(AppPages.REMAINDERS_SET,);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
