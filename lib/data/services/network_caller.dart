import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/auth_controller.dart';
import 'package:flutter_ecommerce/application/app.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/auth/email_verify_screen.dart';
import 'package:http/http.dart';
import 'network_response.dart';

class NetworkCaller {
  /// get request method
  Future<NetworkResponse> getRequest(String url, {bool isLogin = false}) async {
    try {
      Response response = await get(Uri.parse(url),
        headers: {
          "token": AuthController.accessToken.toString()
        }
      );

      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200 &&
          jsonDecode(response.body)['msg'] == 'success') {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        if(isLogin){
          gotoLogin();
        }

      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }


  /// post Method
  Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body,{bool isLogin = false}) async {
    try {
      Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          "token": AuthController.accessToken.toString()
        },
        body: jsonEncode(body),
      );

      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200 &&
          jsonDecode(response.body)['msg'] == 'success') {
        return NetworkResponse(
          true,
          response.statusCode,
          jsonDecode(response.body),
        );
      } else if (response.statusCode == 401) {
        if (isLogin == false) {
          gotoLogin();
        }
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }


  static Future<void> gotoLogin() async {
    await AuthController.clear();
    Navigator.push(
        CraftyBay.globalKey.currentContext!,
        MaterialPageRoute(builder: (context)=> const EmailVerificationScreen()));

  }

}