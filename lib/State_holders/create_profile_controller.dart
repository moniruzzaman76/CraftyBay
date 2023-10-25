import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../data/services/network_response.dart';
import '../data/services/network_caller.dart';
import '../data/utils/urls.dart';

class CreateProfileController extends GetxController{

  bool _createProfileInProgress = false;
  bool get createProfileInProgress => _createProfileInProgress;

  String ? _message;
  String ? get message => _message;

  Future<bool>createProfile(
      String cusName,cusAddress,cusCity,cusState,cusPostcode,cusCountry, cusPhone,
      cusFax,shipName,shipAdd,shipCity,shipState,shipPostcode,shipCountry,shipPhone,)async{

    _createProfileInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().postRequest(Urls.createProfile, <String,dynamic>{
      "cus_name": cusName,
      "cus_add": cusAddress,
      "cus_city": cusCity,
      "cus_state": cusState,
      "cus_postcode": cusPostcode,
      "cus_country": cusCountry,
      "cus_phone": cusPhone,
      "cus_fax": cusFax,
      "ship_name": shipName,
      "ship_add": shipAdd,
      "ship_city": shipCity,
      "ship_state": shipState,
      "ship_postcode": shipPostcode,
      "ship_country": shipCountry,
      "ship_phone": shipPhone,
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