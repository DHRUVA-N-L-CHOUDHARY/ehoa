import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spring/spring.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/utility_widgets.dart';
import '../../tnc/views/tnc_view.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(builder: (c) {
      return GestureDetector(
        onTap: () {
          print("sdjfd00");
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(13, 23, 42, 1)
            ]),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppImages.kWelcomeBkg,
                )),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Positioned.fill(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizedBox(
                            height: 10,
                          ),
                          backIcon(onTap: () {
                            Get.back();
                          }),
                          sizedBox(
                            height: 50,
                          ),
                          sizedBox(
                              height:
                                  (MediaQuery.of(context).size.height / 2.4).h),
                          c.isAnimationCompleted
                              ? animatedUI()
                              : SlideUpAnimation(
                                  child: animatedUI(),
                                  animStatus: (status) {
                                    if (status == AnimStatus.completed) {
                                      c.isAnimationCompleted = true;
                                    }
                                  },
                                ),
                          sizedBox(height: 110),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: FutureBuilder(
                    future: c.initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (c.controller.value.isPlaying) {
                                c.controller.pause();
                              } else {
                                c.controller.play();
                              }
                            });
                          },
                          child: Icon(
                            c.controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ]),
            bottomNavigationBar: Padding(
              padding: MyPadding.getDynamicBottomPaddingWithFixedHorizontal(
                  bottom: 64),
              child:
                  // SlideUpAnimation(
                  //   child:
                  AppOutlineButton(
                      btnText: Strings.next.tr,
                      ontap: () {
                        Get.toNamed(AppPages.PAYWALL);
                      }),
              //),
            ),
          ),
        ),
      );
    });
  }

  Column animatedUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingText(Strings.welcomeHeading.tr, fontSize: 26.sp),
        subHeadingText(Strings.welcomeSubHeading.tr, fontSize: 16.sp),
        sizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(right: 20.0).w,
          child: discriptionText(Strings.welcomeDescText.tr, fontSize: 19.sp),
        )
      ],
    );
  }
}
