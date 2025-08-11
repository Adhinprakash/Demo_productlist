import 'package:demoapp/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // ApiServices is already registered in InitialBinding
    Get.lazyPut<AuthController>(() => AuthController());
  }
}