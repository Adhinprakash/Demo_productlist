import 'package:demoapp/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  ApiServices apiServices=Get.find<ApiServices>();


  final  usernamecontroller=TextEditingController().obs;
  final passwordcontroller=TextEditingController().obs;

RxBool _isloading=false.obs;
RxBool get isloading =>_isloading;
  final RxBool obscurePassword = true.obs;

  final RxString errorMessage = ''.obs;
void togglePasswordVisibility() {
    obscurePassword.toggle();
  }
Future<void>login()async{
  if (usernamecontroller.value.text.isEmpty || passwordcontroller.value.text.isEmpty) {
      errorMessage.value = 'Please fill all fields';
      return;
    }
  isloading.value =true;
 errorMessage.value = '';

try {
  final result=await apiServices.login(username: usernamecontroller.value.text, password: passwordcontroller.value.text);
  if (result['success']) {
    Get.snackbar( 'Success',
          'Login successful!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,);
          Get.offAllNamed('/productlist');
  }else{
        errorMessage.value = result['message'];

  }
} catch (e) {
        errorMessage.value = 'An error occurred. Please try again.';

}finally{
  isloading.value=false;
}
}



}