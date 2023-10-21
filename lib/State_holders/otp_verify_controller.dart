import 'dart:async';
import 'dart:core';
import 'package:flutter_ecommerce/State_holders/auth_controller.dart';
import 'package:flutter_ecommerce/data/services/network_response.dart';
import 'package:flutter_ecommerce/data/services/network_caller.dart';
import 'package:flutter_ecommerce/data/utils/urls.dart';
import 'package:get/get.dart';

class OTPVerifyController extends GetxController{


  late int seconds;
  late Timer _timer;

  Timer get timer => _timer;

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      seconds == 0 ? _timer.cancel() : seconds--;
      update();
    });
  }



  bool _otpVerifyInProgress = false;
   bool get otpVerifyInProgress => _otpVerifyInProgress;

   Future<bool>otpVerify(String email, String otp)async{

     _otpVerifyInProgress = true;
     update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));

     _otpVerifyInProgress = false;
     update();

    if(response.isSuccess){
      await AuthController.setAccessToken(response.responseJson?["data"]);
      return true;
    }else{
      return false;
    }

   }
}