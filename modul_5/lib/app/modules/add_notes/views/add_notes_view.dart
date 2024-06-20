import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_5/app/utils/resources.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/text_style.dart';
import '../controllers/add_notes_controller.dart';

class AddNotesView extends GetView<AddNotesController> {
  const AddNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddNotesController());
    // controller.accountSession();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Resources.color.primaryColor1,
        title: Text(
          "Add Notes",
          style: StyleText.appBarTitle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.saveNote();
              },
              icon: Icon(
                Icons.check,
                color: Resources.color.whiteColor,
                size: 30,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 8.0, left: 8.0, right: 8.0, bottom: 15.0),
        child: SizedBox(
          child: Card(
            surfaceTintColor: Resources.color.whiteColor,
            elevation: 5.0,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              child: Column(
                children: [
                  SizedBox(
                      width: 100.w, child: Text(controller.getCurrentDate())),
                  TextField(
                    onChanged: (value) => controller.noteTitle.value = value,
                    expands: false,
                    maxLines: 1,
                    minLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        hintText: "Judul", border: InputBorder.none),
                    style: StyleText.noteTitle,
                  ),
                  Expanded(
                    child: Obx(() {
                      final textEditingController = TextEditingController(
                          text: controller.noteContent.value);
                      textEditingController.selection =
                          TextSelection.fromPosition(TextPosition(
                              offset: textEditingController.text.length));
                      return TextField(
                        controller: textEditingController,
                        onChanged: (value) =>
                            controller.noteContent.value = value,
                        maxLines: null,
                        minLines: null,
                        expands: true,
                        autocorrect: true,
                        textAlign: TextAlign.justify,
                        keyboardType: TextInputType.multiline,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Obx(() => FloatingActionButton(
            onPressed: controller.isListening.value
                ? controller.stopListening
                : controller.startListening,
            shape: const CircleBorder(),
            backgroundColor: Resources.color.primaryColor,
            child: Icon(
              controller.isListening.value ? Icons.mic : Icons.mic_outlined,
              color: Resources.color.whiteColor,
              size: 24,
            ),
          )),
    );
  }
}
