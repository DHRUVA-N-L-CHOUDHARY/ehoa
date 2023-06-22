import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/modules/zoom_animation/controllers/zoom_animation_controller.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/config/translations/strings_enum.dart';
import 'package:ehoa/utils/asset_list.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AnimWidget extends StatefulWidget {
  const AnimWidget({super.key});

  @override
  State<AnimWidget> createState() => _AnimWidgetState();
}

class _AnimWidgetState extends State<AnimWidget> {
  double _volumeValue = 0;
  String energy = "";
  String energydescri = "";
  List<String> assetcurt = [
    AppImages.animinit,
    AppImages.animinit,
    AppImages.animinit
  ];
  void onVolumeChanged(double value) {
    if (value > 0 && value <= 60) {
      value = 60;
      assetcurt = AnimassetList().animlist[0];
      energy = AnimassetList().energylist[0];
      energydescri = AnimassetList().energydescrilist[0];
    } else if (value > 60 && value <= 120) {
      value = 120;
      assetcurt = AnimassetList().animlist[1];
      energy = AnimassetList().energylist[1];
      energydescri = AnimassetList().energydescrilist[1];
    } else if (value > 120 && value <= 180) {
      value = 180;
      assetcurt = AnimassetList().animlist[2];
      energy = AnimassetList().energylist[2];
      energydescri = AnimassetList().energydescrilist[2];
    } else if (value > 180 && value <= 270) {
      value = 270;
      assetcurt = AnimassetList().animlist[3];
      energy = AnimassetList().energylist[3];
      energydescri = AnimassetList().energydescrilist[3];
    } else {
      value = 360;
      assetcurt = AnimassetList().animlist[4];
      energy = AnimassetList().energylist[4];
      energydescri = AnimassetList().energydescrilist[4];
    }
    setState(() {
      _volumeValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ZoomAnimationController>(builder: (c) {
      return GestureDetector(
        onDoubleTap: () {
          c.updateanim(energy, energydescri, assetcurt);
          print("disfhdflkdshfsd");
          Get.offNamed(AppPages.ZOOM_ANIMATION);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            assetcurt[0] != AppImages.animinit
                ? Center(
                    child: subHeadingText(Strings.iamfeeling, fontSize: 18))
                : Center(
                    child:
                        headingText(Strings.swipeenergy, fontSize: 24.spMax)),
            assetcurt[0] != AppImages.animinit
                ? Center(child: headingText(energy, fontSize: 28))
                : Container(),
            Container(
              height: 520.h,
              width: 520.h,
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      assetcurt[0],
                      width: 520.h,
                      height: 520.h,
                    ),
                  ),
                  SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      onAxisTapped: onVolumeChanged,
                      minimum: 0,
                      maximum: 360,
                      startAngle: 270,
                      endAngle: 270,
                      useRangeColorForAxis: true,
                      showLabels: false,
                      showTicks: false,
                      radiusFactor: 0.6,
                      axisLineStyle: AxisLineStyle(
                          cornerStyle: CornerStyle.bothFlat,
                          color: Colors.black12,
                          thickness: 100),
                      pointers: <GaugePointer>[
                        NeedlePointer(
                            value: _volumeValue,
                            enableDragging: true,
                            onValueChanged: onVolumeChanged,
                            needleStartWidth: 0.5,
                            needleEndWidth: 0,
                            needleColor: Colors.transparent,
                            needleLength: 50,
                            knobStyle: KnobStyle(
                                color: Colors.black12,
                                sizeUnit: GaugeSizeUnit.logicalPixel,
                                knobRadius: 0.5)),
                        RangePointer(
                          enableDragging: true,
                          onValueChanged: onVolumeChanged,
                          value: _volumeValue,
                          cornerStyle: CornerStyle.bothFlat,
                          width: 300,
                          sizeUnit: GaugeSizeUnit.logicalPixel,
                          color: Colors.transparent,
                        ),
                      ],
                    )
                  ]),
                ],
              ),
            ),
            sizedBox(height: 20.h),
            assetcurt[0] != AppImages.animinit
                ? AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: 300.w,
                    child: Center(
                        child: discriptionText(energydescri,
                            fontSize: 20, textAlign: TextAlign.center)))
                : AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: 300.w,
                    child: Center(
                        child: discriptionText(Strings.swipeenergydescri,
                            fontSize: 20, textAlign: TextAlign.center))),
          ],
        ),
      );
    });
  }
}
