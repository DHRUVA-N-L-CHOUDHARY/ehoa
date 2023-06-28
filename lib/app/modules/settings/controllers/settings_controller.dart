import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/data/remote/api_service.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/app/service/helper/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/base_controller.dart';

class SettingsController extends GetxController with BaseController {
  Future deletuser() async {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "Delete Account",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Do you realy want to Delete Account?",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      //Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              child: const Text(
                                'Cancel',
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 45),
                                primary: Colors.grey,
                                onPrimary: const Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              child: const Text(
                                'Delete Account',
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 45),
                                primary: Colors.grey,
                                onPrimary: const Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () async {
                                try {
                                  Map<String, dynamic> res =
                                      await ApiService().deleteaccount({
                                    "userid": MySharedPref.getUserId(),
                                    "remember_token":
                                        MySharedPref.getToken()
                                  });
                                  if (res.isNotEmpty) {
                                    Get.back();
                                    MySharedPref.clearSession();
                                    Get.offAllNamed(AppPages.INITIAL);
                                  } 
                                  // else {
                                  //   DialogHelper.showErrorDialog(
                                  //       "Request Unsucessful",
                                  //       "Couldnt process your Request");
                                  // }
                                } catch (e) {
                                  DialogHelper.showErrorDialog(
                                      "Try Again", "Couldnt Delete account");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
