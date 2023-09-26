import 'dart:convert';
import 'dart:developer';
import 'package:flutter_ecommerce/presentation/ui/screen/home_screen.dart';
import 'package:get/get.dart';
import '../services/network_caller.dart';
import 'package:http/http.dart';

class NetWorkCaller{

  /// get Method
  Future<NetworkResponse> getMethod(String url)async{
    try{
      final response = await get(Uri.parse(url));

      log(response.body);
      log(response.statusCode.toString());

      final Map<String,dynamic> jsonResponse = jsonDecode(response.body);
      if(response.statusCode == 200 && jsonResponse["msg"]== "success"){
        return NetworkResponse(true, response.statusCode, jsonResponse);

      }else if(response.statusCode == 401){
        Get.to(const HomeScreen());
      }else{
        return NetworkResponse(false, response.statusCode, null);
      }
    }catch(e){
      e.toString();
    }
    return NetworkResponse(false, -1, null);
  }
  
  /// Post Method
  Future<NetworkResponse> postMethod(String url,Map<String,dynamic>? body,{bool isHomeScreen = false})async{
    try{
      final response = await post(Uri.parse(url),
        headers: {'Content-Type': 'application/json',},
          body: jsonEncode(body));
      log(response.body);
      log(response.statusCode.toString());
      final Map<String,dynamic> jsonResponse = jsonDecode(response.body);
      if(response.statusCode == 200 && jsonResponse["msg"]== "success"){
        return NetworkResponse(true, response.statusCode, jsonResponse);

      }else if(response.statusCode == 401){
        if(isHomeScreen == false){
          Get.to(const HomeScreen());
        }
      }else{
        return NetworkResponse(false, response.statusCode, null);
      }
    }catch(e){
      e.toString();
    }
    return NetworkResponse(false, -1, null);
  }
}