import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_5/app/data/models/user_client.dart';

import '../../../data/models/note_model.dart';
import '../../add_notes/views/add_notes_view.dart';
import '../../news/views/news_view.dart';
import '../../profile/views/profile_view.dart';
import '../views/home_view.dart';

class HomeController extends ClientController {
  var pageIndex = 0.obs;

  Databases? databases;

  List<Widget> pages = [
    HomeView(),
    AddNotesView(),
    NewsView(),
    ProfileView(),
  ];

  void setPage(int index) {
    pageIndex.value = index;
  }

  Widget get currentPage => pages[pageIndex.value];
  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> deleteNote(String documentId) async {
    try {
      await databases!.deleteDocument(
        databaseId: 'db_mobile',
        collectionId: 'collect_mobile',
        documentId: documentId,
      );
      notes.removeWhere((note) => note.id == documentId);
      Get.snackbar('Success', 'Note deleted successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete note');
    }
  }

  Future<void> editNote(
      String id, String title, String description, String date) async {
    try {
      await databases!.updateDocument(
        databaseId: 'db_mobile',
        collectionId: 'collect_mobile',
        documentId: id,
        data: {
          'title': title,
          'description': description,
        },
      );
      int index = notes.indexWhere((n) => n.id == id);
      if (index != -1) {
        notes[index] = Note(
          id: id,
          title: title,
          description: description,
          dateCreated: date,
        );
      }
      Get.snackbar('Success', 'Note edited successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to edit note');
    }
  }
}
