import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modul_5/app/data/models/appwrite_model.dart';
import 'package:modul_5/app/data/models/user_client.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class AddNotesController extends ClientController {
  Databases? databases;
  Account? account;
  var noteTitle = ''.obs;
  var noteContent = ''.obs;
  var isListening = false.obs;
  late stt.SpeechToText speechToText;

  @override
  void onInit() {
    super.onInit();
    speechToText = stt.SpeechToText();
    databases = Databases(client);
    account = Account(client);
  }

  void startListening() async {
    bool available = await speechToText.initialize();
    if (available) {
      isListening.value = true;
      speechToText.listen(onResult: (val) {
        noteContent.value += " " + val.recognizedWords;
      });
    }
  }

  void stopListening() {
    speechToText.stop();
    isListening.value = false;
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    DateFormat formatDate = DateFormat.yMMMMEEEEd();
    return formatDate.format(now);
  }

  Future<void> saveNote() async {
    try {
      await databases?.createDocument(
          databaseId: AppWrite.DatabaseId,
          collectionId: AppWrite.CollectionId,
          documentId: ID.custom('docs'),
          data: {
            'title': noteTitle.value,
            'description': noteContent.value,
            'date_created': getCurrentDate(),
          },
          permissions: [
            Permission.update(Role.user("6673fea3003c3bd31648")),
            Permission.delete(Role.user("6673fea3003c3bd31648")),
            Permission.read(Role.user("6673fea3003c3bd31648")),
            Permission.write(Role.user("6673fea3003c3bd31648")),
            // Permission.update(Role.guests()),
            // Permission.delete(Role.guests()),
            // Permission.read(Role.guests()),
            // Permission.write(Role.guests()),
          ]);
      Get.snackbar('Success', 'Note added successfully!',
          backgroundColor: Colors.green[300]);
    } on AppwriteException catch (e) {
      Get.snackbar('Error', 'Failed to add note');
      print(e);
    }
  }
}
