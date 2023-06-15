import 'package:ehoa/app/modules/post_animation/controller/post_animation_controller.dart';
import 'package:get/get.dart';


class PostAnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostAnimationController>(
      () => PostAnimationController(),
    );
  }
}
