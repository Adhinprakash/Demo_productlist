import 'package:demoapp/components/primary_button.dart';
import 'package:demoapp/controller/auth_controller.dart';
import 'package:demoapp/utils/constant.dart';
import 'package:demoapp/view/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
      final AuthController controller = Get.put(AuthController());

    return  Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      "Sign in with your Username and password  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF757575)),
                    ),
                    // const SizedBox(height: 16),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      SizedBox(
                          height: 300,
                          child: Lottie.asset(
                            'assets/animations/animation1.json',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 16),
                    Column(
                      children: [
                        //    InputTextField(
                        //   controller: controller.usernamecontroller.value,
                        //   hintText: "Enter your username",
                        //   labelText: "Username",
                        //   svgIcon: mailIcon,
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter your username';
                        //     }
                        //     return null;
                        //   },
                        // ),
                         TextField(
                        controller: controller.usernamecontroller.value,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          prefixIcon: const Icon(Icons.person_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                      ),
                      const SizedBox(height: 30),
                     Obx(
                        () => TextFormField(
                          controller: controller.passwordcontroller.value,
                          obscureText: controller.obscurePassword.value,
                          
                          decoration: InputDecoration(
                            labelText: 'Password',
                            
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.obscurePassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                        Obx(
                        () => controller.errorMessage.value.isNotEmpty
                            ? Container(
                                margin: const EdgeInsets.only(top: 8),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.red[50],
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.red[200]!),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.error_outline, 
                                        color: Colors.red[600], size: 20),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        controller.errorMessage.value,
                                        style: TextStyle(
                                          color: Colors.red[600],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                      const SizedBox(height: 24),

                     Obx(
                        () => SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: controller.isloading.value
                                ? null
                                : controller.login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[600],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                            child: controller.isloading.value
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  )
                                : const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),))
                        // Obx(() {
                        //   return ElevatedButton(
                        //     onPressed: () async {
                        //       if (_formKey.currentState!.validate()) {
                        //         loginController.login();
                        //       }
                        //     },
                        //     style: ElevatedButton.styleFrom(
                        //       elevation: 0,
                        //       backgroundColor: Colors.blue,
                        //       foregroundColor: Colors.white,
                        //       minimumSize: const Size(double.infinity, 48),
                        //       shape: const RoundedRectangleBorder(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(16)),
                        //       ),
                        //     ),
                           
                        //     child: loginController.isloading.value
                        //         ? const CircularProgressIndicator(color: Colors.white,)
                        //         : const Text('Login'),
                        //   );
                        // })
                      ],
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                 const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.black),
                          ),
                         Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child:InkWell(
                            onTap: () => Get.offAllNamed('/register'),
                            child:  Text(
                            "SignUp",
                            style: TextStyle(color: Colors.blue),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
  
}
const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(100)),
);