import 'package:demoapp/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  ApiServices apiServices=Get.find<ApiServices>();


  final  usernamecontroller=TextEditingController().obs;
  final passwordcontroller=TextEditingController().obs;

RxBool _isloading=false.obs;
RxBool get isloading =>_isloading;
  final RxBool obscurePassword = true.obs;

  final RxString errorMessage = ''.obs;
final RxBool _isloggedin=false.obs;
RxBool get isloggedin =>isloggedin;
  final storage = const FlutterSecureStorage();

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkLoginstatus();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    usernamecontroller.close();
    passwordcontroller.close();
    super.onClose();
  }


  Future<void>checkLoginstatus()async{
String? storevalue=await storage.read(key: "isLoggedIn");
   _isloggedin.value= storevalue=="true";
   if(_isloggedin.value){
    Get.offAllNamed("/productlist");
   }

  }
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

  await storage.write(key: 'isLoggedIn', value: 'true');
        _isloggedin.value = true;

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