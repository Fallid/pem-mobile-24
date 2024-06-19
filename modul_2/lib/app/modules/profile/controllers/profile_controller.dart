import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  Rxn<File> imageFile = Rxn<File>();

  TextEditingController profileNameTextEditController = TextEditingController();
  TextEditingController profileBioTextEditController = TextEditingController();

  pickImageFileFromGallery() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
        Get.snackbar(
            "Profile Image", "Successfully uploaded image from gallery");
      }
    } catch (err) {
      Get.snackbar("Profile Image", "You didn't select an image!");
    }
  }

  pickImageFileFromCamera() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
        Get.snackbar(
            "Profile Image", "Successfully uploaded image from camera");
      }
    } catch (err) {
      Get.snackbar("Profile Image", "You didn't select an image!");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
