import 'dart:async';

import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/data/remote/api_interface.dart';
import 'package:ehoa/app/data/remote/api_service.dart';
import 'package:ehoa/app/modules/view_pager/controllers/view_pager_controller.dart';
import 'package:ehoa/app/modules/view_pager/views/view_pager_view.dart';
import 'package:ehoa/app/modules/zoom_animation/controllers/zoom_animation_controller.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/asset_list.dart';

class PostAnimationController extends GetxController {
  final ZoomAnimationController zoomAnimationController = Get.find();
  DateTime date = DateTime.now();
  RxBool isLoading = true.obs;
  bool issucess = Get.arguments["issucess"] ?? false;
  String energy = Get.arguments["energy"] ?? "";
  String periodStartsIn = "";
  String periodDay = "";
  int cycleLen = -1;
  int periodLen = -1;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void getPeriodStartsIn() {
    try {
      periodDay = MySharedPref.getPeriodDay() ?? "";
      periodLen = MySharedPref.getPeriodLen() ?? -1;
      cycleLen = MySharedPref.getCycleLen() ?? -1;
      DateTime periodDate =
          DateFormat("yyyy-MM-dd").parse(MySharedPref.getPeriodDay() ?? "");
      DateTime todayDate = DateTime.now();
      periodStartsIn = periodDate.difference(todayDate).inDays.toString();
      if (int.parse(periodStartsIn) < 0) {
        debugPrint(periodStartsIn);
        periodStartsIn = (int.parse(periodStartsIn) + 30).toString();
      }
      update();
    } catch (e) {
      debugPrint("Exception in getPeriodStartsIn() ${e.toString()}");
      periodStartsIn = "N/A";
    }
  }

  Future<void> init() async {
    debugPrint(
        "<<< Period day ${MySharedPref.getPeriodDay()}, PeriodLen ${MySharedPref.getPeriodLen()} >>>");
    getPeriodStartsIn();
    debugPrint(periodStartsIn);
    if (issucess == true) postenergy();
    isLoading(false);

    update();
  }

  int mapenergy(String? energ) {
    if (energ ==
        AnimassetList().energylist[0])
      return 54;
    else if (energ ==
        AnimassetList().energylist[1])
      return 55;
    else if (energ ==
        AnimassetList().energylist[2])
      return 56;
    else if (energ ==
        AnimassetList().energylist[3])
      return 57;
    else if (energ ==
        AnimassetList().energylist[4])
      return 58;
    else
      return 0;
  }

  Future<void> postenergy() async {
    isLoading(true);
    update();
    if (zoomAnimationController.animationModel != null) {
      var data = {
        "user_id": MySharedPref.getUserId(),
        "token": MySharedPref.getToken(),
        "energy": mapenergy(zoomAnimationController.animationModel?.energy),
        "date": DateFormat("yyyy-MM-dd").format(date)
      };
      Map<String, dynamic> res = await ApiService().saveEnergy(data);
      isLoading(false);
      update();
      if (res.isNotEmpty) {
        issucess = true;
      }
    }
  }

  Future<List<dynamic>> getTipsForViewPager({energyId,subEnergyId,categoryId}) async {
    isLoading(true);
    update();
    Map<String, dynamic> res = await ApiService().getTipsForDailyRitual(
      energyId: energyId.toString(),
      subEnergyId: subEnergyId.toString(),
      categoryId: categoryId.toString(),
    );

    List<dynamic> list = List.empty(growable: true);
    print(res);
    list.addAll(res["tips"] as List);
    return list;
  }

  Future<void> showTips({energyId,subEnergyId,categoryId}) async {
    final c = Get.put(ViewPagerController());
    print(energyId);
    print(subEnergyId);
    print(categoryId);
    List<dynamic> list = await getTipsForViewPager(energyId:mapenergy(energy).toString(), subEnergyId: "1", categoryId:"33");
    c.pageList.clear();

    print(list);

    for (int i = 0; i < list.length; i++) {
      c.pageList.add(ViewPagerData(
          id: list[i]["tip_id"].toString(),
          title: list[i]["title"],
          description: list[i]["description"],
          image: ApiInterface.imgPath + list[i]["image"],
          isBuy: false,
          isShare: true));
    }
    isLoading(false);
    update();

    Get.toNamed(AppPages.VIEW_PAGER);
    ViewPagerView.showSheet();
    // c.update();
  }

  @override
  void dispose() {
    super.dispose();
    issucess = false;
  }
}
