import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../data/model/network_response.dart';
import '../data/services/network_caller.dart';
import '../data/utils/urls.dart';

class CompleteProfileController extends GetxController{
  bool _createProfileInProgress = false;
  bool get createProfileInProgress => _createProfileInProgress;

  String ? _message;
  String ? get message => _message;

  Future<bool>createProfile(String firstName, lastName, mobile,city,shippingAddress)async{
    _createProfileInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().postRequest(Urls.createProfile, <String,dynamic>{
      "firstName":firstName,
      "lastName":lastName,
      "mobile":mobile,
      "city":city,
      "shippingAddress": shippingAddress,
    });

    _createProfileInProgress = false;

    if(response.isSuccess){
      update();
      return true;
    }else{
      _message = "failed.try again";
      return false;
    }

  }
}