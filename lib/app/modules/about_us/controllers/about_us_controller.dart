import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:get/get.dart';
import '../../../service/base_controller.dart';

class AboutUsController extends GetxController with BaseController {
  RxString aboutShort = MySharedPref.getaboutshort().toString().obs;
  RxString aboutlong = MySharedPref.getaboutlong().toString().obs;
  RxString termsData = MySharedPref.gettermsdata().toString().obs;
  RxString help =MySharedPref.gethelp().toString().obs;
  RxString privacyPolicy = MySharedPref.getprivacypolicy().toString().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // Future getCmsData() async {
  //   isLoading(true);
  //   Map<String, dynamic> cmsdata = await ApiService().showCms();
  //   if (cmsdata.isNotEmpty) {
  //     CMSResponse response = CMSResponse.fromJson(cmsdata);
  //     if (response.showCms != null) {
  //       response.showCms?.cms?.forEach((element) {
  //         if (element.id == 20) {
  //           aboutShort(element.shortDescription.toString());
  //           aboutlong(element.longDescription.toString());
  //         }
  //         if (element.id == 21) {
  //           privacyPolicy(element.longDescription.toString());
  //         }
  //         if (element.id == 22) {
  //           termsData(element.longDescription.toString());
  //         }
  //         if (element.id == 23) {
  //           help(element.longDescription.toString());
  //         }
  //       });
  //     }
  //   }
  //   isLoading(false);
  // }
}
