
import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/navbar/bottom_navbar.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/modules/post_animation/controller/post_animation_controller.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/app/routes/app_service.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:ehoa/config/translations/strings_enum.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:ehoa/app/modules/view_pager/views/view_pager_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_super_html_viewer/utils/shims/dart_ui_real.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PostAnimationView extends StatefulWidget {
  const PostAnimationView({super.key});

  @override
  State<PostAnimationView> createState() => _PostAnimationViewState();
}

class _PostAnimationViewState extends State<PostAnimationView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _controller.forward();
    // Start the animation
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return GetBuilder<PostAnimationController>(builder: (c) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              extendBody: true,
              //appBar:
              backgroundColor: LightThemeColors.primaryColor,
              body: baseBody(
                c.isLoading.value,
                Container(
                    height:
                        (MediaQuery.of(AppService.getContext()).size.height),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.kanimBkg),
                            fit: BoxFit.fill)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.90,
                            child: Opacity(
                                opacity: 1 - _controller.value,
                                child: BottomNavigatorBar())),
                        Positioned(
                          top: MediaQuery.of(AppService.getContext())
                                  .size
                                  .height *
                              0.07,
                          child: Opacity(
                            opacity: 1 - _controller.value,
                            child:
                                Center(child: headingText(Strings.cycleName)),
                          ),
                        ),
                        Positioned(
                            top: MediaQuery.of(AppService.getContext())
                                    .size
                                    .height *
                                0.38,
                            child: Opacity(
                              opacity: 1 - _controller.value,
                              child: Image.asset(
                                AppImages.bkgellipse,
                                width: 380.w,
                              ),
                            )),
                        Positioned(
                            top: MediaQuery.of(AppService.getContext())
                                    .size
                                    .height *
                                0.39,
                            child: Opacity(
                              opacity: 1 - _controller.value,
                              child: Image.asset(
                                AppImages.bkgmoons,
                                width: 380.w,
                              ),
                            )),
                        Positioned(
                            top: MediaQuery.of(AppService.getContext())
                                    .size
                                    .height *
                                0.19,
                            child: GestureDetector(
                                onTap: () {
                                  Get.offNamed(AppPages.HOME_ANIMATION);
                                },
                                child: Opacity(
                                  opacity: 1 - _controller.value,
                                  child: Image.asset(
                                    c.zoomAnimationController.animationModel
                                            ?.assetcurt[3] ??
                                        AppImages.smapleEnergyGraphic,
                                    width: 340.w,
                                  ),
                                ))),
                        Positioned(
                            top: MediaQuery.of(AppService.getContext())
                                    .size
                                    .height *
                                0.68,
                            child: Opacity(
                              opacity: 1 - _controller.value,
                              child: Column(
                                children: [
                                  subHeadingText(Strings.periodStartsIn),
                                  sizedBox(height: 8),
                                  Text(
                                    c.periodStartsIn + " Days",
                                    style: MyStyles.getTextStyle(
                                        fontFamily: AppFonts.kInterSemibold,
                                        fontSize: 48),
                                  ),
                                  sizedBox(height: 28),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(AppPages.PROFILE);
                                    },
                                    child: Opacity(
                                      opacity: 1 - _controller.value,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24.w, vertical: 8.h),
                                        decoration: BoxDecoration(
                                          color: LightThemeColors.white38,
                                          borderRadius:
                                              BorderRadius.circular(50.r),
                                        ),
                                        child: Center(
                                          child:
                                              subHeadingText(Strings.logPeriod),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Positioned(
                          child: Opacity(
                              opacity: _controller.value,
                              child: Image.asset(AppImages.bkggdjflw)),
                        ),
                        Positioned(
                          child: Opacity(
                            opacity: _controller.value,
                            child: Container(
                              margin:
                                  // MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                                  EdgeInsets.only(
                                      left: 24.w,
                                      right: 24.w,
                                      top: (MediaQuery.of(context).size.height /
                                              6.5)
                                          .h,
                                      bottom:
                                          (MediaQuery.of(context).size.height /
                                                  6.5)
                                              .h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 40.h),
                              decoration: BoxDecoration(
                                color: LightThemeColors.glassBkgColor,
                                border: Border.all(
                                    color: LightThemeColors.glassStrokColor),
                                borderRadius: BorderRadius.circular(32.r),
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    sizedBox(height: 30.h),
                                    Stack(
                                      children: [
                                        Image.asset(
                                          AppIcons.andesgn,
                                          height: 230.h,
                                        ),
                                        Positioned(
                                            top: 30.h,
                                            left: 30.h,
                                            child:
                                                Image.asset(AppImages.kKoru)),
                                      ],
                                    ),
                                    sizedBox(height: 40.h),
                                    headingText(Strings.miharo),
                                    sizedBox(height: 6),
                                    subHeadingText(Strings.oflog),
                                    sizedBox(height: 48),
                                    AppOutlineButton(
                                      btnText: Strings.paitomahi,
                                      ontap: () async {
                                        showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(40.0),
                                                      topRight:
                                                          Radius.circular(40.0))
                                                  .h,
                                            ),
                                            backgroundColor: Colors.white,
                                            context: context,
                                            builder: (context) {
                                              return showbottommodal(context);
                                            });
                                        // c.baseVM.changePage(
                                        //     BottomBarSelection.tips);
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            );
          });
        });
  }

  Widget BottomNavigatorBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80.h,
      decoration: BoxDecoration(
          // color: Colors.white.withOpacity(0.18) //Colors.transparent,
          ),
      child: Stack(
        children: [
          // Blur(
          //   blur: 7,
          //   blurColor: Colors.transparent,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: 80.h,
          //     color: Colors.transparent,
          //   ),
          // ),
          Positioned(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bottomBarChild(
                    index: BottomBarSelection.calendar,
                    label: Strings.calendar,
                    svgIconPath: AppIcons.kCalendarIcon,
                  ),
                  bottomBarChild(
                    index: BottomBarSelection.shop,
                    label: Strings.shop,
                    svgIconPath: AppIcons.kShopIcon,
                  ),
                  bottomBarChild(
                    index: BottomBarSelection.symptoms,
                    label: Strings.symptoms,
                    svgIconPath: AppIcons.kSysmptomsIcon,
                  ),
                  bottomBarChild(
                    index: BottomBarSelection.tips,
                    label: Strings.tips,
                    svgIconPath: AppIcons.kTipsIcon,
                  ),
                  bottomBarChild(
                    index: BottomBarSelection.empower,
                    label: Strings.empower,
                    svgIconPath: AppIcons.kEmpowerIcon,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //   ),
    );
  }

  Widget bottomBarChild({
    required int index,
    required String label,
    required String svgIconPath,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 24.h,
          width: 24.w,
          child: Center(child: SvgPicture.asset(svgIconPath)),
        ),
        const SizedBox(height: 5),
        Text(label,
            style: MyStyles.getTextStyle(
                fontFamily: AppFonts.kInterRegular,
                fontSize: 8,
                color: LightThemeColors.white80)),
      ],
    );
  }
}

Widget showbottommodal(BuildContext context) {
  return GetBuilder<PostAnimationController>(
    builder: (c) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.h),
            topRight: Radius.circular(40.h),
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
                top: 140.h,
                child: Image.asset(
                  AppImages.dra,
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                )),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 255, 255, 1.0),
                        Color.fromRGBO(255, 255, 255, 0.9),
                        Color.fromRGBO(255, 255, 255, 0.7),
                        Color.fromRGBO(255, 255, 255, 0.6),
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.4),
                        Color.fromRGBO(255, 255, 255, 0.3),
                        Color.fromRGBO(255, 255, 255, 0.2),
                        Color.fromRGBO(255, 255, 255, 0.1)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.h),
                        topRight: Radius.circular(40.h))),
                child: Column(
                  children: [
                    headingText(Strings.tipofday, color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.all(20.0).h,
                      child: subHeadingText(Strings.tipofdaydescri,
                          color: Colors.black,
                          textAlign: TextAlign.center,
                          fontSize: 18.sp),
                    ),
                    sizedBox(
                      height: MediaQuery.of(context).size.height * 0.28,
                    ),
                    GestureDetector(
                      onTap: () {
                        c.showTips();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.w))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0).w,
                          child: Center(
                              child: subHeadingText("learn more",
                                  color: Colors.black, fontSize: 24.sp)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  );
}
