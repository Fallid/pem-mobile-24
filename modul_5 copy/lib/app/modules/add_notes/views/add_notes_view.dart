import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:modul_2/app/modules/add_notes/controllers/add_notes_controller.dart';
import 'package:modul_2/app/utils/text_style.dart';

class AddNotesView extends GetView<AddNotesController> {
  const AddNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Add Notes",
        style: StyleText.appBarTitle,
      )),
      body: Text("Add Notes page"),
    );
  }
}
