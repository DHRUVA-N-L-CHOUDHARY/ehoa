import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UnlockPremium extends StatelessWidget {
  final Function()? close;
  final String descri;
  final String heading;
  const UnlockPremium({super.key, required this.close, required this.descri, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.w),topRight: Radius.circular(20.w)),
      ),
        child: Stack(
          children: [
            Positioned.fill(
              top: 20.h,
              child: Image.asset(AppImages.unlockpremi, fit: BoxFit.fitHeight),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromRGBO(255, 255, 255, 1.0),
                Color.fromRGBO(255, 255, 255, 0.9),
                Color.fromRGBO(255, 255, 255, 0.6),
                Color.fromRGBO(255, 255, 255, 0.5),
                Color.fromRGBO(255, 255, 255, 0.3),
                Color.fromRGBO(255, 255, 255, 0.2),
                Color.fromRGBO(255, 255, 255, 0.1),
                Color.fromRGBO(255, 255, 255, 0.0),
                Color.fromRGBO(255, 255, 255, 0.0),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter,),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.w),topRight: Radius.circular(20.w)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: close,
                        child: Icon(Icons.close, color: Colors.black, size: MediaQuery.of(context).size.height*0.050,))
                    ],
                  ),
                  headingText(heading,
                      color: Colors.black, fontSize: 28.sp),
                  sizedBox(height: 5.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0).h,
                    child: discriptionText(
                        descri,
                        color: Colors.black,
                        fontSize: 20.sp,
                        textAlign: TextAlign.center),
                  ),
                  sizedBox(height: MediaQuery.of(context).size.height * 0.65),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppPages.PAYWALL);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(246, 78, 65, 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.w))),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0).w,
                        child: Center(
                            child: subHeadingText("Unlock Premium",
                                fontSize: 24.sp)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }
}
