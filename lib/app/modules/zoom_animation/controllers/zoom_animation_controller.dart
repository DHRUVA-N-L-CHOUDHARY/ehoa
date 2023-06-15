import 'package:ehoa/app/data/models/animation_model.dart';
import 'package:get/get.dart';

class ZoomAnimationController extends GetxController {
  AnimationModel? animationModel;
  RxBool isLoading = false.obs;
  void updateanim(String energy, String energydescri, List<String> zoomcrt) {
    animationModel = AnimationModel(
        assetcurt: zoomcrt, energy: energy, energydescri: energydescri);
  }
  void resetanim()
  {
    animationModel = null;
  }
  void updatesucess(bool issucess)
  {
    issucess = (!issucess);
  }
}
