import 'dart:async';

import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/modules/zoom_animation/controllers/zoom_animation_controller.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ZoomAnimation extends StatefulWidget {
  final String energy;
  final String energydescri;
  final List<String> assetcurt;
  const ZoomAnimation(
      {super.key,
      required this.energy,
      required this.energydescri,
      required this.assetcurt});

  @override
  State<ZoomAnimation> createState() => _ZoomAnimationState();
}

class _ZoomAnimationState extends State<ZoomAnimation>
    with SingleTickerProviderStateMixin {
  final ZoomAnimationController zoomAnimationController = Get.find();
  late AnimationController _controller;
  @override
  void initState()  {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _controller.forward();
    Timer(Duration(seconds: 4), () {
      Get.offNamed(AppPages.POST_ANIMATION, arguments: {"issucess": true,"energy":widget.energy});
    }); // Start the animation
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0).h,
              child: Center(child: headingText(widget.energy, fontSize: 28)),
            ),
            Container(
              height: 500.h,
              width: 500.h,
              child: Center(
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 1 - _controller.value,
                      child: Image.asset(
                        widget.assetcurt[1],
                        width: 500.h,
                        height: 500.h,
                      ),
                    ),
                    Opacity(
                      opacity: _controller.value,
                      child: Image.asset(
                        widget.assetcurt[2],
                        width: 500.h,
                        height: 500.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).h,
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: 300.w,
                  child: Center(
                      child: discriptionText(widget.energydescri,
                          fontSize: 20, textAlign: TextAlign.center))),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
