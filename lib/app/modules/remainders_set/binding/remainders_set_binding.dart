import 'package:ehoa/app/modules/remainders_set/controllers/remainders_set_controller.dart';
import 'package:get/get.dart';

class RemaindersSetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemaindersSetController>(
      () => RemaindersSetController(),
    );
  }
}
