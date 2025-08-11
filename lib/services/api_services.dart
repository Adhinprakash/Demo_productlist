import 'dart:convert';

import 'package:demoapp/utils/endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
class ApiServices extends GetxService{

  Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<Map<String,dynamic>>login({required String username,required String password})async{
    print(username);
print(password);

final url=buildBaseUrl('/auth/login');


try {
  final response=await http.post(url,body: jsonEncode({
    'username':username,
    'password':password
  }),headers: headers);
if (response.statusCode==200) {
  return {
    "success":true,
    'data':json.decode(response.body)
  };
}
else {
        return {
          'success': false,
          'message': 'Login failed. Please check your credentials.',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error. Please try again.',
      };
    }

} 
  



  }
