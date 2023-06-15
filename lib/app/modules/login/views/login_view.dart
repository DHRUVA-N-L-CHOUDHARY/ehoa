// ignore_for_file: must_be_immutable

import 'package:ehoa/app/components/app_icon_btn.dart';
import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/data/remote/api_service.dart';
import 'package:ehoa/app/modules/login/controllers/login_controller.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spring/spring.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../components/app_outlined_btn.dart';
import '../../../components/app_text_field.dart';
import '../../../components/headings.dart';
import '../../../components/sizedbox_util.dart';
import '../../../components/utility_widgets.dart';
import '../../tnc/views/tnc_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (c) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppImages.kLoginBkg)),
        ),
        child: Obx(() => baseBody(
            c.isLoading.value,
            Scaffold(
              backgroundColor: Colors.transparent,
              body: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: c.isAnimationCompleted
                                ? createAccView(c)
                                : FadeInAnimation(
                                    child: createAccView(c),
                                    animDuration:
                                        AppConstants.appUiAnimationDuration,
                                    animStatus: (status) {
                                      if (status == AnimStatus.completed) {
                                        c.isAnimationCompleted = true;
                                      }
                                    },
                                  )),
                      ],
                    ),
                  ),
                ],
              ),
            ))),
      );
    });
  }

  Widget createAccView(LoginController c) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox(
            height: 30,
          ),
          backIcon(onTap: () {
            Get.back();
          }),
          sizedBox(
            height: 24,
          ),
          headingText(Strings.welcomeBack.tr),
          sizedBox(
            height: 16,
          ),
          subHeadingText(Strings.loginSubTxt.tr),
          sizedBox(
            height: 71,
          ),
          AppTextField(
            controller: c.emailController,
            labelText: Strings.email.tr,
          ),
          sizedBox(
            height: 20,
          ),
          AppTextField.password(
            controller: c.passwordController,
            labelText: Strings.pwd.tr,
          ),
          InkWell(
            onTap: () {
              c.forgotPassword();
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(Strings.forgotStr.tr,
                    style: MyStyles.getTextStyle(
                        fontSize: 14.0, fontFamily: AppFonts.kInterSemibold)),
              ),
            ),
          ),
          sizedBox(height: 60),
          AppOutlineButton(
            btnText: Strings.loginTxt.tr,
            ontap: () {
              c.login();
            },
          ),
          sizedBox(
            height: 34,
          ),
          divider(),
          sizedBox(
            height: 30,
          ),
          socialLoginButton(),
        ]);
  }

  Widget socialLoginButton() {
    return GetBuilder<LoginController>(builder: (c) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AppIconButton(
              icon: const Icon(
                Ionicons.logo_google,
                color: Colors.red,
              ),
              onTap: () {
                c.socialloginController.signInWithGoogle().then((value) {
                  Map<String, dynamic> data = {
                    "email": value.user?.email,
                    "password": value.user?.uid
                        .replaceRange(8, value.user?.uid.length, ''),
                  };
                  ApiService().existingSocialUserlogin(data).then((value1) {
                    c.socialLogin(value1);
                  });
                });
              },
            ),
          ),
          sizedBox(
            width: 16,
          ),
          Expanded(
              child: AppIconButton(
            icon: const Icon(
              Icons.apple,
              color: Colors.black,
            ),
            onTap: () {
              c.socialloginController.signInWithApple().then((value) {
                Map<String, dynamic> data = {
                  "email": value.user?.email,
                  "password": value.user?.uid
                      .replaceRange(8, value.user?.uid.length, ''),
                };
                ApiService().existingSocialUserlogin(data).then((value1) {
                  c.socialLogin(value1);
                });
              });
            },
          )),
          sizedBox(
            width: 16,
          ),
          Expanded(
            child: AppIconButton(
              icon: const Icon(Icons.facebook),
              onTap: () {
                c.socialloginController.facebooklogin().then((value) {
                  Map<String, dynamic> data = {
                    "email": value.user?.email,
                    "password": value.user?.uid
                        .replaceRange(8, value.user?.uid.length, ''),
                  };
                  ApiService().existingSocialUserlogin(data).then((value1) {
                    c.socialLogin(value1);
                  });
                });
              },
            ),
          )
        ],
      );
    });
  }
}
