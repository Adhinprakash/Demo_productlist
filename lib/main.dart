import 'package:demoapp/view/login_view.dart';
import 'package:demoapp/view/productList_view.dart';
import 'package:demoapp/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: 'login',
      getPages: [
          GetPage(name: '/login', page: () => LoginView()),
      // Create HomePage
      GetPage(name: '/productlist', page: ()=>ProductlistView()),
            GetPage(name: '/productview', page: ()=>ProductView())

      ],
      home:LoginView()
    );
  }
}


