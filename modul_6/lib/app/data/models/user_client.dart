import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';

import 'appwrite_model.dart';
import 'note_model.dart';

class ClientController extends GetxController {
  Client client = Client();
  var notes = <Note>[].obs;
  var isLoading = false.obs;
  RxList<Document> documentList = <Document>[].obs;
  Databases? databases;
  Storage? storages;

  @override
  void onInit() {
    super.onInit();
    // appwrite
    client
        .setEndpoint(AppWrite.Endpoint)
        .setProject(AppWrite.ProjectId)
        .setSelfSigned(status: true);

    databases = Databases(client);
    storages = Storage(client);
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    isLoading.value = true;
    try {
      var response = await databases!.listDocuments(
        databaseId: AppWrite.DatabaseId,
        collectionId: AppWrite.CollectionId,
      );
      documentList.assignAll(response.documents);
      print(documentList);
    } on AppwriteException catch (e) {
      Get.snackbar('Error', 'Failed to fetch notes');
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
  // Future<void> fetchDiscussion() async {
  //   try {
  //     var response = await databases!.listDocuments(
  //         collectionId: AppWrite.CollectionId, databaseId: AppWrite.DatabaseId);
  //     disscussion.assignAll(response.documents);
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //   }
  // }
}

// Client client = Client();
// client
//     .setEndpoint('https://cloud.appwrite.io/v1')
//     .setProject('66739ad900042824755c')
//     .setSelfSigned(status: true); // For self signed certificates, only use for development