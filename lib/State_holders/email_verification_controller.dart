import 'package:flutter_ecommerce/data/model/network_response.dart';
import 'package:flutter_ecommerce/data/services/network_caller.dart';
import 'package:flutter_ecommerce/data/utils/urls.dart';
import 'package:get/get.dart';

class EmailVerifyController extends GetxController{

  bool _emailVerifyInProgress = false;
  bool get emailVerifyInProgress => _emailVerifyInProgress;

  Future<bool>emailVerify(String email)async{

    _emailVerifyInProgress =true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.verifyEmail(email));

    _emailVerifyInProgress =false;
    update();

    if(response.isSuccess){
      return true;
    }else{
      _emailVerifyInProgress =false;
      update();
      return false;
    }
  }
}