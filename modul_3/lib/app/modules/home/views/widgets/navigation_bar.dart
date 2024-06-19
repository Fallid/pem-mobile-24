import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_2/app/modules/home/controllers/home_controller.dart';
import 'package:modul_2/app/modules/home/views/widgets/icon_navigation_bar.dart';
import 'package:modul_2/app/utils/resources.dart';

class CurvedNavigation extends GetView<HomeController> {
  CurvedNavigation({super.key});
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.currentPage),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: <Widget>[
          IconNavigationBar(icon: Icons.home_outlined),
          IconNavigationBar(icon: Icons.add),
          IconNavigationBar(icon: Icons.person),
        ],
        backgroundColor: Resources.color.whiteColor,
        color: Resources.color.primaryColor1,
        onTap: (index) {
          controller.setPage(index);
        },
      ),
    );
  }
}
