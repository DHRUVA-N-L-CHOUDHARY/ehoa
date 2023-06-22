import 'package:ehoa/app/components/app_bar.dart';
import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/components/my_icon_button.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/modules/login/controllers/login_controller.dart';
import 'package:ehoa/app/modules/menu/views/menu_view.dart';
import 'package:ehoa/app/modules/remainders_set/controllers/remainders_set_controller.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:ehoa/config/translations/strings_enum.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RemaindersSetView extends StatelessWidget {
  const RemaindersSetView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RemaindersSetController>(builder: (c) {
      return Scaffold(
        appBar: MyAppBar(
          leading: [
            MyIconButton(
                onTap: () {
                  Get.offNamed(AppPages.REMAINDERS);
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
        backgroundColor: Color.fromRGBO(7, 42, 67, 0.8),
        body: baseBody(c.isLoading.value,Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(height: 40.h),
            CustomSwitcher(context, c.data),
            MyListTile(
              keyName: Strings.sendnotifat,
              onTap: () {
                Get.toNamed(AppPages.REMAINDERS_EDIT,
                    arguments: {"data": c.data});
              },
              valueName: "${c.time}:00 Hrs",
            ),
          ],
        ),
        )
      );
    });
  }

  Widget CustomSwitcher(BuildContext context, String data) {
    return GetBuilder<RemaindersSetController>(builder: (c) {
      return Container(
        padding:
            MyPadding.getFixedHorizontalAndDynamicVerticalInsets(vertical: 14),
        decoration: BoxDecoration(
            border: Border(
                bottom: const BorderSide(color: LightThemeColors.stroke2),
                top: const BorderSide(color: LightThemeColors.stroke2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(data, // Strings.reportingSystem,
                    style: MyStyles.getTextStyle(
                      fontFamily: AppFonts.kInterMedium,
                      fontSize: 14,
                      color: LightThemeColors.white90,
                    )),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: ToggleSwitch(
                    minWidth: 30.0,
                    minHeight: 25.0,
                    initialLabelIndex: parseInt(c.status),
                    cornerRadius: 20.0,
                    onToggle: (index) {
                      c.saveProfile(index.toString());
                    },
                    // activeFgColor: Colors.white,
                    activeBgColor: const [Colors.white],
                    inactiveBgColor: Colors.transparent,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    radiusStyle: true,
                    iconSize: 20.0,
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
