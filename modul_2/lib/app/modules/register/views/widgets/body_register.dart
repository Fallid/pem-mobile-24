import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_2/app/modules/register/controllers/register_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/resources.dart';
import '../../../../utils/text_strings.dart';
import '../../../../utils/text_style.dart';

class BodyRegister extends GetView<RegisterController> {
  const BodyRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: ShapeDecoration(
          color: Resources.color.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 30, 25.0, 25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextStrings.authTitle4,
                style: StyleText.authTitle2,
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: Get.height / 16,
                width: Get.width,
                child: TextField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Resources.color.textFieldColor,
                      hintText: TextStrings.authSubtitle3,
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
                TextStrings.authTitle2,
                style: StyleText.authTitle2,
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: Get.height / 16,
                width: Get.width,
                child: TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
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
                TextStrings.authTitle5,
                style: StyleText.authTitle2,
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: Get.height / 16,
                width: Get.width,
                child: TextField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Resources.color.textFieldColor,
                      hintText: "Masukkan Nomor Telp",
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
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => SizedBox(
                  height: Get.height / 16,
                  width: Get.width,
                  child: TextField(
                    controller: controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: controller.showPassword.value,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Resources.color.textFieldColor,
                      hintText: TextStrings.authSubtitle2,
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
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: 1000.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Resources.color.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Get.offAllNamed(Routes.BOTTOMNAV);
                    },
                    child: Text(
                      TextStrings.signUpTitle2,
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
                  child: SizedBox(
                    width: 70.w,
                    child: TextStrings.authSubtitle4,
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Center(
                child: SizedBox(
                  width: 100.w,
                  child: GestureDetector(
                    onTap: () {
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Sudah punya akun? ',
                              style: StyleText.authSubtitle1),
                          TextSpan(
                              text: 'Masuk disini',
                              style: StyleText.authTextButton),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
