// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as m;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/data/remote/api_service.dart';
import 'package:ehoa/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/app/service/helper/dialog_helper.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:intl/intl.dart';

import '../../../service/base_controller.dart';

class AddPeriodCalendarController extends GetxController with BaseController {
  final calC = Get.put(CalendarController());
  bool? isLoggingPeriod = false;
  DateTime? selectedDateTime = DateTime.now();
  DateTime? rangeStartDay;
  DateTime? rangeEndDay;
  List<CycleDetails> cycledetasils = List.empty(growable: true);

  @override
  void onInit() async{
   await getcycles();
    super.onInit();
  }

  String parseMonth(int month) {
    if (month == Month.january) {
      return "January";
    } else if (month == Month.february) {
      return "February";
    } else if (month == Month.march) {
      return "March";
    } else if (month == Month.april) {
      return "April";
    } else if (month == Month.may) {
      return "May";
    } else if (month == Month.june) {
      return "June";
    } else if (month == Month.july) {
      return "July";
    } else if (month == Month.august) {
      return "August";
    } else if (month == Month.september) {
      return "September";
    } else if (month == Month.october) {
      return "October";
    } else if (month == Month.november) {
      return "November";
    } else {
      return "December";
    }
  }

  Future getcycles() async {
    Map<String, dynamic> res;
    try {
      res = await ApiService()
          .getCycleDetails(MySharedPref.getUserId().toString());
      // print(res);
      res["cycles"].forEach((element) {
        cycledetasils.add(CycleDetails(
            startdate: element["cycle_start_date"],
            enddate: element["cycle_end_date"],
            month: element["month"]));
      });
      // res.forEach((key, value) {
      // // cycledetasils.add(CycleDetails());
      print(cycledetasils[0].startdate);
      // });
      update();
    } catch (e) {
      DialogHelper.showErrorDialog(
          "Server Error", "Please Check your Input & Internet Connectivity");
   
    }
  }

  Future updatecycledates(String peroid_day) async {
    Map<String, dynamic> res;
    try {
      Map<String, dynamic> data = {"user_id": MySharedPref.getUserId().toString(), "period_day": peroid_day};
      // if(DateTime.now().difference())
      res = await ApiService().Updateperoiddate(data);
      if (res.isNotEmpty) {
        Get.back();
      }
    } catch (e) {
      DialogHelper.showErrorDialog(
          "Server Error", "Please Check your Input & Internet Connectivity");
    }
  }

  String parseWeekDay(int weekday) {
    if (weekday == DateTime.sunday) {
      return "S";
    } else if (weekday == DateTime.monday) {
      return "M";
    } else if (weekday == DateTime.tuesday) {
      return "T";
    } else if (weekday == DateTime.wednesday) {
      return "W";
    } else if (weekday == DateTime.thursday) {
      return "T";
    } else if (weekday == DateTime.friday) {
      return "F";
    } else if (weekday == DateTime.saturday) {
      return "S";
    } else {
      return "";
    }
  }

  String getMoonByDay(DateTime day) {
    int idx = calC.moonList1.indexWhere((element) {
      return element.date!.day == day.day;
    });

    if (idx != -1) {
      return calC.moonList1[idx].icon!;
    } else {
      return Moons.moon0;
    }

    // if (day == 1) {
    //   return Moons.moon0;
    // } else if (day == 2) {
    //   return Moons.moon1;
    // } else if (day == 3) {
    //   return Moons.moon2;
    // } else if (day == 4) {
    //   return Moons.moon3;
    // } else if (day == 5) {
    //   return Moons.moon4;
    // } else if (day == 6) {
    //   return Moons.moon5;
    // } else if (day == 7) {
    //   return Moons.moon6;
    // } else if (day == 8) {
    //   return Moons.moon7;
    // } else if (day == 9) {
    //   return Moons.moon8;
    // } else if (day == 10) {
    //   return Moons.moon9;
    // } else if (day == 11) {
    //   return Moons.moon10;
    // } else if (day == 12) {
    //   return Moons.moon11;
    // } else if (day == 13) {
    //   return Moons.moon12;
    // } else if (day == 14) {
    //   return Moons.moon13;
    // } else if (day == 15) {
    //   return Moons.moon14;
    // } else if (day == 16) {
    //   return Moons.moon15;
    // } else if (day == 17) {
    //   return Moons.moon16;
    // } else if (day == 18) {
    //   return Moons.moon17;
    // } else if (day == 19) {
    //   return Moons.moon18;
    // } else if (day == 20) {
    //   return Moons.moon19;
    // } else if (day == 21) {
    //   return Moons.moon20;
    // } else if (day == 22) {
    //   return Moons.moon21;
    // } else if (day == 23) {
    //   return Moons.moon22;
    // } else if (day == 24) {
    //   return Moons.moon23;
    // } else if (day == 25) {
    //   return Moons.moon24;
    // } else if (day == 26) {
    //   return Moons.moon25;
    // } else if (day == 27) {
    //   return Moons.moon20;
    // } else if (day == 28) {
    //   return Moons.moon20;
    // } else if (day == 29) {
    //   return Moons.moon20;
    // } else if (day == 30) {
    //   return Moons.moon20;
    // } else if (day == 31) {
    //   return Moons.moon20;
    // } else {
    //   return Moons.moon0;
    // }
  }

  int getEnergyColor(DateTime day) {
    int idx = calC.moonList1.indexWhere((element) {
      return element.date!.day == day.day && element.date!.month == day.month;
    });
    int idx1 = calC.moonList2.indexWhere((element) {
      return element.date!.day == day.day && element.date!.month == day.month;
    });
    int idx2 = calC.moonList3.indexWhere((element) {
      return element.date!.day == day.day && element.date!.month == day.month;
    });
    if (idx != -1 || idx1 != -1 || idx2 != -1) {
      if (idx != -1)
        return calC.moonList1[idx].energy!.energyColor!;
      else if (idx1 != -1)
        return calC.moonList2[idx1].energy!.energyColor!;
      else
        return calC.moonList3[idx2].energy!.energyColor!;
    } else {
      return 0xff46597c;
    }
    // int energy = m.Random().nextInt(6);
    // if (day == 1) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 2) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 3) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 4) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 5) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 6) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 7) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 8) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 9) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 10) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 11) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 12) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 13) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 14) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 15) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 16) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 17) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 18) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 19) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 20) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 21) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 22) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 23) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 24) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 25) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 26) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 27) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 28) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 29) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 30) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 31) {
    //   return MoonData.getMoonColor(energy);
    // } else {
    //   return MoonData.getMoonColor(energy);
    // }
  }

  // getSelected(DateTime day) {
  //   try {
  //     int idx = cycledetasils.indexWhere((element) {
  //       // print(element.startdate);
  //       print( DateFormat("yyyy-MM-dd").format(day).toString());
  //       return element.startdate ==
  //           DateFormat("yyyy-MM-dd").format(day).toString();
  //     });
  //     // update();
  //     print(idx);
  //     if (idx != -1) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     debugPrint("Exception in getSelected Unable to find selection");
  //   }
  // }
  getSelected(DateTime day) {
      try {
        int idx = cycledetasils.indexWhere((element) {
          final rx = (DateFormat("yyyy-MM-dd").parse(element.startdate.toString())).difference(day).inDays;
          print(rx);
          return ((element.startdate ==
              DateFormat("yyyy-MM-dd").format(day).toString()) || (rx < int.parse(MySharedPref.getPeriodLen().toString()) && rx >= 0));
        });
        // update();
        // print(idx);
        if (idx != -1) {
          return true;
        } else {
          return false;
        }
      } catch (e) {
        debugPrint("Exception in getSelected Unable to find selection");
      }
    }

  getIsToday(DateTime day) {
    return DateTime.now().day == day.day && DateTime.now().month == day.month;
  }

  RxBool peroidselected = false.obs;
  selectperoidstart() {
    peroidselected.toggle();
    update();
  }
}

class Month {
  static const january = 1;
  static const february = 2;
  static const march = 3;
  static const april = 4;
  static const may = 5;
  static const june = 6;
  static const july = 7;
  static const august = 8;
  static const september = 9;
  static const october = 10;
  static const november = 11;
  static const december = 12;
}

class CycleDetails {
  String? startdate;
  String? enddate;
  String? month;
  CycleDetails({
    this.startdate,
    this.enddate,
    this.month,
  });
}