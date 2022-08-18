import 'package:flutter_getx_fetchapi/ui/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataController>(
      () => DataController(),
    );
  }
}
