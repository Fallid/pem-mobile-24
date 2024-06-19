import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_2/app/modules/add_notes/views/add_notes_view.dart';
import 'package:modul_2/app/modules/profile/views/profile_view.dart';

import '../views/home_view.dart';

class HomeController extends GetxController {
  var pageIndex = 0.obs;

  List<Widget> pages = [
    HomeView(),
    AddNotesView(),
    ProfileView(),
  ];

  void setPage(int index) {
    pageIndex.value = index;
  }

  Widget get currentPage => pages[pageIndex.value];
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
