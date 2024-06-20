import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/resources.dart';
import '../../controllers/home_controller.dart';
import 'icon_navigation_bar.dart';

class CurvedNavigation extends GetView<HomeController> {
  CurvedNavigation({super.key});
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.currentPage),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: const <Widget>[
          IconNavigationBar(icon: Icons.home_outlined),
          IconNavigationBar(icon: Icons.add),
          IconNavigationBar(icon: Icons.newspaper_rounded),
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
