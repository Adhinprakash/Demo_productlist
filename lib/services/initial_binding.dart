import 'package:demoapp/services/api_services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Register app-wide services
    Get.put<ApiServices>(ApiServices(), permanent: true);
  }
}