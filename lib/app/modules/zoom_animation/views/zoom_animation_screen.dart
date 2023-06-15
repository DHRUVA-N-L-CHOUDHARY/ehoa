import 'package:ehoa/app/components/Zoom_widget.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/modules/zoom_animation/controllers/zoom_animation_controller.dart';
import 'package:ehoa/app/routes/app_service.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/translations/strings_enum.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ZoomAnimationScreen extends StatelessWidget {
   ZoomAnimationScreen({super.key});

  final ZoomAnimationController c = Get.find();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: false,
        backgroundColor: LightThemeColors.primaryColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Container(
                height:
                    (MediaQuery.of(AppService.getContext()).size.height).h,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.kanimBkg),
                        fit: BoxFit.fill)),
              ),
            ),
            Positioned(
              top: MediaQuery.of(AppService.getContext()).size.height * 0.1,
              //  left: MediaQuery.of(AppService.getContext()).size.width*0.25,
              child: Center(
                  child: subHeadingText(Strings.iamfeeling, fontSize: 18)),
            ),
            Positioned(
              top: MediaQuery.of(AppService.getContext()).size.height * 0.15,
              child: ZoomAnimation( assetcurt: c.animationModel?.assetcurt ?? [], energydescri: c.animationModel?.energydescri ?? "", energy: c.animationModel?.energy ?? "",),
            ),
          ],
        ),
      );
  }
}
