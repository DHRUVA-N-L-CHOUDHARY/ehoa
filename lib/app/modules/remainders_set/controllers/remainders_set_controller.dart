import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/data/remote/api_service.dart';
import 'package:ehoa/app/service/helper/dialog_helper.dart';
import 'package:ehoa/config/translations/strings_enum.dart';
import 'package:get/get.dart';

class RemaindersSetController extends GetxController
{
  
  String data = Get.arguments["data"].toString() ?? "";
  String status = Get.arguments["status"].toString() ?? "";
  String time = Get.arguments["time"].toString() ?? "";
  RxBool isLoading = false.obs;

  @override
  void onInit()
  {
    print(data+"-----"+status+"------"+time);
    super.onInit();
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

  @override
  void dispose()
  {
    Get.arguments.dispose();
    super.dispose();
  }
  Future saveProfile(String index) async {
    isLoading(true);
    try{
      print(maprid());
    Map<String,dynamic> res = await ApiService().savestatus(index,MySharedPref.getUserId(),maprid());
    print(res);
    isLoading(false);
    update();
    }
    catch(e){
      DialogHelper.showErrorDialog("Server Error", "Check You Internet Connection");
    }
    Future.delayed(
      const Duration(milliseconds: 500),
    );
  }
}