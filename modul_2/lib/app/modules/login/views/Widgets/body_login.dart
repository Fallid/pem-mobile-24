import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:modul_2/app/modules/login/controllers/login_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/resources.dart';
import '../../../../utils/text_strings.dart';
import '../../../../utils/text_style.dart';

class BodyLogin extends GetView<LoginController> {
  const BodyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height / 1.3,
      decoration: ShapeDecoration(
        color: Resources.color.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 30, 25.0, 25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TextStrings.authTitle2, style: StyleText.authTitle2),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: Get.height / 16,
                width: Get.width,
                child: TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Resources.color.textFieldColor,
                      hintText: TextStrings.authSubtitle1,
                      hintStyle: StyleText.signInField,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Resources.color.textFieldColor),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Resources.color.textFieldColor),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                TextStrings.authTitle3,
                style: StyleText.authTitle2,
              ),
              SizedBox(height: 2.h),
              SizedBox(
                height: Get.height / 16,
                width: Get.width,
                child: Obx(
                  () => TextField(
                    controller: controller.passwordController,
                    obscureText: controller.showPassword.value,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Resources.color.textFieldColor,
                      hintText: TextStrings.authSubtitle1,
                      hintStyle: StyleText.signInField,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Resources.color.textFieldColor),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Resources.color.textFieldColor),
                          borderRadius: BorderRadius.circular(15)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.showPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          controller.toggleObscureText();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: 100.w,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      TextStrings.signInSubtitle1,
                      textAlign: TextAlign.right,
                      style: StyleText.authTextButton,
                    )),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: 1000.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Resources.color.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      Get.offAllNamed(Routes.BOTTOMNAV);
                    },
                    child: Text(
                      TextStrings.signTitle2,
                      style: StyleText.authElevatedButton,
                    )),
              ),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 100.w,
                  child: Text(
                    TextStrings.signInSubtitle2,
                    style: StyleText.authTitle2,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Container(
                  color: Resources.color.whiteColor,
                  width: 100.w,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: IconButton(
                            onPressed: () {
                              print("google clicked");
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.google,
                              color: Resources.color.whiteColor,
                            )),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child: IconButton(
                            onPressed: () {
                              print("apple clicked");
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.apple,
                              color: Resources.color.whiteColor,
                            )),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                            onPressed: () {
                              print("facebook clicked");
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Resources.color.whiteColor,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 100.w,
                  child: SizedBox(
                    width: 70.w,
                    child: TextStrings.authSubtitle4,
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: 100.w,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Belum punya akun? ',
                            style: StyleText.authSubtitle1),
                        TextSpan(
                            text: 'Daftar disini',
                            style: StyleText.authTextButton),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
