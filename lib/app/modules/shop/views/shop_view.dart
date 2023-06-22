
import 'package:ehoa/app/components/app_bar.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/my_icon_button.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:ehoa/config/translations/strings_enum.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../controllers/shop_controller.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
      builder: (c) {
        return Scaffold(
          appBar: MyAppBar(
            leading: [
              MyIconButton(
                  onTap: () {
                    Get.back();
                  },
                  isSvg: true,
                  icon: AppIcons.kBackArrowIcon)
            ],
            middle: [
              Text(
                Strings.shop,
                style: MyStyles.getTextStyle(
                    fontFamily: AppFonts.kInterRegular,
                    fontSize: 16,
                    color: LightThemeColors.white90),
              )
            ],
          ),
          backgroundColor: Color.fromRGBO(13, 23, 42, 1),
          body: Center(
            child: Container(
              child: subHeadingText("Shop Page Coming Soon", fontSize: 25.sp),
            ),
          ),
          );
      }
    );
  }
}
