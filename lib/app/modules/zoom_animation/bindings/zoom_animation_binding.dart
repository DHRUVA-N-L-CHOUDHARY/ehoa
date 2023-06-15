import 'package:ehoa/app/modules/zoom_animation/controllers/zoom_animation_controller.dart';
import 'package:get/get.dart';

class ZoomAnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZoomAnimationController>(
      () => ZoomAnimationController(),
    );
  }
}
