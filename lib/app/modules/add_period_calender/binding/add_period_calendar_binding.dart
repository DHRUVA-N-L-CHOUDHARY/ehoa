import 'package:ehoa/app/modules/add_period_calender/controller/add_period_controller.dart';
import 'package:get/get.dart';


class AddPeriodCalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPeriodCalendarController>(
      () => AddPeriodCalendarController(),
    );
  }
}
