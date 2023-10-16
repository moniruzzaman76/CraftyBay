import 'package:flutter_ecommerce/data/model/read_profile_model.dart';
import 'package:get/get.dart';
import '../data/model/network_response.dart';
import '../data/services/network_caller.dart';
import '../data/utils/urls.dart';

class ReadProfileController extends GetxController{

 ReadProfileModel _readProfileModel = ReadProfileModel();
 ReadProfileModel get readProfileModel => _readProfileModel;

  String _message = " ";
  String get message =>_message;

  Future<bool>readProfile()async{
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.readProfile);
    if(response.isSuccess){
      _readProfileModel = ReadProfileModel.fromJson(response.responseJson ?? {});
      return true;
    }else{
      update();
      _message = "Read profile data fetch failed!";
      return false;
    }
  }

}