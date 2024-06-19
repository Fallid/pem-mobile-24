import 'package:get/get.dart';
import 'package:modul_2/app/modules/add_notes/controllers/add_notes_controller.dart';

class AddNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNotesController>(
      () => AddNotesController(),
    );
  }
}
