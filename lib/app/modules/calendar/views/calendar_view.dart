import 'package:ehoa/app/components/app_bar.dart';
import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/my_icon_button.dart';
import 'package:ehoa/app/components/navbar/bottom_navbar.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/app/routes/app_service.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:ehoa/utils/asset_list.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_super_html_viewer/utils/shims/dart_ui_real.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:radar_chart/radar_chart.dart';
import 'package:get/get.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../components/common/app_utils.dart';
import '../controllers/calendar_controller.dart';
import 'dart:math' as m;

class CalendarView extends StatelessWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(builder: (c) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        //appBar:
        backgroundColor: LightThemeColors.primaryColor,
        body: baseBody(
          c.isLoading,
          Stack(
            children: [
              ListView(
                children: [
                  Container(
                      height: (MediaQuery.of(AppService.getContext())
                              .size
                              .height -
                          MediaQuery.of(AppService.getContext()).size.height /
                              13),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  c.zoomAnimationController.animationModel ==
                                          null
                                      ? AppImages.kGpBkg
                                      : AppImages.kanimBkg),
                              fit: BoxFit.fill)),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Positioned(
                          //   top: MediaQuery.of(AppService.getContext())
                          //           .size
                          //           .height *
                          //       0.07,
                          //   //  left: MediaQuery.of(AppService.getContext()).size.width*0.25,
                          //   child:
                          // Center(child: headingText(Strings.cycleName)),
                          // ),
                          if (c.zoomAnimationController.animationModel != null)
                            Positioned(
                                top: MediaQuery.of(AppService.getContext())
                                        .size
                                        .height *
                                    0.27,
                                child: Image.asset(
                                  AppImages.bkgellipse,
                                  width: MediaQuery.of(AppService.getContext())
                                          .size
                                          .width *
                                      1.1,
                                )),
                          if (c.zoomAnimationController.animationModel != null)
                            Positioned(
                                right: 1,
                                top: MediaQuery.of(AppService.getContext())
                                        .size
                                        .height *
                                    0.35,
                                child: Image.asset(
                                  AppImages.bkgmoons,
                                  width: MediaQuery.of(AppService.getContext())
                                          .size
                                          .width *
                                      1.025,
                                )),
                          Positioned(
                              top: MediaQuery.of(AppService.getContext())
                                      .size
                                      .height *
                                  0.12,
                              child: GestureDetector(
                                  onTap: () {
                                    Get.offNamed(AppPages.HOME_ANIMATION);
                                  },
                                  child: Image.asset(
                                    c.zoomAnimationController.animationModel !=
                                            null
                                        ? c.zoomAnimationController
                                                .animationModel?.assetcurt[3] ??
                                            ""
                                        : AppImages.smapleEnergyGraphic ?? "",
                                    width:
                                        MediaQuery.of(AppService.getContext())
                                                .size
                                                .width *
                                            0.90,
                                  ))),
                          Positioned(
                              top: MediaQuery.of(AppService.getContext())
                                      .size
                                      .height *
                                  0.68,
                              child: Column(
                                children: [
                                  subHeadingText(Strings.periodStartsIn,
                                      fontSize: 17.spMax),
                                  sizedBox(height: 8),
                                  Text(
                                    c.periodStartsIn + " Days",
                                    style: MyStyles.getTextStyle(
                                        fontFamily: AppFonts.kInterSemibold,
                                        fontSize: 48.spMax),
                                  ),
                                  sizedBox(height: 28),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(AppPages.PROFILE);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.w, vertical: 8.h),
                                      decoration: BoxDecoration(
                                        color: LightThemeColors.white38,
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                      ),
                                      child: Center(
                                        child: subHeadingText(Strings.logPeriod,
                                            fontSize: 17.spMax),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          // c.issucess
                          //     ? Image.asset(AppImages.bkggdjflw)
                          //     : Container(),
                          // c.issucess == true
                          //     ? Container(
                          //         margin:
                          //             // MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                          //             EdgeInsets.only(
                          //           left: 24.w,
                          //           right: 24.w,
                          //           top: (MediaQuery.of(context).size.height /
                          //                   5.5)
                          //               .h,
                          //         ),
                          //         padding: EdgeInsets.symmetric(
                          //             horizontal: 16.w, vertical: 40.h),
                          //         decoration: BoxDecoration(
                          //           color: LightThemeColors.glassBkgColor,
                          //           border: Border.all(
                          //               color:
                          //                   LightThemeColors.glassStrokColor),
                          //           borderRadius: BorderRadius.circular(32.r),
                          //         ),
                          //         child: Center(
                          //           child: Column(
                          //             children: [
                          //               sizedBox(height: 30.h),
                          //               Stack(
                          //                 children: [
                          //                   Image.asset(
                          //                     AppIcons.andesgn,
                          //                     height: 230.h,
                          //                   ),
                          //                   Positioned(
                          //                       top: 30.h,
                          //                       left: 30.h,
                          //                       child: Image.asset(
                          //                           AppImages.kKoru)),
                          //                 ],
                          //               ),
                          //               sizedBox(height: 40.h),
                          //               headingText(Strings.miharo),
                          //               sizedBox(height: 6),
                          //               subHeadingText(Strings.oflog),
                          //               sizedBox(height: 48),
                          //               AppOutlineButton(
                          //                 btnText: Strings.paitomahi,
                          //                 ontap: () async {
                          //                   showModalBottomSheet(
                          //                       context: context,
                          //                       builder: (context) {
                          //                         return showbottommodal(
                          //                             context);
                          //                       });
                          //                   // c.baseVM.changePage(
                          //                   //     BottomBarSelection.tips);
                          //                 },
                          //               )
                          //             ],
                          //           ),
                          //         ),
                          //       )
                          //     : Container(),
                        ],
                      )),
                  sizedBox(height: 35),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        c.baseVM.ispo == "1"
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.h, horizontal: 16.w),
                                height: 62.h,
                                decoration: c.logs.isEmpty
                                    ? DottedDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        shape: Shape.box,
                                        color: LightThemeColors.white90)
                                    : MyDecoration.getGlassDecoration(),
                                child: c.logs.isEmpty
                                    ? Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          subHeadingText(
                                              Strings.logTodaysSymptoms),
                                          InkWell(
                                            borderRadius:
                                                BorderRadius.circular(100.r),
                                            onTap: () {
                                              //? sdjkfsdlk
                                              c.baseVM.changePage(
                                                  BottomBarSelection.symptoms);
                                              c.baseVM.update();
                                            },
                                            child: Container(
                                              width: 28.5.w,
                                              height: 28.5.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.r),
                                                  border: Border.all(
                                                      color: LightThemeColors
                                                          .white90)),
                                              child: const Center(
                                                  child: Icon(
                                                Icons.add,
                                                color: LightThemeColors.white90,
                                              )),
                                            ),
                                          )
                                        ],
                                      )
                                    : Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: List.generate(
                                                    c.logs.length, (index) {
                                                  return Container(
                                                    margin: EdgeInsets.only(
                                                        right: 20.w),
                                                    child: SvgPicture.asset(
                                                      c.logs[index].icon!,
                                                      width: 21.w,
                                                      height: 21.h,
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            borderRadius:
                                                BorderRadius.circular(100.r),
                                            onTap: () {
                                              c.baseVM.changePage(
                                                  BottomBarSelection.symptoms);
                                              c.baseVM.update();
                                            },
                                            child: Container(
                                              width: 28.5.w,
                                              height: 28.5.h,
                                              decoration: BoxDecoration(
                                                  color:
                                                      LightThemeColors.white90,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.r),
                                                  border: Border.all(
                                                      color: LightThemeColors
                                                          .white90)),
                                              child: const Center(
                                                  child: Icon(
                                                Icons.add,
                                                color: LightThemeColors
                                                    .primaryColor,
                                              )),
                                            ),
                                          )
                                        ],
                                      ))
                            : Container(),

                        sizedBox(height: c.baseVM.ispo == "1" ? 12.h : 0),
                        c.baseVM.ispo == "1"
                            ? Center(
                                child: subHeadingText(Strings.symptomsOfDay))
                            : Container(),
                        sizedBox(height: c.baseVM.ispo == "1" ? 90.h : 0),
                        subHeadingText("${Strings.currCycle}: ${c.curdif} days",
                            fontSize: 18),
                        Text(
                          "${c.currentmonthstart} - ${c.currentmonthend}",
                          style: MyStyles.getTextStyle(
                            fontSize: 8,
                          ),
                        ),
                        sizedBox(height: 12),
                        InkWell(
                          borderRadius: BorderRadius.circular(16.r),
                          onTap: () {
                            Get.toNamed(AppPages.CYCLE_DETAILS);
                          },
                          child: Container(
                            decoration: MyDecoration.getGlassDecoration(),
                            padding: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 8.w),
                            child: Center(
                              child: Wrap(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.center,
                                runSpacing: 16,
                                children:
                                    List.generate(c.moonList1.length, (index) {
                                  return Container(
                                      decoration: BoxDecoration(
                                          color: c.moonList1[index].isSelected!
                                              ? LightThemeColors
                                                  .moonHighlightColor
                                              : Colors.transparent,
                                          borderRadius: getBorderRadius(
                                              c.moonList1, index)),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      child: SvgPicture.asset(
                                        c.moonList1[index].icon!,
                                        color: Color(c.moonList1[index].color!),
                                      ));
                                }),
                              ),
                            ),
                          ),
                        ),
                        sizedBox(height: 48),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 8.w),
                          decoration: BoxDecoration(
                            color: LightThemeColors.glassBkgColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                topRight: Radius.circular(16.r)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              subHeadingText("${c.prevdif} days", fontSize: 18),
                              Text(
                                "${c.previosmonthstart} - ${c.previosmontend}",
                                style: MyStyles.getTextStyle(
                                  fontSize: 8,
                                ),
                              ),
                              sizedBox(height: 16),
                              Center(
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.center,
                                  runSpacing: 16,
                                  children: List.generate(c.moonList2.length,
                                      (index) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            color:
                                                c.moonList2[index].isSelected!
                                                    ? LightThemeColors
                                                        .moonHighlightColor
                                                    : Colors.transparent,
                                            borderRadius: getBorderRadius(
                                                c.moonList2, index)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w),
                                        child: SvgPicture.asset(
                                          c.moonList2[index].icon!,
                                          color:
                                              Color(c.moonList2[index].color!),
                                        ));
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              height: 2.h,
                              color: LightThemeColors.glassStrokColor,
                            ))
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 8.w),
                          decoration: BoxDecoration(
                            color: LightThemeColors.glassBkgColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.r),
                                bottomRight: Radius.circular(16.r)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              subHeadingText("${c.pprevdif} days",
                                  fontSize: 18),
                              Text(
                                "${c.ppmonthstart} - ${c.ppmonthend}",
                                style: MyStyles.getTextStyle(
                                  fontSize: 8,
                                ),
                              ),
                              sizedBox(height: 16),
                              Center(
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.center,
                                  runSpacing: 16,
                                  children: List.generate(c.moonList3.length,
                                      (index) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            color:
                                                c.moonList3[index].isSelected!
                                                    ? LightThemeColors
                                                        .moonHighlightColor
                                                    : Colors.transparent,
                                            borderRadius: getBorderRadius(
                                                c.moonList3, index)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w),
                                        child: SvgPicture.asset(
                                          c.moonList3[index].icon!,
                                          color:
                                              Color(c.moonList3[index].color!),
                                        ));
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBox(height: 96),
                        Center(
                            child: subHeadingText(Strings.feelingThisCycle,
                                fontSize: 16)),
                        sizedBox(height: 48),
                        c.baseVM.ispo != "1"
                            ? Container(
                                decoration: BoxDecoration(
                                    color: Colors.white10,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(color: Colors.white12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0).h,
                                  child: Column(
                                    children: [
                                      headingText(Strings.emotiontrends,
                                          fontSize: 28.sp),
                                      sizedBox(height: 20.h),
                                      Center(
                                          child:
                                              Image.asset(AppImages.hexgraph)),
                                      sizedBox(height: 20.h),
                                      Container(
                                          width: 200.w,
                                          child: subHeadingText(
                                              Strings.trackcyclemoods,
                                              textAlign: TextAlign.center,
                                              fontSize: 16.sp)),
                                      sizedBox(height: 20.h),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(AppPages.PAYWALL);
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.60,
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  246, 78, 65, 1.0),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.w))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.all(12.0).w,
                                            child: Center(
                                                child: subHeadingText(
                                                    "Unlock Premium",
                                                    fontSize: 15.sp)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Center(
                                child: RadarChart(
                                  length: 6,
                                  radius: 150,
                                  initialAngle: m.pi / 2,
                                  //backgroundColor: Colors.white,
                                  vertices: [
                                    PreferredSize(
                                      preferredSize: const Size(50, 50),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30.0, left: 10),
                                        child: Text(
                                          c.emotionLabels[0],
                                          style: MyStyles.getTextStyle(
                                              color: LightThemeColors.white90,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    PreferredSize(
                                      preferredSize: const Size(50, 50),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Text(c.emotionLabels[1],
                                            style: MyStyles.getTextStyle(
                                                color: LightThemeColors.white90,
                                                fontSize: 14)),
                                      ),
                                    ),
                                    PreferredSize(
                                      preferredSize: const Size(80, 50),
                                      child: Text(c.emotionLabels[2],
                                          style: MyStyles.getTextStyle(
                                              color: LightThemeColors.white90,
                                              fontSize: 14)),
                                    ),
                                    PreferredSize(
                                      preferredSize: const Size(50, 50),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(c.emotionLabels[3],
                                            style: MyStyles.getTextStyle(
                                                color: LightThemeColors.white90,
                                                fontSize: 14)),
                                      ),
                                    ),
                                    PreferredSize(
                                      preferredSize: const Size(50, 50),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 14.0, bottom: 20),
                                        child: Text(c.emotionLabels[4],
                                            style: MyStyles.getTextStyle(
                                                color: LightThemeColors.white90,
                                                fontSize: 14)),
                                      ),
                                    ),
                                    PreferredSize(
                                      preferredSize: const Size(50, 50),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30, left: 10),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(c.emotionLabels[5],
                                              style: MyStyles.getTextStyle(
                                                  color:
                                                      LightThemeColors.white90,
                                                  fontSize: 14)),
                                        ),
                                      ),
                                    ),
                                  ],
                                  borderStroke: 2,
                                  borderColor: LightThemeColors.white90,
                                  radialStroke: 2,
                                  radialColor: Colors.transparent,
                                  radars: [
                                    RadarTile(
                                      values: c.values1,
                                      borderStroke: 2,
                                      borderColor:
                                          Colors.yellow.withOpacity(0.0),
                                      backgroundColor:
                                          Colors.yellow.withOpacity(0.0),
                                    ),
                                    RadarTile(
                                      values: c.values2,
                                      borderStroke: 2,
                                      borderColor: Colors.blue,
                                      backgroundColor:
                                          Colors.blue.withOpacity(0.0),
                                    ),
                                    RadarTile(
                                      values: c.values2,
                                      borderStroke: 2,
                                      borderColor: Colors.blue,
                                      backgroundColor:
                                          Colors.blue.withOpacity(0.0),
                                    ),
                                    RadarTile(
                                      values: c.values2,
                                      borderStroke: 2,
                                      borderColor: Colors.blue,
                                      backgroundColor:
                                          Colors.blue.withOpacity(0.0),
                                    ),
                                    RadarTile(
                                      values: c.values2,
                                      borderStroke: 2,
                                      borderColor: Colors.blue,
                                      backgroundColor:
                                          Colors.blue.withOpacity(0.0),
                                    ),
                                    RadarTile(
                                      values: c.values2,
                                      borderStroke: 2,
                                      borderColor: EnergyLevelColors.highEnergy,
                                      backgroundColor: EnergyLevelColors
                                          .highEnergy
                                          .withOpacity(0.4),
                                    ),
                                  ],
                                ),
                              ),
                        sizedBox(height: 48),
                        // SeeReportButton(
                        //   onTap: () {},
                        //   text: Strings.seeThisMonthRepo,
                        // ),
                        // sizedBox(height: 100)
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: 15,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: PreferredSize(
                      preferredSize: const Size.fromHeight(
                          80.0), // here the desired height
                      child: MyAppBar(
                        color: 0x00000000,
                        leading: [
                          MyIconButton(
                              onTap: () {
                                Get.toNamed(AppPages.MENU);
                              },
                              isSvg: true,
                              icon: AppIcons.kMenuToggleIcon)
                        ],
                        middle: [
                          Text(
                            "Home",
                            style: MyStyles.getTextStyle(
                                fontFamily: AppFonts.kInterRegular,
                                fontSize: 14,
                                color: LightThemeColors.white90),
                          )
                        ],
                        actions: [
                          MyIconButton(
                              onTap: () {
                                Get.toNamed(AppPages.PERIOD_CALENDAR);
                              },
                              isSvg: true,
                              icon: AppIcons.kCalendarIcon)
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  static getBorderRadius(List<MoonData> moonList1, int index) {
    if (index == 0 && moonList1[index].isSelected!) {
      return const BorderRadius.only(
          topLeft: Radius.circular(100), bottomLeft: Radius.circular(100));
    } else if (index > 0 &&
        !moonList1[index - 1].isSelected! &&
        moonList1[index].isSelected!) {
      return const BorderRadius.only(
          topLeft: Radius.circular(100), bottomLeft: Radius.circular(100));
    } else if ((index > 0 && moonList1[index - 1].isSelected!) &&
        (index < moonList1.length - 1 && moonList1[index + 1].isSelected!)) {
      return null;
    } else if ((index < moonList1.length - 1 &&
        !moonList1[index + 1].isSelected!)) {
      return const BorderRadius.only(
          topRight: Radius.circular(100), bottomRight: Radius.circular(100));
    }
  }

  Widget showbottommodal(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.w),
          topRight: Radius.circular(25.w),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
              top: 100.h,
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
                      topLeft: Radius.circular(25.h),
                      topRight: Radius.circular(25.h))),
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
                    height: MediaQuery.of(context).size.height * 0.23,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppPages.ENERGY_TIPS_DETAILS);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.w))),
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
}

class SeeReportButton extends StatelessWidget {
  const SeeReportButton({
    required this.text,
    required this.onTap,
    super.key,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: MyDecoration.getGlassDecoration(),
      child: Material(
          type: MaterialType.transparency,
          borderRadius: BorderRadius.circular(16.r),
          child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(16.r),
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Text(
                    text,
                    style: MyStyles.getTextStyle(
                        fontFamily: AppFonts.kInterBold,
                        fontSize: 14,
                        color: LightThemeColors.white90),
                  )))),
    ));
  }
}
