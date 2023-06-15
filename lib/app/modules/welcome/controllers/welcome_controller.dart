import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class WelcomeController extends GetxController {
  RxBool? isFirstConditionChecked = false.obs;
  RxBool? isSecondConditionChecked = false.obs;

 VideoPlayerController controller = VideoPlayerController.network("");
  late Future<void> initializeVideoPlayerFuture;

  @override
  void onInit() {
    super.onInit();
    controller = VideoPlayerController.network(
        'https://www.pexels.com/video/tagging-pictures-on-the-mood-board-on-its-essence-3831869/'); // Replace with your video URL
    initializeVideoPlayerFuture = controller.initialize();
    controller.setLooping(false);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isAnimationCompleted = false;

 
}
