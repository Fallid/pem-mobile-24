import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:modul_2/app/modules/home/controllers/home_controller.dart';
import 'package:modul_2/app/utils/resources.dart';
import 'package:modul_2/app/utils/text_style.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Resources.color.primaryColor1,
        title: Text(
          "Voice Organizer",
          style: StyleText.appBarTitle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: const Text("Home Page"),
    );
  }
}
