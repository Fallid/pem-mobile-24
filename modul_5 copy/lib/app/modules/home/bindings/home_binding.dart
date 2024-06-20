import 'package:get/get.dart';
import 'package:modul_2/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings{
@override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}