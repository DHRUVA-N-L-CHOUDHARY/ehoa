import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/data/remote/api_service.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/app/service/helper/dialog_helper.dart';
import 'package:ehoa/config/translations/strings_enum.dart';
import 'package:get/get.dart';

class EditRemaindersSetController extends GetxController
{
  String data = Get.arguments["data"].toString() ?? "";
  List<int> list = List.empty(growable: true);
  RxString selectedAge = "2".obs;
  String status = "0";

  @override
  void onInit() {
    super.onInit();
    getYearsList();
    // selectedAge(Get.arguments.toString().isEmpty?"10":Get.arguments);
    selectedAge();
    update();
  }

  String maprid()
  {
   print(data);
    if(data == Strings.day1to3)
    {
      return "1";
    }
    else if(data == Strings.day4to6)
    {
      return "2";
    }
    else if(data == Strings.day7to12)
    {
      return "3";
    }
    else if(data == Strings.day13to16)
    {
      return "4";
    }
    else if(data == Strings.day17to23)
    {
      return "5";
    }
    else if(data == Strings.day24to28or35)
    {
      return "6";
    }
    else if(data == Strings.cstmsg)
    {
      return "7";
    }
    else
    {
      return "0";
    }
  }
  void getYearsList() {
    int currhr = DateTime.now().hour;
    int hundredYearsBack = 0;
    for (var i = 0; i < 24; i++) {
      list.add(hundredYearsBack);
      hundredYearsBack++;
    }
    // list.add(currhr);
  }

  RxBool isLoading = false.obs;

  Future saveProfile() async {
    isLoading(true);
    try{
    Map<String,dynamic> res = await ApiService().Saverem("1",MySharedPref.getUserId(),maprid(),selectedAge.value, MySharedPref.getFcmToken() ?? "inital");
    print(res);
    isLoading(false);
    update();
    }
    catch(e){
      DialogHelper.showErrorDialog("Server Error", "Check You Internet Connection");
    }
    Future.delayed(
      const Duration(milliseconds: 500),
      () => Get.offAllNamed(AppPages.MENU),
    );
  }
}