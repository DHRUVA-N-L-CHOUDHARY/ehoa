import 'package:ehoa/app/modules/remainders/controllers/remainder_controller.dart';
import 'package:get/get.dart';

class RemaindersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemaindersController>(
      () => RemaindersController(),
    );
  }
}
