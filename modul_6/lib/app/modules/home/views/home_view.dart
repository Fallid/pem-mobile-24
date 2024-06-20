import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/resources.dart';
import '../../../utils/text_style.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.fetchNotes();
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
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.documentList.isEmpty) {
          return const Center(child: Text("No notes found."));
        }

        return ListView.builder(
          itemCount: controller.documentList.length,
          itemBuilder: (context, index) {
            final note = controller.documentList[index];
            return GestureDetector(
              onLongPress: () {
                _showOptionsDialog(context, note.$id, note.data);
              },
              child: Card(
                surfaceTintColor: Resources.color.whiteColor,
                shadowColor: Resources.color.hintColor,
                borderOnForeground: false,
                elevation: 4.0,
                color: Resources.color.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(
                                Icons.date_range_outlined,
                                color: Resources.color.hintColor,
                              ),
                              Text(
                                note.data['date_created'],
                                style:
                                    TextStyle(color: Resources.color.hintColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        note.data['title'],
                        style: TextStyle(
                            fontFamily: Resources.font.primaryFont,
                            fontSize: 12.sp),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        note.data['description'].isEmpty
                            ? 'No description'
                            : note.data['description'],
                        style: TextStyle(
                            color: Resources.color.subtitleColor,
                            fontSize: 10.sp),
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  void _showOptionsDialog(BuildContext context, String note, Map documentlist) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Options"),
          content: const Text("Do you want to delete or edit this note?"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                _showEditDialog(context, documentlist, note);
              },
              child: const Text("Edit"),
            ),
            TextButton(
              onPressed: () {
                controller.deleteNote(note);
                Get.back();
              },
              child: const Text("Delete"),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, Map documentList, String id) {
    final titleController = TextEditingController(text: documentList['title']);
    final descriptionController =
        TextEditingController(text: documentList['description']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Note"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
                maxLines: null,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                controller.editNote(id, titleController.text,
                    descriptionController.text, documentList['date_created']);
                Get.back();
              },
              child: const Text("Save"),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
