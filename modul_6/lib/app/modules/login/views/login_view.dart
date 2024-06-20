import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/resources.dart';
import '../../../utils/text_strings.dart';
import '../../../utils/text_style.dart';
import '../controllers/login_controller.dart';
import 'Widgets/body_login.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: Get.width,
          height: Get.height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Resources.color.whiteColor,
          ),
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.00, -1.00),
                      end: const Alignment(0, 0.5),
                      colors: [
                        Resources.color.primaryColor,
                        Resources.color.primaryColorOnGradient,
                      ],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: TextStrings.authTitle1,
                                style: StyleText.authTitle1),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        width: 90.w,
                        child: Text(TextStrings.signInTitle1,
                            style: StyleText.authSubtitle1),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const BodyLogin(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      },
    );
  }
}
