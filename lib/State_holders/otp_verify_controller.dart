import 'dart:core';
import 'package:flutter_ecommerce/data/model/network_response.dart';
import 'package:flutter_ecommerce/data/services/network_caller.dart';
import 'package:flutter_ecommerce/data/utils/urls.dart';
import 'package:get/get.dart';

class OTPVerifyController extends GetxController{
  bool _otpVerifyInProgress = false;
   bool get otpVerifyInProgress => _otpVerifyInProgress;

   Future<bool>otpVerify(String email, String otp)async{

     _otpVerifyInProgress = true;
     update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));

     _otpVerifyInProgress = false;
     update();

    if(response.isSuccess){
      return true;
    }else{
      return false;
    }

   }
}