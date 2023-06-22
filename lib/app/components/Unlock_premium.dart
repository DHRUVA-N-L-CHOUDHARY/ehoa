import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/app/routes/app_service.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UnlockPremium extends StatelessWidget {
  final Function()? close;
  final String descri;
  final String heading;
  const UnlockPremium(
      {super.key,
      required this.close,
      required this.descri,
      required this.heading});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.w), topRight: Radius.circular(20.w)),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: MediaQuery.of(AppService.getContext()).size.height * 0.1,
            child: Image.asset(AppImages.unlockpremi, fit: BoxFit.fitWidth),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 1.0),
                  Color.fromRGBO(255, 255, 255, 0.9),
                  Color.fromRGBO(255, 255, 255, 0.6),
                  Color.fromRGBO(255, 255, 255, 0.5),
                  Color.fromRGBO(255, 255, 255, 0.3),
                  Color.fromRGBO(255, 255, 255, 0.2),
                  Color.fromRGBO(255, 255, 255, 0.1),
                  Color.fromRGBO(255, 255, 255, 0.0),
                  Color.fromRGBO(255, 255, 255, 0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.w),
                  topRight: Radius.circular(20.w)),
            ),
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     GestureDetector(
                //       onTap: close,
                //       child: Icon(Icons.close, color: Colors.black, size: MediaQuery.of(context).size.height*0.050,))
                //   ],
                // ),
                sizedBox(height:  MediaQuery.of(AppService.getContext()).size.height *
                        0.03),
                headingText(heading,
                    color: Colors.black,
                    fontSize: 28 *
                        MediaQuery.of(AppService.getContext()).size.height *
                        0.0015),
                sizedBox(
                    height: MediaQuery.of(AppService.getContext()).size.height *
                        0.01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0) *
                      MediaQuery.of(AppService.getContext()).size.height *
                      0.003,
                  child: discriptionText(descri,
                      color: Colors.black,
                      fontSize: 20* MediaQuery.of(AppService.getContext()).size.height *
                        0.0015,
                      textAlign: TextAlign.center),
                ),
                sizedBox(height: MediaQuery.of(context).size.height * 0.75),
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
                              fontSize: 24* MediaQuery.of(AppService.getContext()).size.height *
                        0.0015)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: close,
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.height * 0.050,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
