
import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/service/helper/dialog_helper.dart';
import 'package:ehoa/config/translations/strings_enum.dart';
import 'package:get/get.dart';

import '../../../data/remote/api_service.dart';

class RemaindersController extends GetxController {
  RxBool isLoading = false.obs;
  List<RemType> rem = List.empty(growable: true);

  @override
  void onInit() {
      getRemainders();
    super.onInit();
   
  }

  Future getRemainders() async {
    try {
      rem.addAll([
        RemType(r_id: "1", scheduled: Strings.tenhrs, status: "0"),
        RemType(r_id: "2", scheduled: Strings.tenhrs, status: "0"),
        RemType(r_id: "3", scheduled: Strings.tenhrs, status: "0"),
        RemType(r_id: "4", scheduled: Strings.tenhrs, status: "0"),
        RemType(r_id: "5", scheduled: Strings.tenhrs, status: "0"),
        RemType(r_id: "6", scheduled: Strings.tenhrs, status: "0"),
        RemType(r_id: "7", scheduled: Strings.tenhrs, status: "0"),
      ]);
      Map<String, dynamic> res =
          await ApiService().getrem(MySharedPref.getUserId().toString());
      // print(res);
      // print(res["reminders"]);
      // if (res.isNotEmpty) {
      res["reminders"].forEach((element) {
        // print(element["r_id"]+"hkj---------------------------------");
        int index =
            rem.indexWhere((item) => item.r_id == element["r_id"].toString());

        if (index != -1) {
          rem[index] = RemType(
              r_id: element["r_id"].toString(),
              scheduled: element["scheduled"].toString(),
              status: element["status"].toString());
        }
      });
      isLoading(false);
      update();
    } catch (e) {
      DialogHelper.showErrorDialog(
          "Server Error", "Check You Internet Connection");
    }
  }

  String maprem(String r_id) {
    if (r_id == "1") {
      return Strings.day1to3;
    } else if (r_id == "2") {
      return Strings.day4to6;
    } else if (r_id == "3") {
      return Strings.day7to12;
    } else if (r_id == "4") {
      return Strings.day13to16;
    } else if (r_id == "5") {
      return Strings.day17to23;
    } else if (r_id == "6") {
      return Strings.day24to28or35;
    } else {
      return Strings.cstmsg;
    }
  }

  @override
  void dispose() {
    rem.clear();
    super.dispose();
  }
}

class RemType {
  final String? r_id;
  final String? scheduled;
  final String? status;

  RemType({this.r_id, this.scheduled, this.status});
}
