import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:modul_2/app/modules/add_notes/controllers/add_notes_controller.dart';

class AddNotesView extends GetView<AddNotesController> {
  const AddNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Add Notes page"),
    );
  }
}
