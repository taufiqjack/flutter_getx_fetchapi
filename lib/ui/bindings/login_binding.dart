import 'package:flutter_getx_fetchapi/ui/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
