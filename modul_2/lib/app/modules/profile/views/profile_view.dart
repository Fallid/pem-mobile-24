import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_2/app/modules/profile/controllers/profile_controller.dart';
import 'package:modul_2/app/utils/resources.dart';
import 'package:modul_2/app/utils/text_style.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Resources.color.whiteColor,
      appBar: AppBar(
        backgroundColor: Resources.color.primaryColor1,
        title: Text(
          "Profile",
          style: StyleText.appBarTitle,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout_outlined,
                color: Resources.color.whiteColor,
                size: 30.0,
              ))
        ],
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  profilePicture(),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      "Nama Lengkap",
                      style: TextStyle(
                          color: Resources.color.titleColor,
                          fontSize: 12.sp,
                          fontFamily: Resources.font.primaryFont,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Resources.color.primaryColor),
                      height: 7.h,
                      width: 100.w,
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                            fontSize: 14,
                            color: Resources.color.textFieldColor),
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      )),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      "Email",
                      style: TextStyle(
                          color: Resources.color.titleColor,
                          fontSize: 12.sp,
                          fontFamily: Resources.font.primaryFont,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Resources.color.primaryColor),
                      height: 7.h,
                      width: 100.w,
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                            fontSize: 14,
                            color: Resources.color.textFieldColor),
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      )),
                ],
              ),
            ),
          )),
    );
  }

  Column profilePicture() {
    return Column(
      children: [
        Obx(() => controller.imageFile.value == null
            ? const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/person.png'),
              )
            : Container(
                height: 20.h,
                width: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: FileImage(controller.imageFile.value!),
                      fit: BoxFit.cover),
                ),
              )),
        SizedBox(
          height: 0.5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  await controller.pickImageFileFromGallery();
                },
                icon: Icon(
                  Icons.photo_size_select_actual_rounded,
                  color: Resources.color.primaryColor,
                  size: 4.h,
                )),
            IconButton(
                onPressed: () async {
                  await controller.pickImageFileFromCamera();
                },
                icon: Icon(
                  Icons.camera_alt,
                  color: Resources.color.primaryColor,
                  size: 4.h,
                )),
          ],
        )
      ],
    );
  }
}
