import 'package:ehoa/app/modules/remainders_set/controllers/edit_remainder_set_controller.dart';
import 'package:get/get.dart';

class EditRemaindersSetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditRemaindersSetController>(
      () => EditRemaindersSetController(),
    );
  }
}
